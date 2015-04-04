From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 11:48:20 +0200
Subject: [Buildroot] [git commit] package/strace: add missing header for
	aarch64
Message-ID: <20150404094827.EFB027FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0cd238fff674de81d44671bc218fa17e877865c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a27/a27a9e2bd7b95e29289c4422b89690a42992e30f/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-linux-aarch64-add-missing-header.patch    |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/strace/0001-linux-aarch64-add-missing-header.patch b/package/strace/0001-linux-aarch64-add-missing-header.patch
new file mode 100644
index 0000000..2b74775
--- /dev/null
+++ b/package/strace/0001-linux-aarch64-add-missing-header.patch
@@ -0,0 +1,25 @@
+From e1e838360288805b6cb561c21e4e7a1ea32e7772 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 4 Apr 2015 00:49:52 +0200
+Subject: [PATCH] linux/aarch64: add missing header.
+
+linux/aarch64/arch_regs.h file is missing in the strace-4.10.tar.xz archive.
+Add the one from the release 4.10 tag.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ linux/aarch64/arch_regs.h | 2 ++
+ 1 file changed, 2 insertions(+)
+ create mode 100644 linux/aarch64/arch_regs.h
+
+diff --git a/linux/aarch64/arch_regs.h b/linux/aarch64/arch_regs.h
+new file mode 100644
+index 0000000..9a5e33e
+--- /dev/null
++++ b/linux/aarch64/arch_regs.h
+@@ -0,0 +1,2 @@
++extern uint64_t *const aarch64_sp_ptr;
++extern uint32_t *const arm_sp_ptr;
+-- 
+1.9.3
+
