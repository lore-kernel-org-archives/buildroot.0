From: Will Newton <will.newton@gmail.com>
Date: Tue, 21 May 2013 21:33:29 +0100
Subject: [Buildroot] [PATCH] urg: Add urg-select-h.patch.
Message-ID: <CAFbHwiSckZivoEYjZQPsp-oX9_t8hR5cviVkGvwGLvq=xYkPSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes a build failure on AArch64 (and potentially others).
Make sure sys/select.h is included before using select(2).

Signed-off-by: Will Newton <will.newton@linaro.org>
---
 package/urg/urg-select-h.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/urg/urg-select-h.patch

diff --git a/package/urg/urg-select-h.patch b/package/urg/urg-select-h.patch
new file mode 100644
index 0000000..09d1530
--- /dev/null
+++ b/package/urg/urg-select-h.patch
@@ -0,0 +1,11 @@
+--- urg-0.8.18/src/c/connection/serial_ctrl_lin.c    2010-11-22
01:48:01.000000000 +0000
++++ urg-0.8.18.mod/src/c/connection/serial_ctrl_lin.c    2013-05-21
20:56:35.822025969 +0100
+@@ -17,7 +17,7 @@
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <string.h>
+-
++#include <sys/select.h>
+ //#include <ctype.h>
+
+ enum {
--
1.8.1.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-urg-Add-urg-select-h.patch.patch
Type: application/octet-stream
Size: 1047 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130521/6ed1509d/attachment.obj>
