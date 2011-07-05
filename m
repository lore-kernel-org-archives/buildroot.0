From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Jul 2011 09:00:50 +0200
Subject: [Buildroot] [git commit] toolchain/uClibc: NPTL needs i486+ for
	cmpxchgl instruction
Message-ID: <20110705070101.A421E88E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fef54db1a14b7e7eed4e0e75b3bf2330a11207da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-buildroot/Config.in.2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index b5ecbc1..0c3a510 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -102,6 +102,7 @@ choice
 		bool "Native POSIX Threading (NPTL)"
 	        select BR2_TOOLCHAIN_HAS_THREADS
 		depends on BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_0_9_32
+		depends on !BR2_x86_i386
 endchoice
 
 source "toolchain/elf2flt/Config.in"
-- 
1.7.3.4
