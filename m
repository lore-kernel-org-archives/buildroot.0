From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 May 2012 20:27:55 +0200
Subject: [Buildroot] [PATCH] gnutls: Fix search path for libgcrypt
Message-ID: <1336847275-21899-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In some configurations, the --with-libgcrypt-prefix configure option
causes the default library search path to be disabled completely,
so the compiler can't find libc etc.

Fixes http://autobuild.buildroot.net/results/52a227e8a8723b7914a37d9b3519da5fd2a2844a/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/gnutls/gnutls.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index ce570d5..fb2ba7d 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -8,7 +8,7 @@ GNUTLS_VERSION = 2.12.18
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
 GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt
-GNUTLS_CONF_OPT = --with-libgcrypt --with-libgcrypt-prefix=$(STAGING_DIR)/usr \
+GNUTLS_CONF_OPT = --with-libgcrypt \
 		--without-p11-kit
 GNUTLS_INSTALL_STAGING = YES
 
-- 
tg: (babd953..) t/gnutls (depends on: master)
