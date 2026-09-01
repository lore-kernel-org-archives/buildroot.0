Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F57C624D0
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 19:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37EE360749;
	Tue,  1 Sep 2026 19:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wf-6tdueA5r; Tue,  1 Sep 2026 19:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788290118;
	bh=jAWFK2mxNbQNlxL1LngLWzhYM3GxHQOZ3zZpLaRK/AA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bJoHeHukACxPJrWRVwJVbTvVsUBaQeIVTV0aw/iHBbS5xmTewwwlbUpEVx6DUvhIc
	 3Fcf67T3IuZLCQFy4kvy/J8SJ9iwNZO542GJYm2BLTZTjU3sY7u0hF5Dq4o9Zzg/SS
	 iTvzfn3/cg3CQ614b31LnEzs6KdnSIXJi0JC6tR2Y8FQ6Ro8QIXWN757XbN6hF724g
	 LCsdn1DQPAC6eyjzA8ObsKv/QuAUVnLB7A4TLLI7WxpsCygNlMeM9dzqtOlnKSBehD
	 M7vfpxjz9XW+kR4rg//9PIl++A0uL2BCN6LSYJ6MTue9nwFI+9WOcMFePjr0JaulN9
	 9ZiaWjFGoSajQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1BE607B1;
	Tue,  1 Sep 2026 19:15:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BFD23AF
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 526C340781
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueZB5gHFgs1v for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 19:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC50F40770
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 19:15:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B41BF9355C; Tue,  1 Sep 2026 19:14:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 21:14:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a31afeb8a4c5f964e657f8b5753868eef0303081
X-Git-Newrev: 45acb281caa9fa30799426ba7ef4694c0b61fa85
X-Patchwork-Hint: ignore
Message-Id: <20260901191416.B41BF9355C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dracut: pass HOST_CONFIGURE_OPTS
 to make
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45acb281caa9fa30799426ba7ef4694c0b61fa85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Dracut-internal executables were linked against system libraries,
instead of Buildroot host packages. For example:

$ ldd host/lib/dracut/dracut-install
	linux-vdso.so.1 (0x00007f578cf06000)
	libc.so.6 => /usr/lib/x86_64-linux-gnu/libc.so.6 (0x00007f578cccd000)
	libkmod.so.2 => /usr/lib/x86_64-linux-gnu/libkmod.so.2 (0x00007f578ccb1000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f578cf08000)
	libcrypto.so.3 => /usr/lib/x86_64-linux-gnu/libcrypto.so.3 (0x00007f578c600000)
	libz.so.1 => /usr/lib/x86_64-linux-gnu/libz.so.1 (0x00007f578cc92000)
	libzstd.so.1 => /usr/lib/x86_64-linux-gnu/libzstd.so.1 (0x00007f578c536000)

The reason is that Dracut is not a "real" autoconf package, and the
hand-written ./configure script does not preserve LDFLAGS for
make. Pass the environment variables directly to fix this.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
[Julien: add comment in dracut.mk]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dracut/dracut.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 1b356a5092..e056495480 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -11,6 +11,9 @@ DRACUT_LICENSE_FILES = COPYING
 DRACUT_CPE_ID_VALID = YES
 
 HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
+# Dracut is not a real autotools package, and the hand-written
+# ./configure script does not preserve LDFLAGS for make.
+HOST_DRACUT_MAKE_ENV = $(HOST_CONFIGURE_OPTS)
 HOST_DRACUT_INSTALL_OPTS = systemdsystemunitdir="" install
 
 ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
