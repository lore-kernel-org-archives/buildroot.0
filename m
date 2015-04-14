From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:07:18 +0200
Subject: [Buildroot] [git commit] linux: Add uImage support for powerpc64
Message-ID: <20150414081954.BDEB47F9E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1afd174f8e72d660d040e8b818ee02ca88a8c8d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux has uImage generation support for powerpc64 as well as powerpc,
since 2.6.15.

Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index cb4daa4..0ab9f26 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -177,8 +177,9 @@ choice
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
 	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
-		   BR2_powerpc || BR2_sh || BR2_sh64 || \
-		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		   BR2_sh || BR2_sh64 || BR2_mips || BR2_mipsel || \
+		   BR2_mips64 || BR2_mips64el
 	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
 config BR2_LINUX_KERNEL_APPENDED_UIMAGE
