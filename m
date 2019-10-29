From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Oct 2019 11:51:54 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/tcpdump: security
 bump to version 4.9.3
Message-ID: <20191029104704.94A538D3C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d30bd5484726f4a130fe5a23836879951371f2b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

CHANGES summary:

    Fix buffer overflow/overread vulnerabilities:
      CVE-2017-16808 (AoE)
      CVE-2018-14468 (FrameRelay)
      CVE-2018-14469 (IKEv1)
      CVE-2018-14470 (BABEL)
      CVE-2018-14466 (AFS/RX)
      CVE-2018-14461 (LDP)
      CVE-2018-14462 (ICMP)
      CVE-2018-14465 (RSVP)
      CVE-2018-14881 (BGP)
      CVE-2018-14464 (LMP)
      CVE-2018-14463 (VRRP)
      CVE-2018-14467 (BGP)
      CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
      CVE-2018-10105 (SMB - too unreliably reproduced, SMB printing disabled)
      CVE-2018-14880 (OSPF6)
      CVE-2018-16451 (SMB)
      CVE-2018-14882 (RPL)
      CVE-2018-16227 (802.11)
      CVE-2018-16229 (DCCP)
      CVE-2018-16301 (was fixed in libpcap)
      CVE-2018-16230 (BGP)
      CVE-2018-16452 (SMB)
      CVE-2018-16300 (BGP)
      CVE-2018-16228 (HNCP)
      CVE-2019-15166 (LMP)
      CVE-2019-15167 (VRRP)
    Fix for cmdline argument/local issues:
      CVE-2018-14879 (tcpdump -V)

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d4d17e52d6955976f0dd28b0a45efa3297ecf827)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpdump/tcpdump.hash | 6 ++++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index 0eb56e695f..da5c9aa749 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,3 +1,5 @@
-# Locally calculated after checking pgp signature at http://www.tcpdump.org/release/tcpdump-4.9.2.tar.gz.sig
-sha256 798b3536a29832ce0cbb07fafb1ce5097c95e308a6f592d14052e1ef1505fe79  tcpdump-4.9.2.tar.gz
+# Locally calculated after checking pgp signature at
+# http://www.tcpdump.org/release/tcpdump-4.9.3.tar.gz.sig
+# using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
+sha256 2cd47cb3d460b6ff75f4a9940f594317ad456cfbf2bd2c8e5151e16559db6410  tcpdump-4.9.3.tar.gz
 sha256 9b03d5d13e66d6de02a4bb2d0dd1cb9f41808d045962cdcc42350d5291b141a1  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 2a6d095c2f..72bf6f8704 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.9.2
+TCPDUMP_VERSION = 4.9.3
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
