From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 18:44:12 +0100
Subject: [Buildroot] [git commit] arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS
Message-ID: <20131104211054.2F9499BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f60dafe06833a17540608d1c8172d6535c513f1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set --with-arch instead of --with-tune for MIPS so that the
generated code will be optimal for the given MIPS ISA.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 6242bcc..86fbe64 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -72,7 +72,7 @@ config BR2_ENDIAN
 	default "LITTLE"	if BR2_mipsel || BR2_mips64el
 	default "BIG" 	    	if BR2_mips || BR2_mips64
 
-config BR2_GCC_TARGET_TUNE
+config BR2_GCC_TARGET_ARCH
 	default "mips1"		if BR2_mips_1
 	default "mips2"		if BR2_mips_2
 	default "mips3"		if BR2_mips_3
