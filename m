From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:32:05 +0200
Subject: [Buildroot] [PATCH/next 6/6] package/squeezelite: Fix build with
 FFmpeg 4.0
In-Reply-To: <20180812203205.7251-1-bernd.kuhls@t-online.de>
References: <20180812203205.7251-1-bernd.kuhls@t-online.de>
Message-ID: <20180812203205.7251-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/squeezelite/0004-ffmpeg4.0.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/squeezelite/0004-ffmpeg4.0.patch

diff --git a/package/squeezelite/0004-ffmpeg4.0.patch b/package/squeezelite/0004-ffmpeg4.0.patch
new file mode 100644
index 0000000000..55f194f10a
--- /dev/null
+++ b/package/squeezelite/0004-ffmpeg4.0.patch
@@ -0,0 +1,21 @@
+Description: Fix FTBFS with FFmpeg 4.0
+Author: James Cowgill <jcowgill@debian.org>
+Bug-Debian: https://bugs.debian.org/888335
+
+Downloaded from Debian:
+https://sources.debian.org/src/squeezelite/1.8-4.1/debian/patches/ffmpeg4.0.patch/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+--- a/ffmpeg.c
++++ b/ffmpeg.c
+@@ -264,7 +264,7 @@ static decode_state ff_decode(void) {
+ 		ff->mmsh_bytes_left = ff->mmsh_bytes_pad = ff->mmsh_packet_len = 0;
+ 
+ 		if (!ff->readbuf) {
+-			ff->readbuf = AV(ff, malloc, READ_SIZE +  FF_INPUT_BUFFER_PADDING_SIZE);
++			ff->readbuf = AV(ff, malloc, READ_SIZE +  AV_INPUT_BUFFER_PADDING_SIZE);
+ 		}
+ 
+ 		avio = AVIO(ff, alloc_context, ff->readbuf, READ_SIZE, 0, NULL, _read_data, NULL, NULL);
-- 
2.18.0
