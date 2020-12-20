From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Dec 2020 18:55:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: security bump to version
 8.3.0
Message-ID: <20201220175556.10038-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2019-14318: Crypto++ 8.3.0 and earlier contains a timing side
  channel in ECDSA signature generation. This allows a local or remote
  attacker, able to measure the duration of hundreds to thousands of
  signing operations, to compute the private key used. The issue occurs
  because scalar multiplication in ecp.cpp (prime field curves, small
  leakage) and algebra.cpp (binary field curves, large leakage) is not
  constant time and leaks the bit length of the scalar among other
  information.
- Update license hash due to the addition of ARM SHA1 and SHA256 asm
  implementation from Cryptogams
  https://github.com/weidai11/cryptopp/commit/1a63112faf5af60e0ebcc60654eef806e7f6f11a
  https://github.com/weidai11/cryptopp/commit/4c9ca6b723b5ec5aab7eec720ad4d22598abe941

https://www.cryptopp.com/release830.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptopp/cryptopp.hash | 6 +++---
 package/cryptopp/cryptopp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index c0d442a97b..2774dc70ec 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.cryptopp.com/release820.html:
-sha256  03f0e2242e11b9d19b28d0ec5a3fa8ed5cc7b27640e6bed365744f593e858058  cryptopp820.zip
+# Hash from: https://www.cryptopp.com/release830.html:
+sha512  ad5219a66c5924d330d3646d0ff996dd235006f6812074bc4eb9e8c662a4f000ba20449d377f24b133d19ce682f7b2a3b2eb4c08857ce0f5bb39743d1d425147  cryptopp830.zip
 
 # Hash for license file:
-sha256  f29d65ae3f0c8e327284f193524643ffb4d682fcca3e1740a5c6cbab0e720583  License.txt
+sha256  e668af8c73a38a66a1e8951d14ec24e7582fee5254dd6c3dae488a416d105d5f  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index f1d19386ab..c1b8aaa44c 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 8.2.0
+CRYPTOPP_VERSION = 8.3.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = https://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
-- 
2.29.2
