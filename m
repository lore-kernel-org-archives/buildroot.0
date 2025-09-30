Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1E1CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1F16414B7;
	Wed,  1 Oct 2025 21:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_-bFT1qwJwl; Wed,  1 Oct 2025 21:00:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDF49414B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF49414B5;
	Wed,  1 Oct 2025 21:00:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04D5472
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B25CD4124D
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTrjQZUQiKD4 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E575641246
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E575641246
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E37DD817A9; Wed,  1 Oct 2025 21:00:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:29:25 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 81431493764b414cc01001b76d28a29d6cc732cd
X-Git-Newrev: 13cafab9d1676d11270ea351d94b393f986a79ed
X-Patchwork-Hint: ignore
Message-Id: <20251001210010.E37DD817A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/sysprof: disable
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

commit: https://git.buildroot.net/buildroot/commit/?id=13cafab9d1676d11270ea351d94b393f986a79ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
 package/sysprof/sysprof.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index abbddfb6e1..2670588ebb 100644
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
@@ -22,13 +23,6 @@ SYSPROF_CONF_OPTS = \
 	-Dtools=true \
 	-Dsystemdunitdir=/usr/lib/systemd/system
 
-ifeq ($(BR2_PACKAGE_ELFUTILS),y)
-SYSPROF_DEPENDENCIES += elfutils
-SYSPROF_CONF_OPTS += -Ddebuginfod=enabled
-else
-SYSPROF_CONF_OPTS += -Ddebuginfod=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SYSPROF_DEPENDENCIES += systemd
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
