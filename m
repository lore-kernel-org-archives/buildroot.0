Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D0BFED3EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 815CD84C78;
	Fri, 24 Apr 2026 16:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03nNJubhZvBW; Fri, 24 Apr 2026 16:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6011B84DC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048717;
	bh=QGIeFaZGQHNrUFx6ZHtseP2LCqOj0qapDeh/w+PpyiU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c1mrxWA1dkodk6s3BRmWi5MdxprqeZRWJFU8KgftIfouo/KdkmlCmivFKJ4D+m/g8
	 IfkHYDGtaY/fkuLl2FQHA6YYTBBJyrGs5SaYLK62nxyDTd5nZfJcLnu6GQiD4lkUKu
	 uKTMsijV3y9KdaQzO2S6I5t0xYvL+nSHMg4bKh8k1B1ilbqYW+E7E/GHMrzP6I6lYw
	 mq3hqgtOjz9Ok3OGZPknobFvVbFvXoQwqOLk9ly038oMvonrFjqOZJiwgcHvt9HG1A
	 7v8Ok2PqUpUUrOWeJF4x2RU1Mh0BDuRKkORrs2+81khuixSEaFXXcCZhRFhNZD3nJU
	 g64x7nRrzbCFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6011B84DC2;
	Fri, 24 Apr 2026 16:38:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05734231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AF9061C37
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dp9LSY08rjfC for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 060D461C3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 060D461C3A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2EF882B2F; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 14:31:48 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: cc627f2c6725d76c6a811cda2661dc937ca61de0
X-Git-Newrev: 2b6eab392ddb685ff2869d9dfb2103e0fa5863e0
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.B2EF882B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/mkpasswd: add
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b6eab392ddb685ff2869d9dfb2103e0fa5863e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
