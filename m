From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:03:59 +0200
Subject: [Buildroot] [git commit] package/systemd: use 'menuconfig'
Message-ID: <20160702110928.071C781D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b102b39197149a11a69a1da65e04bdd0ac250a99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd has a bunch of options now, so use 'menuconfig' to the group the
options in a submenu.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index dcabf3b..b44d57a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64 || \
 		BR2_aarch64 || BR2_m68k
 
-config BR2_PACKAGE_SYSTEMD
+menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
 	depends on BR2_INIT_SYSTEMD
 	depends on BR2_USE_WCHAR # util-linux
