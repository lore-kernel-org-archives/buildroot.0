Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E51CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A6818404A;
	Wed,  1 Oct 2025 20:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FsAKS5g--f1; Wed,  1 Oct 2025 20:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195A48404F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 195A48404F;
	Wed,  1 Oct 2025 20:01:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5856CED
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A6F284051
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOghYWceY3XS for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 727B084049
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 727B084049
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 706F2866FC; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 10:21:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6b5555333770f67061130a7ebd76717396af247b
X-Git-Newrev: 26fd8eb217052c92c035cb8197d5757a00c5da38
X-Patchwork-Hint: ignore
Message-Id: <20251001200129.706F2866FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sysprof: disable
 debuginfod support
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=26fd8eb217052c92c035cb8197d5757a00c5da38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fixes building sysprof when elfutils is also selected (which is
a common setup). The debuginfod client support relies in elfutils
being built with the libdebuginfod option enabled; but Buildroot
unconditionally disables it in the elfutils package. See commit [1].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/52c5c6050c5359288ca48c85024aebd169fab258

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Julien: add link to commit disabling debuginfod]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8d01dfebd39e9e768503c8910f5933abc614be81)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/sysprof/sysprof.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 13b3de175e..ab38f52c75 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -12,6 +12,7 @@ SYSPROF_LICENSE = GPL-3.0+
 SYSPROF_LICENSE_FILES = COPYING
 SYSPROF_DEPENDENCIES = libglib2 libdex libunwind json-glib polkit
 SYSPROF_CONF_OPTS = \
+	-Ddebuginfod=disabled \
 	-Ddevelopment=false \
 	-Dexamples=false \
 	-Dgtk=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
