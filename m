From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:12:17 +0200
Subject: [Buildroot] [git commit] wireshark: bump version to 2.2.14
 (security)
Message-ID: <20180409091220.AAAA087BF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5c87c2bb61efb31421b345bdbf6931b882ff6a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security fixes since 2.2.12:

- wnpa-sec-2018-15
  The MP4 dissector could crash. (Bug 13777)
- wnpa-sec-2018-16
  The ADB dissector could crash. (Bug 14460)
- wnpa-sec-2018-17
  The IEEE 802.15.4 dissector could crash. (Bug 14468)
- wnpa-sec-2018-18
  The NBAP dissector could crash. (Bug 14471)
- wnpa-sec-2018-19
  The VLAN dissector could crash. (Bug 14469)
- wnpa-sec-2018-20
  The LWAPP dissector could crash. (Bug 14467)
- wnpa-sec-2018-23
  The Kerberos dissector could crash. (Bug 14576)
- wnpa-sec-2018-05
  The IEEE 802.11 dissector could crash. Bug 14442, CVE-2018-7335
- wnpa-sec-2018-06
  Multiple dissectors could go into large infinite loops. All ASN.1 BER dissectors (Bug 14444), along with the DICOM (Bug 14411), DMP (Bug 14408), LLTD (Bug 14419), OpenFlow (Bug 14420), RELOAD (Bug 14445), RPCoRDMA (Bug 14449), RPKI-Router (Bug 14414), S7COMM (Bug 14423), SCCP (Bug 14413), Thread (Bug 14428), Thrift (Bug 14379), USB (Bug 14421), and WCCP (Bug 14412) dissectors were susceptible.
- wnpa-sec-2018-07
  The UMTS MAC dissector could crash. Bug 14339, CVE-2018-7334
- wnpa-sec-2018-09
  The FCP dissector could crash. Bug 14374, CVE-2018-7336
- wnpa-sec-2018-10
  The SIGCOMP dissector could crash. Bug 14398, CVE-2018-7320
- wnpa-sec-2018-11
  The pcapng file parser could crash. Bug 14403, CVE-2018-7420
- wnpa-sec-2018-12
  The IPMI dissector could crash. Bug 14409, CVE-2018-7417
- wnpa-sec-2018-13
  The SIGCOMP dissector could crash. Bug 14410, CVE-2018-7418
-  wnpa-sec-2018-14
  The NBAP disssector could crash. Bug 14443, CVE-2018-7419

Full release notes:

  https://www.wireshark.org/docs/relnotes/wireshark-2.2.14.html

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 93421c6498..2b44cc0757 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.12.txt
-sha256 3274458d1bb1658a5001465ecb07c7cbfc709571ef36bd062897570d4bab3ebc  wireshark-2.2.12.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.14.txt
+sha256 e7a3d4f9bbde20ea5ee09103f9f6dba38e3666dfe1d6a6a1c004602b5fac378b  wireshark-2.2.14.tar.bz2
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 93c6da0398..ad475803b7 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.12
+WIRESHARK_VERSION = 2.2.14
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
