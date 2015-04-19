From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 23:09:36 +0200
Subject: [Buildroot] [git commit] package/flickcurl: bump version to 1.26
Message-ID: <20150419212234.A445B819C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=381ad5b36e7265d90444cc279a319be608ad6788
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

removed patches applied upstream:
https://github.com/dajobe/flickcurl/commit/1f5e208a4709a3030258024ea63834aab41bca3c
https://github.com/dajobe/flickcurl/commit/3e65bbfc1c556ac8bd1d30db66d6e63957066b75

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ttps-for-all-service-endpoints.-HTTP-EOL-.patch |   40 --------------------
 ...auth-services-are-on-https-www.flickr.com.patch |   30 ---------------
 package/flickcurl/flickcurl.mk                     |    2 +-
 3 files changed, 1 insertions(+), 71 deletions(-)

diff --git a/package/flickcurl/0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch b/package/flickcurl/0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch
deleted file mode 100644
index 576b611..0000000
--- a/package/flickcurl/0001-Switch-to-https-for-all-service-endpoints.-HTTP-EOL-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 1f5e208a4709a3030258024ea63834aab41bca3c Mon Sep 17 00:00:00 2001
-From: Dave Beckett <dave@dajobe.org>
-Date: Sat, 31 May 2014 12:10:35 -0700
-Subject: [PATCH] Switch to https for all service endpoints. HTTP EOL
- 2014-06-27
-
-2014-04-30 Flickr announced that it would be HTTPS only from 2014-06-27
-http://code.flickr.net/2014/04/30/flickr-api-going-ssl-only-on-june-27th-2014/
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/common.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/common.c b/src/common.c
-index ef05e08..245db18 100644
---- a/src/common.c
-+++ b/src/common.c
-@@ -73,12 +73,12 @@ const char* const flickcurl_home_url_string = "http://librdf.org/flickcurl/";
- const char* const flickcurl_version_string = VERSION;
- 
- 
--const char* const flickcurl_flickr_service_uri =  "http://www.flickr.com/services/rest/";
--const char* const flickcurl_flickr_upload_service_uri =  "http://api.flickr.com/services/upload/";
--const char* const flickcurl_flickr_replace_service_uri =  "http://api.flickr.com/services/replace/";
--const char* const flickcurl_flickr_oauth_request_token_uri =  "http://www.flickr.com/services/oauth/request_token";
--const char* const flickcurl_flickr_oauth_authorize_uri =  "http://www.flickr.com/services/oauth/authorize";
--const char* const flickcurl_flickr_oauth_access_token_uri =  "http://www.flickr.com/services/oauth/access_token";
-+const char* const flickcurl_flickr_service_uri =  "https://api.flickr.com/services/rest/";
-+const char* const flickcurl_flickr_upload_service_uri =  "https://up.flickr.com/services/upload/";
-+const char* const flickcurl_flickr_replace_service_uri =  "https://up.flickr.com/services/replace/";
-+const char* const flickcurl_flickr_oauth_request_token_uri =  "https://api.flickr.com/services/oauth/request_token";
-+const char* const flickcurl_flickr_oauth_authorize_uri =  "https://api.flickr.com/services/oauth/authorize";
-+const char* const flickcurl_flickr_oauth_access_token_uri =  "https://api.flickr.com/services/oauth/access_token";
- 
- 
- static void
--- 
-2.0.0
-
diff --git a/package/flickcurl/0002-Oauth-services-are-on-https-www.flickr.com.patch b/package/flickcurl/0002-Oauth-services-are-on-https-www.flickr.com.patch
deleted file mode 100644
index 1ed9af2..0000000
--- a/package/flickcurl/0002-Oauth-services-are-on-https-www.flickr.com.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 3e65bbfc1c556ac8bd1d30db66d6e63957066b75 Mon Sep 17 00:00:00 2001
-From: Dave Beckett <dave@dajobe.org>
-Date: Sat, 31 May 2014 12:56:22 -0700
-Subject: [PATCH] Oauth services are on https www.flickr.com
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/common.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/common.c b/src/common.c
-index 245db18..c697a7d 100644
---- a/src/common.c
-+++ b/src/common.c
-@@ -76,9 +76,9 @@ const char* const flickcurl_version_string = VERSION;
- const char* const flickcurl_flickr_service_uri =  "https://api.flickr.com/services/rest/";
- const char* const flickcurl_flickr_upload_service_uri =  "https://up.flickr.com/services/upload/";
- const char* const flickcurl_flickr_replace_service_uri =  "https://up.flickr.com/services/replace/";
--const char* const flickcurl_flickr_oauth_request_token_uri =  "https://api.flickr.com/services/oauth/request_token";
--const char* const flickcurl_flickr_oauth_authorize_uri =  "https://api.flickr.com/services/oauth/authorize";
--const char* const flickcurl_flickr_oauth_access_token_uri =  "https://api.flickr.com/services/oauth/access_token";
-+const char* const flickcurl_flickr_oauth_request_token_uri =  "https://www.flickr.com/services/oauth/request_token";
-+const char* const flickcurl_flickr_oauth_authorize_uri =  "https://www.flickr.com/services/oauth/authorize";
-+const char* const flickcurl_flickr_oauth_access_token_uri =  "https://www.flickr.com/services/oauth/access_token";
- 
- 
- static void
--- 
-2.0.0
-
diff --git a/package/flickcurl/flickcurl.mk b/package/flickcurl/flickcurl.mk
index 2b5ea5b..ce836f7 100644
--- a/package/flickcurl/flickcurl.mk
+++ b/package/flickcurl/flickcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLICKCURL_VERSION = 1.25
+FLICKCURL_VERSION = 1.26
 FLICKCURL_SITE = http://download.dajobe.org/flickcurl
 FLICKCURL_LICENSE = LGPLv2.1+ or GPLv2+ or Apache 2.0+
 FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
