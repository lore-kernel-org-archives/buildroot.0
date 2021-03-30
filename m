From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Mar 2021 08:15:44 +0200
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 3.4.4
Message-ID: <20210330055656.EC7098A673@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=705b3dd78cc4a1528308edba3a66bc3c6dfd670f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-22191: Improper URL handling in Wireshark 3.4.0 to 3.4.3
and 3.2.0 to 3.2.11 could allow remote code execution via via packet
injection or crafted capture file.

https://www.wireshark.org/security/wnpa-sec-2021-03.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 56a0122dd2..71703a2a8b 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.3.txt
-sha1  7dec4332f21827e360b5830d1d6d566365796a67  wireshark-3.4.3.tar.xz
-sha256  f467cc77f0fc73fce0b854cdbc292f132d4879fca69d417eccad5f967fbf262b  wireshark-3.4.3.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.4.txt
+sha1  fa5c553596dcc6a59735f96a9a0845e3c40abab2  wireshark-3.4.4.tar.xz
+sha256  729cd11e9715c600e5ad74ca472bacf8af32c20902192d5f2b271268511d4d29  wireshark-3.4.4.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index e751e550bc..8cdc7305d0 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.3
+WIRESHARK_VERSION = 3.4.4
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
