From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 14:56:38 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] package/systemd: needs
	timezone info
Message-ID: <20170719204757.21E8F7FF4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8070139e877f40e13dd21a469a08ddc3d6bd979
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

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
index 478cc10..7dfd7ca 100644
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
