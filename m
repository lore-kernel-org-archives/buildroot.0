From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Mar 2017 17:44:33 +0100
Subject: [Buildroot] [PATCH] package/fakeroot: backport patch
Message-ID: <1489423473-2172-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport the single change there is between 1.10.2 and 1.21.

We do not bump to 1.21 because the tarball for 1.21 does not contain the
generated autostuff, which would require we autoreconf fakeroot, but
that pulls in dependencies on host-autoconf, host-automake, host-m4 and
host-libtool, which is a little tiny-weeny bit too much.

So we just backport that single change.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Andreas Naumann <dev@andin.de>
---
 package/fakeroot/0002-message-buffer-size.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/fakeroot/0002-message-buffer-size.patch

diff --git a/package/fakeroot/0002-message-buffer-size.patch b/package/fakeroot/0002-message-buffer-size.patch
new file mode 100644
index 0000000..d023569
--- /dev/null
+++ b/package/fakeroot/0002-message-buffer-size.patch
@@ -0,0 +1,16 @@
+Increase the buffer size for IPC messages
+
+[yann.morin.1998 at free.fr: backported from 1.21]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+--- fakeroot-1.20.2/message.h	2014-10-05 17:16:00.000000000 +0200
++++ fakeroot-1.21/message.h	2016-06-26 23:19:15.000000000 +0200
+@@ -64,7 +64,7 @@
+ #pragma pack()
+ #endif
+ 
+-#define MAX_IPC_BUFFER_SIZE 256
++#define MAX_IPC_BUFFER_SIZE 1024
+ 
+ #if __SUNPRO_C
+ #pragma pack(4)
-- 
2.7.4
