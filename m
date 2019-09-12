From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Sep 2019 21:43:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/nghttp2: security bump to version
 1.39.2
Message-ID: <20190912194354.27963-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

CVE-2019-9511: Data Dribble
CVE-2019-9513: Resource Loop

For details, see the advisory:
https://nghttp2.org/blog/2019/08/19/nghttp2-v1-39-2/

Notice that libnghttp2 itself is not affected by these vulnerabilities, only
nghttpx and nghttpd (which are currently not built).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index a56f56f222..e0512e891b 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 760981ab5703d3ed185eccb322321d379453974357a3263971a928c2879a43bf  nghttp2-1.37.0.tar.gz
+sha256 fc820a305e2f410fade1a3260f09229f15c0494fc089b0100312cd64a33a38c0  nghttp2-1.39.2.tar.gz
 sha256 6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 7ce28b41fc..6a5ec72847 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.37.0
+NGHTTP2_VERSION = 1.39.2
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
 NGHTTP2_LICENSE_FILES = COPYING
-- 
2.20.1
