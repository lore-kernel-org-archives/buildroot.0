From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 15:55:13 +0200
Subject: [Buildroot] [git commit] xen: remove -Werror when building host
	tools
Message-ID: <20160917141134.06EF681D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce29aaf030bdb82c5eec5ab8deafad6a863a3331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-Remove-hardcoded-strict-Werror-checking.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
new file mode 100644
index 0000000..ca772dd
--- /dev/null
+++ b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
@@ -0,0 +1,26 @@
+From 234847440a5d3cf95540ea79f7a08d50cccfef73 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Tue, 13 Sep 2016 10:48:31 -0700
+Subject: [PATCH] Remove hardcoded strict -Werror checking
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ Config.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Config.mk b/Config.mk
+index bd991c6..e7ac662 100644
+--- a/Config.mk
++++ b/Config.mk
+@@ -36,7 +36,7 @@ CONFIG_$(XEN_OS) := y
+ SHELL     ?= /bin/sh
+ 
+ # Tools to run on system hosting the build
+-HOSTCFLAGS  = -Wall -Werror -Wstrict-prototypes -O2 -fomit-frame-pointer
++HOSTCFLAGS  = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
+ HOSTCFLAGS += -fno-strict-aliasing
+ 
+ DISTDIR     ?= $(XEN_ROOT)/dist
+-- 
+2.7.4
+
