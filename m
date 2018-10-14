From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Oct 2018 21:55:59 +0200
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.2.17
Message-ID: <20181014195559.5389-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

CVE-2018-16058: Bluetooth AVDTP dissector crash:
https://www.wireshark.org/security/wnpa-sec-2018-44.html

CVE-2018-16056: Bluetooth Attribute Protocol dissector crash:
https://www.wireshark.org/security/wnpa-sec-2018-45.html

CVE-2018-16057: Radiotap dissector crash:
https://www.wireshark.org/security/wnpa-sec-2018-46.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 30b00b4dd0..8b2d7bc985 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.16.txt
-sha256 7dcc4e9f29ad8dd75849aa3b6f70b6ec82ab6899cb168096572775a6d97ced8a  wireshark-2.2.16.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.17.txt
+sha256 923d39ff9c6df83b9594868542061da33bf330e12526778a8cb3adcf912eebb0  wireshark-2.2.17.tar.bz2
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 3d729ae090..fb90f2b940 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.16
+WIRESHARK_VERSION = 2.2.17
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.11.0
