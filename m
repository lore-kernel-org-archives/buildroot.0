From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 22:12:01 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/wireshark:
 security bump to version 3.0.3
Message-ID: <20190925200855.1893F8F63D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0e02888781576798be937e6bb8fd733c42ed38d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes the following security issues:

- ASN.1 BER and related dissectors crash. Bug 15870. CVE-2019-13619

https://www.wireshark.org/security/wnpa-sec-2019-20

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7ba0ef5240a071ad323c753d95ecc377e37acffb)
[Peter: mention security fixes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 5 +++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 8498f59140..8a94830fcb 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,5 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.2.txt
-sha256 7e1ec5664a0dba4493d8729f9922378bdd05040fb159c2b03b42111efda2e53b  wireshark-3.0.2.tar.xz
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.3.txt
+sha256 af92729c781d870110885c31ebcbe4c4224ed51bb580d00c896fe9746994211c wireshark-3.0.3.tar.xz
+
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a7401aa6dc..0abd55f49e 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.0.2
+WIRESHARK_VERSION = 3.0.3
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
