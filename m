From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Jan 2016 09:59:03 +0100
Subject: [Buildroot] [git commit] sp-oops-extract: correct dos/unix newlines
	in stdint patch
Message-ID: <20160106085934.406BB82718@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba2b722580492075461f1dea62f017ec4ca4089b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f72/f72fc7189cbc7191f1b75a8ebd1fc319650c8e2e/

The source code uses dos newlines, so the patch has to do so as well,
otherwise apply-patches.sh fails to apply the patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sp-oops-extract/0002-stdint-cleanup.patch | 40 +++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/package/sp-oops-extract/0002-stdint-cleanup.patch b/package/sp-oops-extract/0002-stdint-cleanup.patch
index 70317a7..255fe8a 100644
--- a/package/sp-oops-extract/0002-stdint-cleanup.patch
+++ b/package/sp-oops-extract/0002-stdint-cleanup.patch
@@ -10,24 +10,24 @@ Index: sp-oops-extract-0.0.7-1/src/oopslog.c
 --- sp-oops-extract-0.0.7-1.orig/src/oopslog.c
 +++ sp-oops-extract-0.0.7-1/src/oopslog.c
 @@ -64,8 +64,8 @@ static int try_to_check_for_bad_blocks(v
- 
- int main(const int argc, const char *argv[])
- {
--	u_int32_t *count, maxcount = 0xffffffff;
--	u_int32_t *magic_ptr, magic_value = 0x5d005d00;
-+	uint32_t *count, maxcount = 0xffffffff;
-+	uint32_t *magic_ptr, magic_value = 0x5d005d00;
- 	
- 	unsigned char *charbuf;
- 	unsigned long size;
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
 @@ -137,8 +137,8 @@ int main(const int argc, const char *arg
- 		errx(-1, "%s is something weird", device);
- 
- 	charbuf = buf;	
--	count = (u_int32_t *) buf;
--	magic_ptr = (u_int32_t *) (buf + sizeof(u_int32_t));
-+	count = (uint32_t *) buf;
-+	magic_ptr = (uint32_t *) (buf + sizeof(uint32_t));
- 
- 	for (i = 0; i < (size / OOPS_PAGE_SIZE); i++) {
- 		pread(fd, buf, OOPS_PAGE_SIZE, i * OOPS_PAGE_SIZE);
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
