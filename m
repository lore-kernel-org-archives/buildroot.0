From: Viacheslav Volkov <sv99@inbox.ru>
Date: Wed, 9 Dec 2015 16:40:49 +0300
Subject: [Buildroot] [PATCH] gstreamer/gst-plugins-good correct patch
 0001-linux36.patch
Message-ID: <56682F61.90106@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supress warning message

>>> gst-plugins-good 0.10.31 Patching

Applying 0001-linux36.patch using patch:
patching file sys/v4l2/gstv4l2bufferpool.c
Hunk #1 succeeded at 181 with fuzz 2 (offset -1 lines).
 
Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
---
 package/gstreamer/gst-plugins-good/0001-linux36.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-plugins-good/0001-linux36.patch
b/package/gstreamer/gst-plugins-good/0001-linux36.patch
index 5d7cd93..99d62dd 100644
--- a/package/gstreamer/gst-plugins-good/0001-linux36.patch
+++ b/package/gstreamer/gst-plugins-good/0001-linux36.patch
@@ -25,13 +25,13 @@ diff --git a/sys/v4l2/gstv4l2bufferpool.c
b/sys/v4l2/gstv4l2bufferpool.c
 index 2e3a563..5aaed5a 100644
 --- a/sys/v4l2/gstv4l2bufferpool.c
 +++ b/sys/v4l2/gstv4l2bufferpool.c
-@@ -182,7 +182,6 @@ gst_v4l2_buffer_new (GstV4l2BufferPool * pool,
guint index, GstCaps * caps)
+@@ -181,7 +181,6 @@ gst_v4l2_buffer_new (GstV4l2BufferPool * pool,
guint index, GstCaps * caps)
      GST_LOG_OBJECT (pool->v4l2elem, "  MMAP offset:  %u",
          ret->vbuffer.m.offset);
    GST_LOG_OBJECT (pool->v4l2elem, "  length:    %u", ret->vbuffer.length);
 -  GST_LOG_OBJECT (pool->v4l2elem, "  input:     %u", ret->vbuffer.input);

-   ret->mmap_length = ret->vbuffer.length;
    data = (guint8 *) v4l2_mmap (0, ret->vbuffer.length,
+       PROT_READ | PROT_WRITE, MAP_SHARED, pool->video_fd,
 --
 cgit v0.9.0.2-2-gbebe
-- 
1.9.1
