Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E049C5AC80
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D757B40A11;
	Fri,  7 Aug 2026 09:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOLJcpXVmdzv; Fri,  7 Aug 2026 09:34:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C85240A1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095241;
	bh=ui0s0tME4oPUyjsrdUINxNyCC7buzVGU2Fx9n+SmWrA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FsssP34tMk8jINTmXTGw3nooT4TgA785jiYE2Kcags/wwatJjETfXlYfGZMn7r9lk
	 a8+6A+lJrXNmitffNpHwGgkyjnlQXLe4Uj9p7gtOm/ek/ajDfybePlVjA35jEYPjF7
	 ddyAXHpKq8mX3DSzGuMgQr106s5L5bCh/xE1GaKR6rvZy36jVfJlummno0C/VUFDZ1
	 wzvfBiY5rOEMQVfkiqlJ1r/qgqUhDnyueTutXUJju/srE3lK9I3Ui4pDk7ZRHCZGKd
	 hnvLR0WIA9w2OiUHHbkp4GMIVQ2jTMDMv091GEyB6dJkZacJHhP609Lu+qOXLAkBfd
	 ETmujg42w26nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C85240A1C;
	Fri,  7 Aug 2026 09:34:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF671397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD7DA811FD
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQFVgPe4_XzT for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2485C81205
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2485C81205
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE90D8CA3F; Fri,  7 Aug 2026 09:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:08:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e6e34723304093d51817defd78635408707e802d
X-Git-Newrev: ac53be9a4d67e84c7fbcf4c2ed867a8129fafa6c
X-Patchwork-Hint: ignore
Message-Id: <20260807093259.AE90D8CA3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pydal:
 needs python xml module at runtime
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac53be9a4d67e84c7fbcf4c2ed867a8129fafa6c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

pyDAL is using xmlrpc at runtime. See:
https://github.com/web2py/pydal/blob/v20260313.1/pydal/_compat.py#L114

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dc6ff71ee369ecadd768bf4605c175398a8e6e49)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-pydal/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pydal/Config.in b/package/python-pydal/Config.in
index 204b47a09a..4ed2b934ac 100644
--- a/package/python-pydal/Config.in
+++ b/package/python-pydal/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYDAL
 	bool "python-pydal"
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  pyDAL is a pure Python Database Abstraction Layer.  It
 	  dynamically generates the SQL in real time using the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
