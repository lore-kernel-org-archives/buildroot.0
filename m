From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:39:32 +0100
Subject: [Buildroot] [git commit] mplayer: also hide toolchain comment on
	ARMv4
Message-ID: <20141106233446.5D2E4B1487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=010faa988a63bf8bb59b1c01f8322ef4e74312e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like we do for the other arch dependencies.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 4cfa0bb..779f1bd 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -30,4 +30,5 @@ endif
 comment "mplayer needs a toolchain w/ largefile"
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 		|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
+	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_LARGEFILE
