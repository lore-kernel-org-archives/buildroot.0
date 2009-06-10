From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jun 2009 09:27:02 +0200
Subject: [Buildroot] [git commit] libcurl: fix --without-ssl typo
Message-ID: <20090610085145.76CB97782D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5198e6642c7235d932187767cf0e47870bdf037e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Reported-by: Nestor <nestor@traceback.com.br>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcurl/libcurl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 44c2317..cec6e74 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -20,7 +20,7 @@ LIBCURL_CONF_ENV += ac_cv_lib_crypto_CRYPTO_lock=yes
 LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
 LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr --with-random=/dev/urandom
 else
-LIBCURL_CONF_ENV += --without-ssl
+LIBCURL_CONF_OPT += --without-ssl
 endif
 
 $(eval $(call AUTOTARGETS,package,libcurl))
-- 
1.6.0.6
