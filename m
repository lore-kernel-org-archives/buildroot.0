From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 Jan 2015 14:29:16 -0300
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.40.0
Message-ID: <1420738156-32009-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-8150 - When libcurl sends a request to a server via a HTTP
proxy, it copies the entire URL into the request and sends if off.
If the given URL contains line feeds and carriage returns those will be
sent along to the proxy too, which allows the program to for example
send a separate HTTP request injected embedded in the URL.

CVE-2014-8151 - libcurl stores TLS Session IDs in its associated Session
ID cache when it connects to TLS servers. In subsequent connects it
re-uses the entry in the cache to resume the TLS connection faster than
when doing a full TLS handshake. The actual implementation for the
Session ID caching varies depending on the underlying TLS backend.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 4c3b8ac..546ad3a 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b222566e7087cd9701b301dd6634b360ae118cc1cbc7697e534dc451102ea4e0	curl-7.39.0.tar.bz2
+sha256	899109eb3900fa6b8a2f995df7f449964292776a04763e94fae640700f883fba	curl-7.40.0.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 62ea5fb..db5fdb7 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.39.0
+LIBCURL_VERSION = 7.40.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.0.5
