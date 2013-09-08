From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Sep 2013 21:53:11 +0200
Subject: [Buildroot] [git commit] libcurl: add support for compiling with
	libssh2
Message-ID: <20130908204534.5B3DA8191C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d45db95633ed2e73d97a9de911ab5f0c063defaf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding configuration options that if libssh2 is selected, compile libcurl
with --with-ssh config flag.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcurl/libcurl.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 71f19f1..059f08a 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -47,6 +47,14 @@ LIBCURL_CONF_OPT += --without-ssl --without-gnutls \
 	--without-polarssl --without-nss
 endif
 
+# Configure curl to support libssh2
+ifeq ($(BR2_PACKAGE_LIBSSH2),y)
+LIBCURL_DEPENDENCIES += libssh2
+LIBCURL_CONF_OPT += --with-libssh2
+else
+LIBCURL_CONF_OPT += --without-libssh2
+endif
+
 define LIBCURL_FIX_DOT_PC
 	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
 endef
