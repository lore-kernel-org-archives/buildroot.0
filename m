From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 22:17:17 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/wireshark:
 security bump to version 2.6.11
Message-ID: <20190925202848.34BAF8F6B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f7560cc4f01e7205a2f80ff159025c31e9a1c4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

2.6.8:

- NetScaler file parser crash. Bug 15497. CVE-2019-10895
  https://www.wireshark.org/security/wnpa-sec-2019-09

- SRVLOC dissector crash. Bug 15546. CVE-2019-10899
  https://www.wireshark.org/security/wnpa-sec-2019-10

- GSS-API dissector crash. Bug 15613. CVE-2019-10894
  https://www.wireshark.org/security/wnpa-sec-2019-14

- DOF dissector crash. Bug 15617. CVE-2019-10896
  https://www.wireshark.org/security/wnpa-sec-2019-15

- LDSS dissector crash. Bug 15620. CVE-2019-10901
  https://www.wireshark.org/security/wnpa-sec-2019-17

- DCERPC SPOOLSS dissector crash. Bug 15568. CVE-2019-10903
  https://www.wireshark.org/security/wnpa-sec-2019-18

2.6.9:

- Wireshark dissection engine crash. Bug 15778
  https://www.wireshark.org/security/wnpa-sec-2019-19

2.6.10:

- ASN.1 BER and related dissectors crash. Bug 15870. CVE-2019-13619
  https://www.wireshark.org/security/wnpa-sec-2019-20

2.6.11:

- Gryphon dissector infinite loop. Bug 16020
  https://www.wireshark.org/security/wnpa-sec-2019-21

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 071940e1c1..6474e166de 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.7.txt
-sha256 747b3e7a37414942959f76f198be49dcbcca936bda538c4408942ce71bfd2b71  wireshark-2.6.7.tar.xz
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.11.txt
+sha256 29751581c8549562957940e68f0b9410a499616c91c1768195bc02def13f5a85  wireshark-2.6.11.tar.xz
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a917efb5f6..bf924cadd1 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.6.7
+WIRESHARK_VERSION = 2.6.11
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
