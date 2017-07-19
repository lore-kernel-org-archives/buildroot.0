From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 23:57:41 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/systemd: needs
	timezone info
Message-ID: <20170720055506.9753B800CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc0ec5f24f1a04a00ed0bd14e40794ff47a25844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

systemd does not like being booted without any timezone info (especially
on a R/O filesystem), so we forcibly enable that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[Thomas: fix alphabetic ordering.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(cherry picked from commit 81597b82e29d5427ac784c8e6e8dcaee469e0332)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ac8175c..47d47c6 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -26,6 +26,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
+	select BR2_TARGET_TZ_INFO
 	help
 	  systemd is a system and service manager for Linux, compatible with
 	  SysV and LSB init scripts. systemd provides aggressive parallelization
