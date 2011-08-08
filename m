From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Aug 2011 18:56:47 +0200
Subject: [Buildroot] [git commit] binutils: default to 2.21 on mips(el)
Message-ID: <20110808170325.8355B8B856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=92496e0ef01fbf697483f061f933b303bd8fa408
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc currently doesn't build on mips(el) with 2.21.1.

For details, see:

http://lists.uclibc.org/pipermail/uclibc/2011-March/045026.html

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index a867b18..f6e34ce 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,6 +2,7 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
+	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel)
 	default BR2_BINUTILS_VERSION_2_21_1
 	help
 	  Select the version of binutils you wish to use.
-- 
1.7.3.4
