From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Jun 2011 12:26:28 +0200
Subject: [Buildroot] [git commit] uClibc: use NPTL by default for 0.9.32 /
	snapshot
Message-ID: <20110609105206.CF6E085AA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c2f22200883db892f4f25e3c2caa48f7ab8c3ad9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-buildroot/Config.in.2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 3fd433a..b5ecbc1 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -78,6 +78,7 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 
 choice
 	prompt "Thread library implementation"
+	default BR2_PTHREADS_NATIVE if BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_0_9_32
 	default BR2_PTHREADS_OLD
 	help
 	  Use this option to select the thread library implementation
-- 
1.7.3.4
