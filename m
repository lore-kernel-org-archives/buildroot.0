From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 2 Feb 2013 17:34:06 +0100
Subject: [Buildroot] [git commit] nuttcp: needs mmu
Message-ID: <20130202163912.3A8979A8FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82245c6f21aa72bca05801de2ad5c0207abad454
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b8c019a5701377a1e134d01ac0bae5fe34dc975f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nuttcp/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/nuttcp/Config.in b/package/nuttcp/Config.in
index fb6d3b1..eea88fd 100644
--- a/package/nuttcp/Config.in
+++ b/package/nuttcp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NUTTCP
 	bool "nuttcp"
+	depends on BR2_USE_MMU # fork()
 	help
 	  nuttcp is a TCP/UDP network testing tool, much like iperf
 
