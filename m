From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:54 -0000
Subject: [Buildroot] [git commit branch/next] gnutls: fix libgcrypt handling
	with external toolchains
Message-ID: <20120802195235.7CA7B96EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6d52903bba357f3bc18d1736e97e4da2ad91c00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The explicit gnutls prefix in combination with the libc.so linker script
and non-default sysroot seems to confuse external toolchains, causing
configure to error out. Workaround it by not using an explicit libgcrypt
prefix as it is installed in the sysroot anyway.

Fixes http://autobuild.buildroot.net/results/3b3901bea904bf32bccbd3e9a4274d604776cb98

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/gnutls.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index f7238aa..45323f2 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -8,7 +8,7 @@ GNUTLS_VERSION = 2.12.19
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
 GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt
-GNUTLS_CONF_OPT = --with-libgcrypt --with-libgcrypt-prefix=$(STAGING_DIR)/usr \
+GNUTLS_CONF_OPT = --with-libgcrypt \
 		--without-p11-kit
 GNUTLS_INSTALL_STAGING = YES
 
