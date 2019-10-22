From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Tue, 22 Oct 2019 13:44:08 +0000
Subject: [Buildroot] [PATCH v2 2/2] package/ofono: use target ell library if
 enabled
In-Reply-To: <20191022134341.34426-1-nicolas.serafini@sensefly.com>
References: <20191022134341.34426-1-nicolas.serafini@sensefly.com>
Message-ID: <20191022134341.34426-2-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>

---
Changes v1 -> v2:
  - Remove forced autoreconf into another patch
  - Add missing OFONO_DEPENDENCIES
  - Add disable option if ell is not selected

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/ofono/ofono.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 756998687b..00c5ffbbe4 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -49,5 +49,11 @@ else
 OFONO_CONF_OPTS += --disable-bluetooth
 endif
 
+ifeq ($(BR2_PACKAGE_ELL),y)
+OFONO_DEPENDENCIES += ell
+OFONO_CONF_OPTS += --enable-external-ell
+else
+OFONO_CONF_OPTS += --disable-external-ell
+endif
 
 $(eval $(autotools-package))
-- 
2.23.0
