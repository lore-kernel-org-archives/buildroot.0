From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 19:06:07 +0200
Subject: [Buildroot] [git commit] package/botan: security bump to version
 2.16
Message-ID: <20201011165957.CBF7488D1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0853fad20f819e301f92ca7d94ead888a64dfdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a memory leak in GCM where if passed an unsuitable block cipher (eg
not 128 bit) it would throw an exception and leak the cipher object.

https://github.com/randombit/botan/blob/2.16.0/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/botan.hash | 2 +-
 package/botan/botan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index e8d62aa98c..003dd13e9c 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  d88af1307f1fefac79aa4f2f524699478d69ce15a857cf2d0a90ac6bf2a50009  Botan-2.15.0.tar.xz
+sha256  92ed6ebc918d86bd1b04221ca518af4cf29cc326c4760740bd2d22e61cea2628  Botan-2.16.0.tar.xz
 # Locally computed
 sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 19677a40e0..d36324c7f7 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.15.0
+BOTAN_VERSION = 2.16.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
