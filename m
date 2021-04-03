From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 11:17:44 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/wireshark:
 security bump to version 3.2.12
Message-ID: <20210403094655.41AA0846A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c121ef2b6335a4b7a6dc251594c1f7dac9ae475b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix CVE-2021-22191: Improper URL handling in Wireshark 3.4.0 to 3.4.3
and 3.2.0 to 3.2.11 could allow remote code execution via via packet
injection or crafted capture file.

https://www.wireshark.org/security/wnpa-sec-2021-03.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 8d4b0c6347..1435605d49 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.10.txt
-sha1  691bd151d0d5e7a23b73e7972490947c0af9cf1d  wireshark-3.2.10.tar.xz
-sha256  1e9e239f2449f240a7910ed598084ccaf8ea308b2b46b196c5adbec59612226c  wireshark-3.2.10.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.12.txt
+sha1  3d059990e31e1b99622c946bd662a0a07375144e  wireshark-3.2.12.tar.xz
+sha256  f6f77ecb73b59a3f6142b591d7a3e9d340ca745cbea84bf655e69c6c55b6b04e  wireshark-3.2.12.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 91c4420251..90150ebca8 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.2.10
+WIRESHARK_VERSION = 3.2.12
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
