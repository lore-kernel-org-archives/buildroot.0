From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 25 Sep 2019 18:50:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/glorytun: bump to version 2.0.1
Message-ID: <20190925165035.5756-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mud/aegis256/aegis256.c:6:18: error: missing binary operator before token "("
 #if __has_include("x86intrin.h")
                  ^

is fixed through
https://github.com/angt/aegis256/commit/4ff57bfc839b696cbc34651586d232ec8e1db275

Fixes:
 - http://autobuild.buildroot.org/results/f03b0ec68e14e4562df13ce484da34115b113c02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glorytun/glorytun.hash | 2 +-
 package/glorytun/glorytun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glorytun/glorytun.hash b/package/glorytun/glorytun.hash
index fc322993e5..202c15666b 100644
--- a/package/glorytun/glorytun.hash
+++ b/package/glorytun/glorytun.hash
@@ -1,2 +1,2 @@
-sha256 e6c8a632acea5470787739f27914a729d9b4be74748ca9ee59079ceeb49b0002  glorytun-0.2.0.tar.gz
+sha256 6c35b044bf08a624bebf2374b33625c0462858a3f75efb810aebcccc0634e7ee  glorytun-0.2.1.tar.gz
 sha256 02e492aa724ce3a64800ed9429cbabf811935ad1be95d667fae9187baa94e359  LICENSE
diff --git a/package/glorytun/glorytun.mk b/package/glorytun/glorytun.mk
index dc9f1b37b8..41f49810ca 100644
--- a/package/glorytun/glorytun.mk
+++ b/package/glorytun/glorytun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLORYTUN_VERSION = 0.2.0
+GLORYTUN_VERSION = 0.2.1
 GLORYTUN_SITE = https://github.com/angt/glorytun/releases/download/v$(GLORYTUN_VERSION)
 GLORYTUN_DEPENDENCIES = libsodium host-pkgconf
 GLORYTUN_LICENSE = BSD-2-clause
-- 
2.23.0
