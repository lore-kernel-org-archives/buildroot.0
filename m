From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2016 22:23:56 +0100
Subject: [Buildroot] [git commit] package/sp-oops-extract: consolidate use
	of stdint types
Message-ID: <20160105214313.ED9728274E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7d5420144cbc98a38501de712b24ac0dc60eb9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change u_int*_t to uint*_t for compatibility, as the latter is in C99:

https://stackoverflow.com/questions/5090737/datatypes-used-in-c

Fixes:
http://autobuild.buildroot.net/results/c649822aa129d56e5462a4887b13811340564453/

This patch has also been submitted upstream (ptxdist at pengutronix.de).

Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sp-oops-extract/0002-stdint-cleanup.patch | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/sp-oops-extract/0002-stdint-cleanup.patch b/package/sp-oops-extract/0002-stdint-cleanup.patch
new file mode 100644
index 0000000..70317a7
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
