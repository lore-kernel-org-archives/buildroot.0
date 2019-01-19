From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 16:31:42 +0100
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 2.6.6
Message-ID: <20190119153718.3700C8D3D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd232aefc9eedae43aff1e4a4abf86b64ef3bdfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerabilities:

- wnpa-sec-2019-01 The 6LoWPAN dissector could crash. Bug 15217. CVE-2019-5716
  https://www.wireshark.org/security/wnpa-sec-2019-01

- wnpa-sec-2019-02 The P_MUL dissector could crash. Bug 15337. CVE-2019-5717
  https://www.wireshark.org/security/wnpa-sec-2019-02

- wnpa-sec-2019-03 The RTSE dissector and other dissectors could crash.  Bug
  15373.  CVE-2019-5718
  https://www.wireshark.org/security/wnpa-sec-2019-03

- wnpa-sec-2019-04 The ISAKMP dissector could crash. Bug 15374. CVE-2019-5719
  https://www.wireshark.org/security/wnpa-sec-2019-04

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 7748dd8409..bad0a0fd45 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.5.txt
-sha256 93155b798544b2f07693920f4ac1b531c952965ee4eb1d98419961240177438a  wireshark-2.6.5.tar.xz
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.6.txt
+sha256 487933ea075bdbb25d8df06017d9c4f49fc20eb7f6ec80af086718ed5550e863  wireshark-2.6.6.tar.xz
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 07c1ade24d..c01238826b 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.6.5
+WIRESHARK_VERSION = 2.6.6
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
