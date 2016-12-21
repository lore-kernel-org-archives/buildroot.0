From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 07:29:39 +0100
Subject: [Buildroot] [git commit] tor: security bump to 0.2.8.12
Message-ID: <20161221062951.E26DB81E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2a349c911ecfa380014e90f390b921a4c3dedb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2016-1254 - One byte past an allocated buffer read while parsing
hidden service descriptors:

https://blog.torproject.org/blog/tor-02812-released

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index b13fc4a..4fdb82c 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c88b8c57b34ebf44b731df5d68f73eb6b6708bcf4e42cf7b4817fd4e304c9c4d  tor-0.2.8.10.tar.gz
+sha256 b35748f2839cf8ce9910b677ea873463495ac88689244c007ed038f6887f4aaf  tor-0.2.8.12.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 4f33522..5606cc2 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.8.10
+TOR_VERSION = 0.2.8.12
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3c
 TOR_LICENSE_FILES = LICENSE
