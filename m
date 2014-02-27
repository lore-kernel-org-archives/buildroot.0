From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2014 09:07:39 +0100
Subject: [Buildroot] [git commit] ramsmp: not available on !MMU, needs fork
Message-ID: <20140227082147.996759BB96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7bc24338a5b82bff79c6b46e2279b67f2b8ab33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/aaa/aaa7f8e5ec72ce69805d6c1a5cde5ff47e1c118e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ramsmp/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ramsmp/Config.in b/package/ramsmp/Config.in
index c379bb1..ecab6a4 100644
--- a/package/ramsmp/Config.in
+++ b/package/ramsmp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RAMSMP
 	bool "ramspeed/smp"
+	depends on BR2_USE_MMU # fork()
 	help
 	  RAMspeed/SMP is a free open source command line utility
 	  to measure cache and memory performance of multiprocessor machines.
