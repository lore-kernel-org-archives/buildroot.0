From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 11:12:33 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/wireshark:
 security bump to version 3.2.8
Message-ID: <20201103100021.3457A84239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a63d580b198e27a71f83ce717d8dc9ec11747dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

- Fix CVE-2020-26575: In Wireshark through 3.2.7, the Facebook Zero
  Protocol (aka FBZERO) dissector could enter an infinite loop. This was
  addressed in epan/dissectors/packet-fbzero.c by correcting the
  implementation of offset advancement.
  https://www.wireshark.org/security/wnpa-sec-2020-14.html
- Fix GQUIC dissector crash:
  https://www.wireshark.org/security/wnpa-sec-2020-15.html

https://www.wireshark.org/docs/relnotes/wireshark-3.2.8.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7da2b1ebf976f9b2d0c9f86ba2788f2cb2236d43)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 16866d96b4..8d1a3b3a2e 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.7.txt
-sha1  b564c2e729066cb7c952463fef6163e23a5fea1e  wireshark-3.2.7.tar.xz
-sha256  be832fb86d9c455c5be8b225a755cdc77cb0e92356bdfc1fe4b000d93f7d70da  wireshark-3.2.7.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.8.txt
+sha1  5fdcbbe3a50cea38a8fa5f10b21f58cbef31793e  wireshark-3.2.8.tar.xz
+sha256  a8a595d08f38c6bd083886f6c199b9d4fb007e363031b263667c7da72323cc32  wireshark-3.2.8.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 354f008250..0bcb97606a 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.2.7
+WIRESHARK_VERSION = 3.2.8
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
