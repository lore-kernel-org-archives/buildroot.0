From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Tue, 22 Oct 2019 10:48:31 +0000
Subject: [Buildroot] [PATCH] package/ofono: use target ell library if enabled
Message-ID: <20191022104757.109356-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/ofono/ofono.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index ce05dfcadf..85e249a233 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -49,7 +49,9 @@ else
 OFONO_CONF_OPTS += --disable-bluetooth
 endif
 
-# required by 0003-build-Add-check-for-explicit_bzero-support.patch
+ifeq ($(BR2_PACKAGE_ELL),y)
 OFONO_AUTORECONF = YES
+OFONO_CONF_OPTS += --enable-external-ell
+endif
 
 $(eval $(autotools-package))
-- 
2.23.0
