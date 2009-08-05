From: Nigel Kukard <nkukard@lbsd.net>
Date: Wed, 5 Aug 2009 12:11:08 +0000
Subject: [Buildroot] [git commit] Build neon with SSL support if available
Message-ID: <20090805124451.C9463777DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9f96221e5e8bb085d2fa805e1d63cd24455488a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 package/neon/neon.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 2e1da07..7f7f391 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -32,6 +32,13 @@ ifeq ($(BR2_PACKAGE_NEON_NOXML),y)
 NEON_CONF_OPT+=--disable-webdav
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+NEON_CONF_OPT+=--with-ssl
+NEON_DEPENDENCIES+=openssl
+else
+NEON_CONF_OPT+=--without-ssl
+endif
+
 $(eval $(call AUTOTARGETS,package,neon))
 
 ifeq ($(BR2_ENABLE_DEBUG),)
-- 
1.6.3.3
