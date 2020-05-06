From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 07:47:30 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/wireshark:
 security bump to version 3.2.3
Message-ID: <20200506055036.8BE4A7FA3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79127c6fbd97cba53b457dc3459d9afbd74aeedb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix CVE-2020-11647: In Wireshark 3.2.0 to 3.2.2, 3.0.0 to 3.0.9, and
2.6.0 to 2.6.15, the BACapp dissector could crash. This was addressed
in epan/dissectors/packet-bacapp.c by limiting the amount of recursion.

https://www.wireshark.org/security/wnpa-sec-2020-07.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 94fd6bdcc993a10b702be6add0fa8ae607b3666c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 8b8261840a..d4d0c9e48f 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.2.txt
-sha1  9cc54a56e9c2ed77e1bc436d9ae2f7bba68d26f8  wireshark-3.2.2.tar.xz
-sha256  5f5923ef4c3fee370ed0ca1bb324f37c246015eba4a7e74ab95d9208feeded79  wireshark-3.2.2.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.3.txt
+sha1  4656856a40b294f183900ba47651b0fc8e3950fd  wireshark-3.2.3.tar.xz
+sha256  f007e4b88c86d95e33af03e057ecc03635f54466d02371bc26489eabb274faba  wireshark-3.2.3.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ead6b164ed..c262891dcd 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.2.2
+WIRESHARK_VERSION = 3.2.3
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
