Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030D8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:49:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B9561264
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0B9561264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FD9542723;
	Mon,  4 Oct 2021 12:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIuZI03stkIx; Mon,  4 Oct 2021 12:49:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 319A142733;
	Mon,  4 Oct 2021 12:49:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C40B81BF97D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCFC4405FA
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViYhGCpHJ_2Y for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 12:49:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B22D94022E
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 12:49:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6A7C78DC40; Mon,  4 Oct 2021 12:47:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 14:23:54 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 789efcea4f8040fb8f956236a86194c9f33741ba
X-Git-Newrev: 124c7d23e49177b2b98636d492c3a6fa0f772c8c
X-Patchwork-Hint: ignore
Message-Id: <20211004124705.6A7C78DC40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
 package/x11r7/xserver_xorg-server: fix building on mips with GCC10
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
Content-Type: multipart/mixed; boundary="===============1719461737936644764=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1719461737936644764==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=124c7d23e49177b2b98636d492c3a6fa0f772c8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Port the following upstream commit:
https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/591/diffs?commit_id=0148a15da1616a868d71abe1b56e3f28cc79533c

This fixes the following build error on mips with GCC10:
  CCLD     libint10.la
buildroot/output/host/lib/gcc/mips64el-buildroot-linux-gnu/10.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: .libs/helper_mem.o:(.bss+0x0): multiple definition of `IOPortBase'; .libs/helper_exec.o:(.bss+0x0): first defined here

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2e52de40d2e028707e5c20d55805fe616c106b15)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============1719461737936644764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1719461737936644764==--
