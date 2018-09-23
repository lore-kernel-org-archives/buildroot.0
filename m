From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 21:20:10 +0200
Subject: [Buildroot] [git commit] linux: add hash file
Message-ID: <20180923192010.DF14E8898B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fec8e24fec59233ca0859905bf494e8788939c23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added a hash file for the Linux kernel. Hashes have been copied
from the appropriate sha256sums.asc files on kernel.org.
The Linux hash file is also shared with the linux-headers package
via a symbolic link.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
[Thomas: update hashes with recent linux-headers changes.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.hash                         | 9 +++++++++
 package/linux-headers/linux-headers.hash | 1 +
 2 files changed, 10 insertions(+)

diff --git a/linux/linux.hash b/linux/linux.hash
new file mode 100644
index 0000000000..589e5f8da2
--- /dev/null
+++ b/linux/linux.hash
@@ -0,0 +1,9 @@
+# From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
+sha256 4c995351e57902a04a94e43796407b4ba295c8eae070c27e99f8f99c321e917a  linux-4.18.9.tar.xz
+sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
+sha256 76a4473dbcbd922c23a16130414829a36eb7e2f4e5859bd1b742fffdff907489  linux-4.14.71.tar.xz
+sha256 bdb76f48491a6aadc89c0f0f7fdc240d77cee54da5aac59da0b5d98e226b6f12  linux-4.9.128.tar.xz
+sha256 0010bc0aa64bc9cf55aaebd662dd0971f18284e925c74562ced31e0cf01d624d  linux-4.4.157.tar.xz
+sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
+sha256 ad96d797571496c969aa71bf5d08e9d2a8c84458090d29a120f1b2981185a99e  linux-3.2.102.tar.xz
diff --git a/package/linux-headers/linux-headers.hash b/package/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..04970e97c1
--- /dev/null
+++ b/package/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../../linux/linux.hash
\ No newline at end of file
