From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:03:13 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] wireshark: security bump
 to version 2.2.12
Message-ID: <20180131123622.C5E848568A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3738aa22c8ce2c74e970b71f0a9840a6f96a3dbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Fixes the following security issues:

CVE-2017-17997: MRDISC dissector crash
https://www.wireshark.org/security/wnpa-sec-2018-02.html

CVE-2018-5334: IxVeriWave file parser crash
https://www.wireshark.org/security/wnpa-sec-2018-03.html

CVE-2018-5335: WCP dissector crash
https://www.wireshark.org/security/wnpa-sec-2018-04.html

CVE-2018-5336: Multiple dissectors could crash
https://www.wireshark.org/security/wnpa-sec-2018-01.html

For more information, see the release notes:
https://www.wireshark.org/docs/relnotes/wireshark-2.2.12.html

While we are at it, also add as hash for license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2d920ad1b40967ae9241eaaa551d7d13c19f1b14)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 ++++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index cffdab2a24..93421c6498 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.11.txt
-sha256 a9f11621e85d7e1d72259157edd94825e72af3fd72e184b8474459f92ad5fc40  wireshark-2.2.11.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.12.txt
+sha256 3274458d1bb1658a5001465ecb07c7cbfc709571ef36bd062897570d4bab3ebc  wireshark-2.2.12.tar.bz2
+# Locally calculated
+sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 535ed7a2c9..93c6da0398 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.11
+WIRESHARK_VERSION = 2.2.12
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
