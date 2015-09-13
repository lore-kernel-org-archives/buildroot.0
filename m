From: David du Colombier <0intro@gmail.com>
Date: Sun, 13 Sep 2015 23:16:21 +0200
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: fix static link with
	readline
Message-ID: <1442178981-24635-1-git-send-email-0intro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When linking statically, the order of libraries on the
linker command matters, since readline depends on ncurses.

Signed-off-by: David du Colombier <0intro@gmail.com>
---
 package/wpa_supplicant/0005-fix-readline-libs-ordering.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/wpa_supplicant/0005-fix-readline-libs-ordering.patch

diff --git a/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch b/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch
new file mode 100644
index 0000000..b2439f0
--- /dev/null
+++ b/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch
@@ -0,0 +1,11 @@
+--- ./wpa_supplicant/Makefile
++++ ./wpa_supplicant/Makefile
+@@ -1379,7 +1379,7 @@
+ 
+ ifdef CONFIG_READLINE
+ OBJS_c += ../src/utils/edit_readline.o
+-LIBS_c += -lncurses -lreadline
++LIBS_c += -lreadline -lncurses
+ else
+ ifdef CONFIG_WPA_CLI_EDIT
+ OBJS_c += ../src/utils/edit.o
-- 
1.8.3.1
