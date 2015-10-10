From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:24 +0200
Subject: [Buildroot] [PATCH v3 19/37] package/efl: enable xinput2.2
In-Reply-To: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1444471422-15118-20-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.enlightenment.org/core/efl.git/tree/README?h=efl-1.15#n490

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v3: new patch
---
 package/efl/efl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index d720d7b..5073c48 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -171,10 +171,12 @@ else
 EFL_CONF_OPTS += --enable-fb=no
 endif
 
+# --enable-xinput22 is recommended
 ifeq ($(BR2_PACKAGE_EFL_X),y)
 EFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib
+	--x-libraries=$(STAGING_DIR)/usr/lib \
+	--enable-xinput22
 
 EFL_DEPENDENCIES += \
 	xlib_libX11 \
-- 
2.4.3
