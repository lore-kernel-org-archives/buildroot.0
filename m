From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Oct 2015 22:29:32 +0200
Subject: [Buildroot] [PATCH v4 16/35] package/efl/libefl: enable xinput2.2
In-Reply-To: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445200191-18404-17-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

X11 XInput v2.2+ support is one of the recommended
feature for the efl libraries:
https://git.enlightenment.org/core/efl.git/tree/README?h=efl-1.15#n490

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: rename to libefl
    improve commit log
v3: new patch
---
 package/efl/libefl/libefl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index e275699..02c9005 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -173,10 +173,12 @@ else
 LIBEFL_CONF_OPTS += --enable-fb=no
 endif
 
+# --enable-xinput22 is recommended
 ifeq ($(BR2_PACKAGE_LIBEFL_X),y)
 LIBEFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib
+	--x-libraries=$(STAGING_DIR)/usr/lib \
+	--enable-xinput22
 
 LIBEFL_DEPENDENCIES += \
 	xlib_libX11 \
-- 
2.4.3
