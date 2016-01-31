From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 19:01:44 +0100
Subject: [Buildroot] [PATCH 2/2] package/sredird: fix musl build
In-Reply-To: <1454263304-17588-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454263304-17588-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454263304-17588-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/4bc/4bc77733d235ba12f70432be4ead921666f5121d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sredird/0001-termio.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/sredird/0001-termio.patch

diff --git a/package/sredird/0001-termio.patch b/package/sredird/0001-termio.patch
new file mode 100644
index 0000000..7c7c67f
--- /dev/null
+++ b/package/sredird/0001-termio.patch
@@ -0,0 +1,20 @@
+Fix musl build
+
+Patch was inspired by
+http://svnweb.freebsd.org/ports/head/comms/sredird/files/patch-sredird.c?revision=363168&view=markup
+http://ftp.netbsd.org/pub/pkgsrc/current/pkgsrc/sysutils/sredird/patches/patch-aa
+https://github.com/bitrig/bitrig-ports/blob/master/comms/sredird/patches/patch-sredird_c
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr sredird-2.2.2.org/sredird.c sredird-2.2.2/sredird.c
+--- sredird-2.2.2.org/sredird.c	2005-08-12 16:10:46.000000000 +0200
++++ sredird-2.2.2/sredird.c	2016-01-31 18:53:08.000000000 +0100
+@@ -110,7 +110,6 @@
+ #include <fcntl.h>
+ #include <syslog.h>
+ #include <termios.h>
+-#include <termio.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ #include <netinet/ip.h>
-- 
2.7.0
