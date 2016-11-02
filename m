From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Nov 2016 11:52:31 +0000
Subject: [Buildroot] [PATCH] libcurl: bump version to 7.51.0 (security)
Message-ID: <20161102115231.1289-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

List of fixed CVEs:

CVE-2016-8615: cookie injection for other servers
CVE-2016-8616: case insensitive password comparison
CVE-2016-8617: OOB write via unchecked multiplication
CVE-2016-8618: double-free in curl_maprintf
CVE-2016-8619: double-free in krb5 code
CVE-2016-8620: glob parser write/read out of bounds
CVE-2016-8621: curl_getdate read out of bounds
CVE-2016-8622: URL unescape heap overflow via integer truncation
CVE-2016-8623: Use-after-free via shared cookies
CVE-2016-8624: invalid URL parsing with '#'
CVE-2016-8625: IDNA 2003 makes curl use wrong host

Full ChangeLog:

https://curl.haxx.se/changes.html#7_51_0

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index e2f2ecd..e128335 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 7b7347d976661d02c84a1f4d6daf40dee377efdc45b9e2c77dedb8acf140d8ec  curl-7.50.3.tar.bz2
+sha256 7f8240048907e5030f67be0a6129bc4b333783b9cca1391026d700835a788dde  curl-7.51.0.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 32a3022..d60000a 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.50.3
+LIBCURL_VERSION = 7.51.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.10.1
