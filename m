From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Oct 2020 22:06:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 3.2.7
Message-ID: <20201010200646.1606023-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2020-25862: In Wireshark 3.2.0 to 3.2.6, 3.0.0 to 3.0.13, and
  2.6.0 to 2.6.20, the TCP dissector could crash. This was addressed in
  epan/dissectors/packet-tcp.c by changing the handling of the invalid
  0xFFFF checksum.
- Fix CVE-2020-25863: In Wireshark 3.2.0 to 3.2.6, 3.0.0 to 3.0.13, and
  2.6.0 to 2.6.20, the MIME Multipart dissector could crash. This was
  addressed in epan/dissectors/packet-multipart.c by correcting the
  deallocation of invalid MIME parts.
- Fix CVE-2020-25866: In Wireshark 3.2.0 to 3.2.6 and 3.0.0 to 3.0.13,
  the BLIP protocol dissector has a NULL pointer dereference because a
  buffer was sized for compressed (not uncompressed) messages. This was
  addressed in epan/dissectors/packet-blip.c by allowing reasonable
  compression ratios and rejecting ZIP bombs.

https://www.wireshark.org/docs/relnotes/wireshark-3.2.7.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index c9f62ad1a8..16866d96b4 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.6.txt
-sha1  e8f3e6cb9072670c8bdbbff7e5fe3ccd5203d35e  wireshark-3.2.6.tar.xz
-sha256  ebb1eebe39bcecee02195dc328dd25f6862fc9e9dea4c2e29eae50537d5eb4f2  wireshark-3.2.6.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.7.txt
+sha1  b564c2e729066cb7c952463fef6163e23a5fea1e  wireshark-3.2.7.tar.xz
+sha256  be832fb86d9c455c5be8b225a755cdc77cb0e92356bdfc1fe4b000d93f7d70da  wireshark-3.2.7.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 04e3e13ff1..354f008250 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.2.6
+WIRESHARK_VERSION = 3.2.7
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.28.0
