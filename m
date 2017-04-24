From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 15:55:40 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] systemd: select fsck
	wrapper from util-linux
Message-ID: <20170424193337.04B9C821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d57b8ae51c9221cc00b208d5756947d5cf3a926
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Select the fsck required by systemd provided by util-linux. This
prevents ending up with fsck from busybox, which is incompatible
with systemd.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 3fddb73ffd17f8a8f701f780e3c28a0f70f45da4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index aaed7dc..ac8175c 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,6 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
+	select BR2_PACKAGE_UTIL_LINUX_FSCK
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
@@ -61,6 +62,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  - libgcrypt package will add support for journal sealing and
 	    DNSSEC verification in resolved.
 
+	  Notice that systemd selects the fsck wrapper from util-linux
+	  but no particular fsck.<fstype> is selected. You must choose
+	  the apropriate ones (e.g. e2fsck, from the e2fsprogs package)
+	  according to the system configuration.
+
 	  http://freedesktop.org/wiki/Software/systemd
 
 if BR2_PACKAGE_SYSTEMD
