From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Wed,  8 Aug 2018 22:40:05 +0200
Subject: [Buildroot] [PATCH] wireshark: bump version to 2.2.16 (security)
Message-ID: <20180808204005.24356-1-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Security fixes since 2.2.15:

- wnpa-sec-2018-06
  RPKI-Router infinite loop. Bug 14414. CVE-2018-7325.
- wnpa-sec-2018-34
  BGP dissector large loop. Bug 13741. CVE-2018-14342.
- wnpa-sec-2018-35
  ISMP dissector crash. Bug 14672. CVE-2018-14344.
- wnpa-sec-2018-36
  Multiple dissectors could crash. Bug 14675. CVE-2018-14340.
- wnpa-sec-2018-37
  ASN.1 BER dissector crash. Bug 14682. CVE-2018-14343.
- wnpa-sec-2018-38
  MMSE dissector infinite loop. Bug 14738. CVE-2018-14339.
- wnpa-sec-2018-39
  DICOM dissector crash. Bug 14742. CVE-2018-14341.
- wnpa-sec-2018-40
  Bazaar dissector infinite loop. Bug 14841.
- wnpa-sec-2018-41
  HTTP2 dissector crash. Bug 14869.

Full release notes:

  https://www.wireshark.org/docs/relnotes/wireshark-2.2.16.html

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 4b9c646fa9..30b00b4dd0 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.15.txt
-sha256 d73583e9282d47c42b69fc3a1ac9cafb6047d1305f5027d4cf18e95922d11844  wireshark-2.2.15.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.16.txt
+sha256 7dcc4e9f29ad8dd75849aa3b6f70b6ec82ab6899cb168096572775a6d97ced8a  wireshark-2.2.16.tar.bz2
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c9a4ef202d..3d729ae090 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.15
+WIRESHARK_VERSION = 2.2.16
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.17.1
