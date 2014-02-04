From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 15:15:11 +0100
Subject: [Buildroot] [git commit] arch: remove incorrect condition for
	endian definition on SuperH
Message-ID: <20140204141913.6B9D19C759@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd712eb31cd041eb51c2731a0cdf0422681bb67d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Probably due to some copy/paste mistake, Config.in.sh was defining
BR2_ENDIAN to "LITTLE" when the architecture is BR2_x86_64. Due to the
fact that Config.in.sh is never included when we are building for
x86_64, this is a no-op, but is certainly good to clean up.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index cf70fd5..10d4ef6 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -36,6 +36,6 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_sh3 || BR2_sh4 || BR2_sh4a || \
-				   BR2_x86_64 || BR2_sh64
+				   BR2_sh64
 	default "BIG"		if BR2_sh2 || BR2_sh2a || BR2_sh3eb || \
 				   BR2_sh4eb || BR2_sh4aeb
