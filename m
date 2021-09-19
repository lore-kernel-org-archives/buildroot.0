Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8E0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:32:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3749A61074
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3749A61074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDBD06073A;
	Sun, 19 Sep 2021 12:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7iw8MKQdnl1J; Sun, 19 Sep 2021 12:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EB60606F6;
	Sun, 19 Sep 2021 12:32:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D45D1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 267DA40467
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BgP6hjcc9oEb for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:32:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0857A405E7
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:32:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 811BB8B7B0; Sun, 19 Sep 2021 12:30:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 14:28:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1eaaa658f3228ea5ed6b3d1733771eaf05193801
X-Git-Newrev: 2e52de40d2e028707e5c20d55805fe616c106b15
X-Patchwork-Hint: ignore
Message-Id: <20210919123045.811BB8B7B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: fix
 building on mips with GCC10
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
Content-Type: multipart/mixed; boundary="===============2591381189079576435=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============2591381189079576435==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2e52de40d2e028707e5c20d55805fe616c106b15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Port the following upstream commit:
https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/591/diffs?commit_id=0148a15da1616a868d71abe1b56e3f28cc79533c

This fixes the following build error on mips with GCC10:
  CCLD     libint10.la
buildroot/output/host/lib/gcc/mips64el-buildroot-linux-gnu/10.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: .libs/helper_mem.o:(.bss+0x0): multiple definition of `IOPortBase'; .libs/helper_exec.o:(.bss+0x0): first defined here

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...don-t-define-inb-outb-and-friends-on-mips.patch | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/0006-compiler.h-don-t-define-inb-outb-and-friends-on-mips.patch b/package/x11r7/xserver_xorg-server/0006-compiler.h-don-t-define-inb-outb-and-friends-on-mips.patch
new file mode 100644
index 0000000000..469ca7e3fc
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/0006-compiler.h-don-t-define-inb-outb-and-friends-on-mips.patch
@@ -0,0 +1,73 @@
+From de5e24b5036a1a5a877f8f30169e3497d0e296d6 Mon Sep 17 00:00:00 2001
+From: Julien Cristau <jcristau@debian.org>
+Date: Wed, 6 Jan 2021 10:20:53 +0100
+Subject: [PATCH] compiler.h: don't define inb/outb and friends on mips
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The definition relies on IOPortBase, which is only ever set in
+hw/xfree86/os-support/bsd/arm_video.c
+
+This caused build failures on linux/mips with GCC 10, due to this
+change (from https://gcc.gnu.org/gcc-10/changes.html#c):
+
+"GCC now defaults to -fno-common. As a result, global variable accesses
+are more efficient on various targets. In C, global variables with
+multiple tentative definitions now result in linker errors. With
+-fcommon such definitions are silently merged during linking."
+
+As a result anything including compiler.h would get its own definition
+of IOPortBase and the linker would error out.
+
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+---
+ hw/xfree86/common/compiler.h          | 8 ++------
+ hw/xfree86/os-support/bsd/arm_video.c | 3 +++
+ 2 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
+index 2b2008b3f..eb788d3fd 100644
+--- a/hw/xfree86/common/compiler.h
++++ b/hw/xfree86/common/compiler.h
+@@ -518,14 +518,10 @@ xf86WriteMmio32Le(__volatile__ void *base, const unsigned long offset,
+     barrier();
+ }
+ 
+-#elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
+-#if defined(__arm32__) || defined(__mips64)
++#elif defined(__arm32__) && !defined(__linux__)
+ #define PORT_SIZE long
+-#else
+-#define PORT_SIZE short
+-#endif
+ 
+-_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
++extern _X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
+ 
+ static __inline__ void
+ outb(unsigned PORT_SIZE port, unsigned char val)
+diff --git a/hw/xfree86/os-support/bsd/arm_video.c b/hw/xfree86/os-support/bsd/arm_video.c
+index dd1020e33..180d70543 100644
+--- a/hw/xfree86/os-support/bsd/arm_video.c
++++ b/hw/xfree86/os-support/bsd/arm_video.c
+@@ -65,6 +65,7 @@
+ #include "xf86Priv.h"
+ #include "xf86_OSlib.h"
+ #include "xf86OSpriv.h"
++#include "compiler.h"
+ 
+ #if defined(__NetBSD__) && !defined(MAP_FILE)
+ #define MAP_FLAGS MAP_SHARED
+@@ -162,6 +163,8 @@ xf86DisableIO()
+ 
+ #if defined(USE_ARC_MMAP) || defined(__arm32__)
+ 
++unsigned int IOPortBase;
++
+ Bool
+ xf86EnableIO()
+ {
+-- 
+2.32.0
+

--===============2591381189079576435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2591381189079576435==--
