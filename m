From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 17:40:26 +0100
Subject: [Buildroot] [git commit] package/lua-curl: fix define for
 lcurl_mime_t for curl 7.56.0
Message-ID: <20181230163550.496EF814A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fd41d9fc8f9d4a7a737b0ba17e858278f615268
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a upstream patch that removes a ';' at the end of #define for
lcurl_mime_t.

Fixes:

  http://autobuild.buildroot.net/results/f3c0c1aa8f860fddc1312823530ab369b198820c/

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
[Thomas: use upstream patch instead.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Fix.-Removed-invalid-semicolon.patch      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/lua-curl/0002-Fix.-Removed-invalid-semicolon.patch b/package/lua-curl/0002-Fix.-Removed-invalid-semicolon.patch
new file mode 100644
index 0000000000..288f5a1374
--- /dev/null
+++ b/package/lua-curl/0002-Fix.-Removed-invalid-semicolon.patch
@@ -0,0 +1,28 @@
+From 39aeb8aa6f3a379918c58560d58f243fa7ec2b8b Mon Sep 17 00:00:00 2001
+From: Anderson Silva <anderson.silva@cujo.com>
+Date: Wed, 11 Jul 2018 11:59:33 -0700
+Subject: [PATCH] Fix. Removed invalid semicolon
+
+[Thomas: backported from upstream commit
+3f0489157d2f1e3a90a32f8fb31ade6e02296367]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/lceasy.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lua-cURLv3-0.3.8/src/lceasy.h b/Lua-cURLv3-0.3.8/src/lceasy.h
+index d6ccefd..7c95668 100644
+--- a/Lua-cURLv3-0.3.8/src/lceasy.h
++++ b/Lua-cURLv3-0.3.8/src/lceasy.h
+@@ -47,7 +47,7 @@ struct lcurl_multi_tag;
+ #define lcurl_multi_t struct lcurl_multi_tag
+ #if LCURL_CURL_VER_GE(7,56,0)
+ struct lcurl_mime_tag;
+-#define lcurl_mime_t struct lcurl_mime_tag;
++#define lcurl_mime_t struct lcurl_mime_tag
+ #endif
+ #endif
+ 
+-- 
+2.20.1
+
