From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Feb 2010 21:06:54 +0100
Subject: [Buildroot] [git commit master] uclibc: do not allow the selection
	of NPTL if snapshot is not selected
Message-ID: <20100223200734.235B17773B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=52fcd86f2ba1249e74ed04ef39cb3cbea16024c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In uClibc, NPTL support does not exist in the 0.9.30 branch, that we
are using in Buildroot. It is only available in the uClibc daily
snapshot, extracted from uClibc master branch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/Config.in.2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 6317ff4..234e31f 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -120,6 +120,7 @@ choice
 
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
+		depends on BR2_UCLIBC_VERSION_SNAPSHOT
 endchoice
 
 config BR2_PROGRAM_INVOCATION
-- 
1.6.3.3
