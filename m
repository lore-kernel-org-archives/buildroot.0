From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 22:32:45 +0200
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 3.4.5
Message-ID: <20210521200419.76950890A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92de0d76ad76bd804683944edae41283acea67a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: CVE-2021-22207 Excessive memory consumption in MS-WSP dissector
in Wireshark 3.4.0 to 3.4.4 and 3.2.0 to 3.2.12 allows denial of service
via packet injection or crafted capture file

See also: https://www.wireshark.org/security/wnpa-sec-2021-04.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: add CVE reference]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 71703a2a8b..57290b9060 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.4.txt
-sha1  fa5c553596dcc6a59735f96a9a0845e3c40abab2  wireshark-3.4.4.tar.xz
-sha256  729cd11e9715c600e5ad74ca472bacf8af32c20902192d5f2b271268511d4d29  wireshark-3.4.4.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.5.txt
+sha1  d01a9b5f58206fb458fe9fc2dac88ad0ea7152ce  wireshark-3.4.5.tar.xz
+sha256  de1aafd100a1e1207c850d180e97dd91ab8da0f5eb6beec545f725cdb145d333  wireshark-3.4.5.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 8cdc7305d0..3d656cf349 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.4
+WIRESHARK_VERSION = 3.4.5
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
