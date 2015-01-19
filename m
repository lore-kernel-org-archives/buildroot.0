From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 20 Jan 2015 00:29:57 +0100
Subject: [Buildroot] [PATCH 3/4] boot/syslinux: disable MinGW support
In-Reply-To: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
References: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1421710198-20898-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If MinGW is found on the host, syslinux.exe and syslinux64.exe
are build. Disable it since there are no MinGW support in
Buildroot.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 boot/syslinux/0001-disable-MinGW-support.patch | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 boot/syslinux/0001-disable-MinGW-support.patch

diff --git a/boot/syslinux/0001-disable-MinGW-support.patch b/boot/syslinux/0001-disable-MinGW-support.patch
new file mode 100644
index 0000000..3711afd
--- /dev/null
+++ b/boot/syslinux/0001-disable-MinGW-support.patch
@@ -0,0 +1,29 @@
+From 0455fc58e191687931fe2c0eb5ab4b1d9b970aa4 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 17 Jan 2015 19:16:50 +0100
+Subject: [PATCH 1/1] disable MinGW support
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ win32/find-mingw32.sh | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/win32/find-mingw32.sh b/win32/find-mingw32.sh
+index 51dcdd7..674f46a 100755
+--- a/win32/find-mingw32.sh
++++ b/win32/find-mingw32.sh
+@@ -2,6 +2,11 @@
+ 
+ cc="$1"
+ 
++# There is no mingw package in Buildroot.
++# Don't use mingw from the host
++echo missing-
++exit 1
++
+ for prefix in \
+     mingw- \
+     mingw32- \
+-- 
+1.9.3
+
-- 
1.9.3
