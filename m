From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:40:56 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/libopenssl:
 security bump to version 1.0.2p
Message-ID: <20180824083315.979D388690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97e18877a61d06bade28c8df8d26f4a575a5e61e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2018-0732 & CVE-2018-0737:
https://www.openssl.org/news/vulnerabilities.html

Added upstream sha1 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8654a214ff5efc93401ba6dfae00d75f77ad1bd7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 6 ++++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 48b7471c20..2b1e048751 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,7 @@
-# From https://www.openssl.org/source/openssl-1.0.2o.tar.gz.sha256
-sha256	ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d	openssl-1.0.2o.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2p.tar.gz.sha256
+sha256	50a98e07b1a89eb8f6a99477f262df71c6fa7bef77df4dc83025a2845c827d00	openssl-1.0.2p.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2p.tar.gz.sha1
+sha1	f34b5322e92415755c7d58bf5d0d5cf37666382c				openssl-1.0.2p.tar.gz
 # Locally computed
 sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 16a9c2e9d2..d8e3dd8b56 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.0.2o
+LIBOPENSSL_VERSION = 1.0.2p
 LIBOPENSSL_SITE = http://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
