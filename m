From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 May 2009 07:18:43 +0200
Subject: [Buildroot] [git commit] curl: make sure openssl isn't tried when
	the openssl package isn't enabled
Message-ID: <20090527052120.EFDBB77855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3169b04725d45ed96059f0b14456b80ff1ac02df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Works around build errors caused by broken Xorg dependencies.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcurl/libcurl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index fb04da0..44c2317 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -19,6 +19,8 @@ LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 # are found first.
 LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
 LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr --with-random=/dev/urandom
+else
+LIBCURL_CONF_ENV += --without-ssl
 endif
 
 $(eval $(call AUTOTARGETS,package,libcurl))
-- 
1.6.0.6
