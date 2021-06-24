From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jun 2021 09:16:11 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/wireshark:
 security bump to version 3.4.6
Message-ID: <20210624065200.DEB188E065@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af79381ca4bbe22a62730c95474d45367959f35c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fix CVE-2021-22222: Infinite loop in DVB-S2-BB dissector in Wireshark
3.4.0 to 3.4.5 allows denial of service via packet injection or crafted
capture file

https://www.wireshark.org/security/wnpa-sec-2021-05.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5cf85208407cc5aba16fc2ac17b2c3610e22ae08)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 57290b9060..ddb0f1954a 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.5.txt
-sha1  d01a9b5f58206fb458fe9fc2dac88ad0ea7152ce  wireshark-3.4.5.tar.xz
-sha256  de1aafd100a1e1207c850d180e97dd91ab8da0f5eb6beec545f725cdb145d333  wireshark-3.4.5.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.6.txt
+sha1  20596183210daeb0070ae43716529caf81c6187a  wireshark-3.4.6.tar.xz
+sha256  12a678208f8cb009e6b9d96026e41a6ef03c7ad086b9e1029f42053b249b4628  wireshark-3.4.6.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 3d656cf349..8b0ab4bfbe 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.5
+WIRESHARK_VERSION = 3.4.6
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
