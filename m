From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Mar 2011 00:03:52 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: 1.18.3 cksum fix
Message-ID: <20110311230654.4D1E88FE06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=03a5df1353f7f154f26edaac1d60d30976774656
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.18.3/busybox-1.18.3-cksum.patch      |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.18.3/busybox-1.18.3-cksum.patch

diff --git a/package/busybox/busybox-1.18.3/busybox-1.18.3-cksum.patch b/package/busybox/busybox-1.18.3/busybox-1.18.3-cksum.patch
new file mode 100644
index 0000000..97b05a0
--- /dev/null
+++ b/package/busybox/busybox-1.18.3/busybox-1.18.3-cksum.patch
@@ -0,0 +1,10 @@
+--- busybox-1.18.3/coreutils/cksum.c
++++ busybox-1.18.3-cksum/coreutils/cksum.c
+@@ -38,6 +38,7 @@ int cksum_main(int argc UNUSED_PARAM, ch
+ 
+ #define read_buf bb_common_bufsiz1
+ 		while ((bytes_read = safe_read(fd, read_buf, sizeof(read_buf))) > 0) {
++			length += bytes_read;
+ 			crc = crc32_block_endian1(crc, read_buf, bytes_read, crc32_table);
+ 		}
+ 		close(fd);
-- 
1.7.3.4
