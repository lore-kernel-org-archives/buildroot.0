From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:15:08 +0200
Subject: [Buildroot] [git commit] libcurl: specify capath
Message-ID: <20130421212043.1F6A39B793@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f3c8cf94bd610f60c6963cb6c1df041a1ebb7f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since openssl's path is '/etc/ssl/' (specified in our openssl package),
we should also make sure that's what curl is using.

Previously, it's hasn't been specified, which means it changes depending
on the host system where it's compiled.

Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcurl/libcurl.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a631953..f0236d9 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -27,7 +27,9 @@ LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
 # are found first.
 LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
-LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr --with-random=/dev/urandom
+LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr \
+	--with-random=/dev/urandom \
+	--with-ca-path=/etc/ssl/certs
 else
 LIBCURL_CONF_OPT += --without-ssl
 endif
