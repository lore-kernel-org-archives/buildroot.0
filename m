From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:56:26 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] libcurl: security bump to
	7.52.0
Message-ID: <20161223220932.A45BB81EC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d12c6df2fc69f4f7c8a79547dcee12cb7beb8290
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixes CVE-2016-9586 - printf floating point buffer overflow

For details, see:
https://curl.haxx.se/docs/adv_20161221A.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0c5beb6501707dd5cb80484562bf2b0cbe2b4423)
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index e128335..2b68c6a 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 7f8240048907e5030f67be0a6129bc4b333783b9cca1391026d700835a788dde  curl-7.51.0.tar.bz2
+sha256 b9a2e18b4785eb75ad84598720e1559e1c53550ea011c0e00becdb94e2df5cc6  curl-7.52.0.tar.bz2
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 197e0b5..b2a1b24 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.51.0
+LIBCURL_VERSION = 7.52.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
