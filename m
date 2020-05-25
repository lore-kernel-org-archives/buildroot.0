From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 22:19:02 +0200
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 3.2.4
Message-ID: <20200525200247.4877F8DFDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39bfd504102dce2166e9d9e1377744debde64b38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2020-13164: In Wireshark 3.2.0 to 3.2.3, 3.0.0 to 3.0.10, and
2.6.0 to 2.6.16, the NFS dissector could crash. This was addressed in
epan/dissectors/packet-nfs.c by preventing excessive recursion, such as
for a cycle in the directory graph on a filesystem.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index d4d0c9e48f..57b496282f 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.3.txt
-sha1  4656856a40b294f183900ba47651b0fc8e3950fd  wireshark-3.2.3.tar.xz
-sha256  f007e4b88c86d95e33af03e057ecc03635f54466d02371bc26489eabb274faba  wireshark-3.2.3.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.4.txt
+sha1  bb4157b57c1bcdbac948a1282dafad027d57be9b  wireshark-3.2.4.tar.xz
+sha256  d17d461e849e2d0b033431c45f71d8ee8ec3c8faa232a6ad63069a47927db8aa  wireshark-3.2.4.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c262891dcd..0d72f9dd91 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.2.3
+WIRESHARK_VERSION = 3.2.4
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
