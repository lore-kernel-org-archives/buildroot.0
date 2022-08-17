Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D898DC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 10:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76DF583298;
	Wed, 17 Aug 2022 10:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76DF583298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhPzd8Eli9ps; Wed, 17 Aug 2022 10:45:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E288832AA;
	Wed, 17 Aug 2022 10:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E288832AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69ED91BF377
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 10:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42D7E41A0D
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 10:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D7E41A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16uxsYiPdQ0F for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 10:45:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AD4141A02
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 10:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AD4141A02
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5EFE387985; Wed, 17 Aug 2022 10:31:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 12:43:48 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0fa5de37f1b2b864e04a22314f43a6aaf13db6ec
X-Git-Newrev: 69af5ab34fc6c092f90fd3103f5f98818b1de71c
X-Patchwork-Hint: ignore
Message-Id: <20220817103109.5EFE387985@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rpi-userland: add
 GLint64, GLuint64 and GLsync typedefs to GLES2/gl2ext.h
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1498948390327099689=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1498948390327099689==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=69af5ab34fc6c092f90fd3103f5f98818b1de71c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=13796

.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/gstreamer-1.0/gst/gl/glprototypes/gstgl_compat.h:40:18: error: conflicting declaration ‘typedef void* GLsync’
   40 | typedef gpointer GLsync;
      |                  ^~~~~~

.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/qt5/QtGui/qopengles2ext.h:24:26: note: previous declaration as ‘typedef struct __GLsync* GLsync’
   24 | typedef struct __GLsync *GLsync;
      |                          ^~~~~~

File gstgl_compat.h:

 39 #if !GST_GL_HAVE_GLSYNC
 40 typedef gpointer GLsync;
 41 #endif

File qopengles2ext.h:

   1 #ifndef __gles2_gl2ext_h_
   2 #define __gles2_gl2ext_h_ 1
   3
   4 #if 0
   5 #pragma qt_no_master_include
   6 #pragma qt_sync_skip_header_check
   7 #pragma qt_sync_stop_processing
   8 #endif
   9
  10 #ifdef __cplusplus
  11 extern "C" {
  12 #endif
  13
  14 #ifndef __gl3_h_
  15 /* These types are defined with reference to <inttypes.h>
  16  * in the Apple extension spec, but here we use the Khronos
  17  * portable types in khrplatform.h, and assume those types
  18  * are always defined.
  19  * If any other extensions using these types are defined,
  20  * the typedefs must move out of this block and be shared.
  21  */
  22 typedef khronos_int64_t GLint64;
  23 typedef khronos_uint64_t GLuint64;
  24 typedef struct __GLsync *GLsync;
  25 #endif

The problem is that rpi-userland doesn't define GLsync, and both
GStreamer and Qt have their own definition of GLsync in this case, but
they are not the same.

We reported this issue to:

 * rpi-userland, to get the headers updated:
   https://github.com/raspberrypi/userland/issues/469#issuecomment-1193864294

 * gstreamer, to get their bogus definition of GLsync fixed:
   https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues/973

In the mean time, fix this by adding the missing definitions to
rpi-userland, so that GStreamer and Qt don't try to provide their own.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e008c0bb104eb952cab27b3887912529f9e8e10e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t.h-add-GLint64-GLuint64-and-GLsync-typed.patch | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch b/package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch
new file mode 100644
index 0000000000..6dca2e7b8a
--- /dev/null
+++ b/package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch
@@ -0,0 +1,99 @@
+From ffb8eafe2d745ddf2f44101ffc4e6599ed096e69 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 10 May 2021 19:15:48 +0200
+Subject: [PATCH] GLES2/gl2ext.h: add GLint64, GLuint64 and GLsync typedefs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/gstreamer-1.0/gst/gl/glprototypes/gstgl_compat.h:40:18: error: conflicting declaration ‘typedef void* GLsync’
+   40 | typedef gpointer GLsync;
+      |                  ^~~~~~
+
+.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/qt5/QtGui/qopengles2ext.h:24:26: note: previous declaration as ‘typedef struct __GLsync* GLsync’
+   24 | typedef struct __GLsync *GLsync;
+      |                          ^~~~~~
+
+File gstgl_compat.h:
+
+ 39 #if !GST_GL_HAVE_GLSYNC
+ 40 typedef gpointer GLsync;
+ 41 #endif
+
+File qopengles2ext.h:
+
+   1 #ifndef __gles2_gl2ext_h_
+   2 #define __gles2_gl2ext_h_ 1
+   3
+   4 #if 0
+   5 #pragma qt_no_master_include
+   6 #pragma qt_sync_skip_header_check
+   7 #pragma qt_sync_stop_processing
+   8 #endif
+   9
+  10 #ifdef __cplusplus
+  11 extern "C" {
+  12 #endif
+  13
+  14 #ifndef __gl3_h_
+  15 /* These types are defined with reference to <inttypes.h>
+  16  * in the Apple extension spec, but here we use the Khronos
+  17  * portable types in khrplatform.h, and assume those types
+  18  * are always defined.
+  19  * If any other extensions using these types are defined,
+  20  * the typedefs must move out of this block and be shared.
+  21  */
+  22 typedef khronos_int64_t GLint64;
+  23 typedef khronos_uint64_t GLuint64;
+  24 typedef struct __GLsync *GLsync;
+  25 #endif
+
+The problem is that rpi-userland doesn't define GLsync, and both
+GStreamer and Qt have their own definition of GLsync in this case, but
+they are not the same.
+
+We reported this issue to:
+
+ * rpi-userland, to get the headers updated:
+   https://github.com/raspberrypi/userland/issues/469#issuecomment-1193864294
+
+ * gstreamer, to get their bogus definition of GLsync fixed:
+   https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues/973
+
+In the mean time, fix this by adding the missing definitions to
+rpi-userland, so that GStreamer and Qt don't try to provide their own.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ interface/khronos/include/GLES2/gl2ext.h | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/interface/khronos/include/GLES2/gl2ext.h b/interface/khronos/include/GLES2/gl2ext.h
+index 4eacf7f..96e87ec 100644
+--- a/interface/khronos/include/GLES2/gl2ext.h
++++ b/interface/khronos/include/GLES2/gl2ext.h
+@@ -33,6 +33,19 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ extern "C" {
+ #endif
+ 
++#ifndef __gl3_h_
++/* These types are defined with reference to <inttypes.h>
++ * in the Apple extension spec, but here we use the Khronos
++ * portable types in khrplatform.h, and assume those types
++ * are always defined.
++ * If any other extensions using these types are defined,
++ * the typedefs must move out of this block and be shared.
++ */
++typedef khronos_int64_t GLint64;
++typedef khronos_uint64_t GLuint64;
++typedef struct __GLsync *GLsync;
++#endif
++
+ /* We want this */
+ #ifndef GL_GLEXT_PROTOTYPES
+ #define GL_GLEXT_PROTOTYPES
+-- 
+2.31.1
+

--===============1498948390327099689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1498948390327099689==--
