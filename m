From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Aug 2020 09:51:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 3.2.6
Message-ID: <20200829075124.962675-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2020-17498: In Wireshark 3.2.0 to 3.2.5, the Kafka protocol
dissector could crash. This was addressed in
epan/dissectors/packet-kafka.c by avoiding a double free during LZ4
decompression.

https://www.wireshark.org/security/wnpa-sec-2020-10.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index b74b69244d..c9f62ad1a8 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.5.txt
-sha1  468c547ad13df805322e0979b348dcc602904017  wireshark-3.2.5.tar.xz
-sha256  bd89052a5766cce08b1090df49628567e48cdd24bbaa47667c851bac6aaac940  wireshark-3.2.5.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.6.txt
+sha1  e8f3e6cb9072670c8bdbbff7e5fe3ccd5203d35e  wireshark-3.2.6.tar.xz
+sha256  ebb1eebe39bcecee02195dc328dd25f6862fc9e9dea4c2e29eae50537d5eb4f2  wireshark-3.2.6.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 638a8a249e..04e3e13ff1 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.2.5
+WIRESHARK_VERSION = 3.2.6
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.28.0
