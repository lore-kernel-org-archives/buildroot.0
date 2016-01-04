From: Doug Kehn <rdkehn@yahoo.com>
Date: Mon,  4 Jan 2016 08:23:00 -0600
Subject: [Buildroot] [PATCH 1/1] package/sp-oops-extract: consolidate use of
	stdint types
Message-ID: <1451917380-2270-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change u_int*_t to uint*_t for compatibility with a larger number of C
libraries.

This patch resolves 2016-01-02 auto-build failure. This patch has also
been submitted upstream (ptxdist at pengutronix.de).

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/sp-oops-extract/0002-stdint-cleanup.patch | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/sp-oops-extract/0002-stdint-cleanup.patch

diff --git a/package/sp-oops-extract/0002-stdint-cleanup.patch b/package/sp-oops-extract/0002-stdint-cleanup.patch
new file mode 100644
index 0000000..255fe8a
--- /dev/null
+++ b/package/sp-oops-extract/0002-stdint-cleanup.patch
@@ -0,0 +1,33 @@
+consolidate use of stdint types
+
+Change u_int*_t to uint*_t for compatibility with a larger number of C
+libraries.
+
+Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
+
+Index: sp-oops-extract-0.0.7-1/src/oopslog.c
+===================================================================
+--- sp-oops-extract-0.0.7-1.orig/src/oopslog.c
++++ sp-oops-extract-0.0.7-1/src/oopslog.c
+@@ -64,8 +64,8 @@ static int try_to_check_for_bad_blocks(v
+ 
+ int main(const int argc, const char *argv[])
+ {
+-	u_int32_t *count, maxcount = 0xffffffff;
+-	u_int32_t *magic_ptr, magic_value = 0x5d005d00;
++	uint32_t *count, maxcount = 0xffffffff;
++	uint32_t *magic_ptr, magic_value = 0x5d005d00;
+ 	
+ 	unsigned char *charbuf;
+ 	unsigned long size;
+@@ -137,8 +137,8 @@ int main(const int argc, const char *arg
+ 		errx(-1, "%s is something weird", device);
+ 
+ 	charbuf = buf;	
+-	count = (u_int32_t *) buf;
+-	magic_ptr = (u_int32_t *) (buf + sizeof(u_int32_t));
++	count = (uint32_t *) buf;
++	magic_ptr = (uint32_t *) (buf + sizeof(uint32_t));
+ 
+ 	for (i = 0; i < (size / OOPS_PAGE_SIZE); i++) {
+ 		pread(fd, buf, OOPS_PAGE_SIZE, i * OOPS_PAGE_SIZE);
-- 
2.6.4
