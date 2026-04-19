Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1B6EA71AA
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 20:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3A1341039;
	Sun, 19 Apr 2026 20:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pW7FW9kQgsIN; Sun, 19 Apr 2026 20:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAB9741036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776631487;
	bh=5E1axv/x0VweznT3ScvZnkmLe0vOLq9bFFSFYGQ8vLY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U1DLwU7ltcpO7oNcQr0Fpb9XfEFjp2H9yF3uslctTp9VcOX569pfb1iV6DglTwm1K
	 JtvSRbjWR2pA76i1/cxJWdD0tagtsovAjMtUwJacow/99gqEpxJVYFsLMZFRDperx6
	 jnrgS7InHj9ICO6vkC26ExEWhyPkcc5X4wqMmuqdoLL31DfY4KrI9oqqldDP+u+/4O
	 5aEbu+rrS5FU3eXReCjY94vZZiNS1BpHMRPlBHhKyf7xPg62Z+ZkWg5egnMag7GZRN
	 5g9bTnOdpaRNpkKgonRJ+xEX/MXR6RbdEvxRDOGJp8CWqPdCp0LIwpwo82aA03RN0H
	 eJVP8MBNaMG5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAB9741036;
	Sun, 19 Apr 2026 20:44:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A54062B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 968268238C
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkW6CpPAfP5n for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 20:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 864FD82389
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 864FD82389
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17EA381F81; Sun, 19 Apr 2026 20:44:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 22:44:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c14e3a247d2526a1cfba8fd4f6ce354b50bb3b6d
X-Git-Newrev: cf26c772804cbce53bca73be28a64279cc7a8017
X-Patchwork-Hint: ignore
Message-Id: <20260419204445.17EA381F81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mkpasswd: add dependency to
 host-libxcrypt
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf26c772804cbce53bca73be28a64279cc7a8017
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
