From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Dec 2015 21:57:41 +0100
Subject: [Buildroot] [git commit] gnutls: re-enable gnutls-openssl compat
	library
Message-ID: <20151210205811.6EB2D822DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b87242316b40830675696d4580a52550e4b61338
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was disabled in the 3.4.x branch by default and is required by
inadyn, fixes:
http://autobuild.buildroot.net/results/51f/51f7e9275c2d23952c7558a126a8843d5476e4b1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index a7342d6..d97e5e5 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -17,6 +17,7 @@ GNUTLS_CONF_OPTS = \
 	--disable-libdane \
 	--disable-rpath \
 	--enable-local-libopts \
+	--enable-openssl-compatibility \
 	--with-libnettle-prefix=$(STAGING_DIR)/usr \
 	--with-librt-prefix=$(STAGING_DIR) \
 	--without-tpm
