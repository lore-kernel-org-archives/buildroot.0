From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 10 Apr 2017 00:54:04 -0300
Subject: [Buildroot] [PATCH v5 2/2] systemd: select fsck wrapper from
	util-linux
Message-ID: <1491796444-8672-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select the fsck required by systemd provided by util-linux. This
prevents ending up with fsck from busybox, which is incompatible
with systemd.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/systemd/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 0f54686..f5eb9d0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,6 +22,9 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
+	select BR2_PACKAGE_UTIL_LINUX_FSCK
+	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_E2FSCK
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
-- 
2.7.4
