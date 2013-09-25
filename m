From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Sep 2013 10:21:29 +0200
Subject: [Buildroot] [git commit] stress: needs mmu
Message-ID: <20130925092156.0D4C09B463@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77a2607fa3fe840427cbb088ddddc8c592a4976d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/stress/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/stress/Config.in b/package/stress/Config.in
index b092b03..37f8946 100644
--- a/package/stress/Config.in
+++ b/package/stress/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_STRESS
 	bool "stress"
+	depends on BR2_USE_MMU # fork()
 	help
 	  A deliberately simple workload generator for POSIX systems.
 	  It imposes a configurable amount of CPU, memory, I/O, and
