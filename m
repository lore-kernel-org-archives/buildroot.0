From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Aug 2020 12:09:01 +0200
Subject: [Buildroot] [git commit] package/tftpd: fix build with gcc 10.x
Message-ID: <20200807100353.6E649842C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35b014ab8b787e0e44b503fe945b2627dbe41f09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Take a patch from Fedora to fix the build of tftpd with gcc 10.x.

Fixes:

  http://autobuild.buildroot.net/results/750ddefd2c31872fd44e9ae70d87048d8512849d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...se-extern-qualifier-to-fix-gcc-10.x-build.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch b/package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch
new file mode 100644
index 0000000000..c964555347
--- /dev/null
+++ b/package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch
@@ -0,0 +1,29 @@
+From 6f994166d8571961a08479736ae86c5baa2bb47f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 7 Aug 2020 12:07:45 +0200
+Subject: [PATCH] Use "extern" qualifier to fix gcc 10.x build
+
+Patch from
+https://src.fedoraproject.org/rpms/tftp/raw/master/f/tftp-hpa-5.2-gcc10.patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ tftp/tftp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tftp/tftp.c b/tftp/tftp.c
+index d15da22..d067f96 100644
+--- a/tftp/tftp.c
++++ b/tftp/tftp.c
+@@ -48,7 +48,7 @@ extern int maxtimeout;
+ #define PKTSIZE    SEGSIZE+4
+ char ackbuf[PKTSIZE];
+ int timeout;
+-sigjmp_buf toplevel;
++extern sigjmp_buf toplevel;
+ sigjmp_buf timeoutbuf;
+ 
+ static void nak(int, const char *);
+-- 
+2.26.2
+
