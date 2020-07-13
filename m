From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2020 19:05:38 +0200
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 3.2.5
Message-ID: <20200713170328.697647FDA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17ebc1366c86a2f33450e5b0875892eb1625fedf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2020-15466: It may be possible to make Wireshark consume
excessive CPU resources by injecting a malformed packet onto the wire or
by convincing someone to read a malformed packet trace file.

https://www.wireshark.org/security/wnpa-sec-2020-09.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 57b496282f..b74b69244d 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.4.txt
-sha1  bb4157b57c1bcdbac948a1282dafad027d57be9b  wireshark-3.2.4.tar.xz
-sha256  d17d461e849e2d0b033431c45f71d8ee8ec3c8faa232a6ad63069a47927db8aa  wireshark-3.2.4.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.5.txt
+sha1  468c547ad13df805322e0979b348dcc602904017  wireshark-3.2.5.tar.xz
+sha256  bd89052a5766cce08b1090df49628567e48cdd24bbaa47667c851bac6aaac940  wireshark-3.2.5.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 0d72f9dd91..638a8a249e 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.2.4
+WIRESHARK_VERSION = 3.2.5
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
