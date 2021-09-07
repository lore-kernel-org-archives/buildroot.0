Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57051C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:56:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18F4660E8B
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18F4660E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B21FF40015;
	Tue,  7 Sep 2021 13:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4nhTPEyTf1q; Tue,  7 Sep 2021 13:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A8E040169;
	Tue,  7 Sep 2021 13:56:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF7161BF995
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EE674039A
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id unrAFN3RoWuN for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:56:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B18540393
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:56:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BCB888881B; Tue,  7 Sep 2021 13:54:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 15:25:38 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 83b14eb433896a588885d449d546a8437cf6b4cc
X-Git-Newrev: 2c9db9b2ddf393511b7b8e7bff31d163fadc1d96
X-Patchwork-Hint: ignore
Message-Id: <20210907135432.BCB888881B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/xen: fix build
 with 64 bits time_t
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2831300350604127976=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============2831300350604127976==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2c9db9b2ddf393511b7b8e7bff31d163fadc1d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix build of xen with 64 bits time_t:

/tmp/instance-0/output-1/build/xen-4.14.2/tools/qemu-xen/hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
/tmp/instance-0/output-1/build/xen-4.14.2/tools/qemu-xen/hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no member named 'time'
  198 |     if (gettimeofday(&evdev.time, NULL)) {
      |                            ^

Fixes:
 - http://autobuild.buildroot.org/results/136ce42f44bf48d3db4eda7b1548bf7ac1b97d51

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7ba9967287d2ae0063a0ce5ab1980221f04d3ed8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xen/0003-Fix-build-with-64-bits-time_t.patch   | 95 ++++++++++++++++++++++
 .../0004-libs-light-fix-tv_sec-printf-format.patch | 63 ++++++++++++++
 ...0005-libs-light-fix-tv_sec-fprintf-format.patch | 30 +++++++
 3 files changed, 188 insertions(+)

diff --git a/package/xen/0003-Fix-build-with-64-bits-time_t.patch b/package/xen/0003-Fix-build-with-64-bits-time_t.patch
new file mode 100644
index 0000000000..8559aece2d
--- /dev/null
+++ b/package/xen/0003-Fix-build-with-64-bits-time_t.patch
@@ -0,0 +1,95 @@
+From f7a6df5f5bf3acc219352a1b25573ae2082d7e42 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 3 Dec 2020 20:58:19 +0100
+Subject: [PATCH] Fix build with 64 bits time_t
+
+time element is deprecated on new input_event structure in kernel's
+input.h [1]
+
+This will avoid the following build failure:
+
+hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
+hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no member named 'time'
+  198 |     if (gettimeofday(&evdev.time, NULL)) {
+      |                            ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df86d3d599d5
+ - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429c51e43bbb
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Message-Id: <20201203195819.583626-1-fontaine.fabrice@gmail.com>
+Fixes: https://gitlab.com/qemu-project/qemu/-/issues/246
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+[Retrieved (and updated for qemu-xen) from:
+https://github.com/qemu/qemu/commit/f7a6df5f5bf3acc219352a1b25573ae2082d7e42]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ contrib/vhost-user-input/main.c | 8 ++++++--
+ hw/input/virtio-input-host.c    | 5 ++++-
+ 2 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/tools/qemu-xen/contrib/vhost-user-input/main.c b/tools/qemu-xen/contrib/vhost-user-input/main.c
+index c15d18c33f0c..081230da548a 100644
+--- a/tools/qemu-xen/contrib/vhost-user-input/main.c
++++ b/tools/qemu-xen/contrib/vhost-user-input/main.c
+@@ -6,13 +6,14 @@
+ #include "qemu/osdep.h"
+ 
+ #include <glib.h>
+-#include <linux/input.h>
++#include <sys/ioctl.h>
+ 
+ #include "qemu/iov.h"
+ #include "qemu/bswap.h"
+ #include "qemu/sockets.h"
+ #include "contrib/libvhost-user/libvhost-user.h"
+ #include "contrib/libvhost-user/libvhost-user-glib.h"
++#include "standard-headers/linux/input.h"
+ #include "standard-headers/linux/virtio_input.h"
+ #include "qapi/error.h"
+ 
+@@ -113,13 +114,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
+ static void vi_handle_status(VuInput *vi, virtio_input_event *event)
+ {
+     struct input_event evdev;
++    struct timeval tval;
+     int rc;
+ 
+-    if (gettimeofday(&evdev.time, NULL)) {
++    if (gettimeofday(&tval, NULL)) {
+         perror("vi_handle_status: gettimeofday");
+         return;
+     }
+ 
++    evdev.input_event_sec = tval.tv_sec;
++    evdev.input_event_usec = tval.tv_usec;
+     evdev.type = le16toh(event->type);
+     evdev.code = le16toh(event->code);
+     evdev.value = le32toh(event->value);
+diff --git a/tools/qemu-xen/hw/input/virtio-input-host.c b/tools/qemu-xen/hw/input/virtio-input-host.c
+index 85daf73f1a80..137efba57b0f 100644
+--- a/tools/qemu-xen/hw/input/virtio-input-host.c
++++ b/tools/qemu-xen/hw/input/virtio-input-host.c
+@@ -193,13 +193,16 @@ static void virtio_input_host_handle_status(VirtIOInput *vinput,
+ {
+     VirtIOInputHost *vih = VIRTIO_INPUT_HOST(vinput);
+     struct input_event evdev;
++    struct timeval tval;
+     int rc;
+ 
+-    if (gettimeofday(&evdev.time, NULL)) {
++    if (gettimeofday(&tval, NULL)) {
+         perror("virtio_input_host_handle_status: gettimeofday");
+         return;
+     }
+ 
++    evdev.input_event_sec = tval.tv_sec;
++    evdev.input_event_usec = tval.tv_usec;
+     evdev.type = le16_to_cpu(event->type);
+     evdev.code = le16_to_cpu(event->code);
+     evdev.value = le32_to_cpu(event->value);
diff --git a/package/xen/0004-libs-light-fix-tv_sec-printf-format.patch b/package/xen/0004-libs-light-fix-tv_sec-printf-format.patch
new file mode 100644
index 0000000000..fffc8d7307
--- /dev/null
+++ b/package/xen/0004-libs-light-fix-tv_sec-printf-format.patch
@@ -0,0 +1,63 @@
+From a8ac01aa3e3ea5e6a9a1620aa8fa7e9da3458120 Mon Sep 17 00:00:00 2001
+From: Manuel Bouyer <bouyer@netbsd.org>
+Date: Tue, 26 Jan 2021 23:47:55 +0100
+Subject: [PATCH] libs/light: fix tv_sec printf format
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Don't assume tv_sec is a unsigned long, it is 64 bits on NetBSD 32 bits.
+Use %jd and cast to (intmax_t) instead
+
+Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
+Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
+[Retrieved (and backported) from:
+https://gitlab.com/xen-project/xen/-/commit/a8ac01aa3e3ea5e6a9a1620aa8fa7e9da3458120]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/libs/light/libxl_create.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
+index 8616113e72..9848d65f36 100644
+--- a/tools/libxl/libxl_create.c
++++ b/tools/libxl/libxl_create.c
+@@ -496,7 +496,7 @@ int libxl__domain_build(libxl__gc *gc,
+         vments[2] = "image/ostype";
+         vments[3] = "hvm";
+         vments[4] = "start_time";
+-        vments[5] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
++        vments[5] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
+ 
+         localents = libxl__calloc(gc, 13, sizeof(char *));
+         i = 0;
+@@ -535,7 +535,7 @@ int libxl__domain_build(libxl__gc *gc,
+         vments[i++] = "image/kernel";
+         vments[i++] = (char *) state->pv_kernel.path;
+         vments[i++] = "start_time";
+-        vments[i++] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
++        vments[i++] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
+         if (state->pv_ramdisk.path) {
+             vments[i++] = "image/ramdisk";
+             vments[i++] = (char *) state->pv_ramdisk.path;
+@@ -1502,7 +1502,7 @@ static void domcreate_stream_done(libxl__egc *egc,
+         vments[2] = "image/ostype";
+         vments[3] = "hvm";
+         vments[4] = "start_time";
+-        vments[5] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
++        vments[5] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
+         break;
+     case LIBXL_DOMAIN_TYPE_PV:
+         vments = libxl__calloc(gc, 11, sizeof(char *));
+@@ -1512,7 +1512,7 @@ static void domcreate_stream_done(libxl__egc *egc,
+         vments[i++] = "image/kernel";
+         vments[i++] = (char *) state->pv_kernel.path;
+         vments[i++] = "start_time";
+-        vments[i++] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
++        vments[i++] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
+         if (state->pv_ramdisk.path) {
+             vments[i++] = "image/ramdisk";
+             vments[i++] = (char *) state->pv_ramdisk.path;
+-- 
+GitLab
+
diff --git a/package/xen/0005-libs-light-fix-tv_sec-fprintf-format.patch b/package/xen/0005-libs-light-fix-tv_sec-fprintf-format.patch
new file mode 100644
index 0000000000..d677dce4fc
--- /dev/null
+++ b/package/xen/0005-libs-light-fix-tv_sec-fprintf-format.patch
@@ -0,0 +1,30 @@
+From 4881285bcfd8f2e2c913c6e9f011b1e90652f414 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 28 Aug 2021 11:00:07 +0200
+Subject: [PATCH] libs/light: fix tv_sec fprintf format
+
+Don't assume tv_sec is a unsigned long, it is 64 bits on NetBSD 32 bits.
+Use %jd and cast to (intmax_t) instead
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to xen-devel@lists.xenproject.org]
+---
+ tools/libs/light/libxl_domain.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/libxl/libxl_domain.c b/tools/libxl/libxl_domain.c
+index c00c36c928..51a6127552 100644
+--- a/tools/libxl/libxl_domain.c
++++ b/tools/libxl/libxl_domain.c
+@@ -1444,7 +1444,7 @@ static int libxl__mark_domid_recent(libxl__gc *gc, uint32_t domid)
+         }
+     }
+ 
+-    r = fprintf(nf, "%lu %u\n", ctxt.ts.tv_sec, domid);
++    r = fprintf(nf, "%jd %u\n", (intmax_t)ctxt.ts.tv_sec, domid);
+     if (r < 0) {
+         LOGED(ERROR, domid, "failed to write to '%s'", new);
+         goto out;
+-- 
+2.32.0
+

--===============2831300350604127976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2831300350604127976==--
