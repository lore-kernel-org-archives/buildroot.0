Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD53EFED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 846AE42959;
	Fri, 24 Apr 2026 16:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuN5XakM6dN4; Fri, 24 Apr 2026 16:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A085B42985
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047965;
	bh=fjmub3Acd0Nj92poeKAdBBZKR6VT99dP9mpvOCL8vBE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sAD8wnyIbkHDNHDpU/GKOs9SLPvn8h9+FN534D3BzOfwHEkH5h0NUljEL7qlhXpX0
	 J5jQbwps5luhsUopezQLUKfyN+7mGxghgXfAT1cdEWMEfFmCO+aOE3uVCzBIfrICpE
	 IJxJXxpu61j9wWTxZWRDz7Pu9GDysL+Pl24QHd9uZ7xYTNGc9KoBSS2g85Z4KoHd4T
	 K/5xtMiqh8osKjj5VtZ3ykQnDY+i4RIf3Mu6FMIATYkAhPROebDJNHKaYkIjxTucjx
	 LhiPApZ7DMIBBc4ZZ7mOGXh55PiLPTYIzylZESGz6N8yOpHbSA9bZP2iyCnUO1wZUX
	 7tRn2v/8LqIlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A085B42985;
	Fri, 24 Apr 2026 16:26:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 026E8206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E776942961
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpZJpxDjh-83 for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0115F4295E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0115F4295E
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD41182AFA; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:21:12 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bc9f770473a3495864135e0ef343d6f9176b4bc8
X-Git-Newrev: 1db8c8ca8329e8d50a87caa1cba4dda4e0343760
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.AD41182AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mkpasswd: add
 dependency to host-libxcrypt
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1db8c8ca8329e8d50a87caa1cba4dda4e0343760
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The host-mkpasswd package needs the <crypt.h> header file installed
on the host. This file was initially provided by the libc headers,
as part of its libcrypt implementation. libcrypt was removed in
glibc 2.39. Most Linux distributions continued to ship a libcrypt
replacement such as libxcrypt in their default installation.

Some mainstream Linux distribution (such as Debian testing) are
now starting to remove this libcrypt and <crypt.h> header from their
default image (of development files).

In that case, host-mkpasswd is failing to build with the error:

    /buildroot/output/build/host-mkpasswd/mkpasswd.c:54:10: fatal error: crypt.h: No such file or directory

The issue can be reproduced by adapting the Buildroot Docker file,
by setting "FROM debian:testing-20260316" in [1] and removing
the build of tar.

Note: debian 13 (for example Docker tag trixie-20260316) still
includes the libcrypt-dev package by default, which provides crypt.h.

In Buildroot, there is already the host-heimdal and host-systemd
packages requiring host-libxcrypt. Also, the host-libxcrypt is a
small standalone package. For those reasons, instead of adding
the Buildroot prerequisite on the user host to provide a libcrypt
implementation, this commit simply add the package dependency to
host-libxcrypt, to make sure it will work in all situations.

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/support/docker/Dockerfile#L11

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit cf26c772804cbce53bca73be28a64279cc7a8017)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mkpasswd/mkpasswd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mkpasswd/mkpasswd.mk b/package/mkpasswd/mkpasswd.mk
index c1117ef65c..6ab6419824 100644
--- a/package/mkpasswd/mkpasswd.mk
+++ b/package/mkpasswd/mkpasswd.mk
@@ -9,6 +9,8 @@
 # at revision 5a0f08500fa51608b6d3b73ee338be38c692eadb
 HOST_MKPASSWD_LICENSE = GPL-2.0+
 
+HOST_MKPASSWD_DEPENDENCIES = host-libxcrypt
+
 define HOST_MKPASSWD_EXTRACT_CMDS
 	cp $(HOST_MKPASSWD_PKGDIR)/*.c $(HOST_MKPASSWD_PKGDIR)/*.h $(@D)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
