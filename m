Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C82C107BCEA
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 22:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64D0640F21;
	Fri, 13 Mar 2026 22:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qa0Zd5q2VUQ4; Fri, 13 Mar 2026 22:50:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 944AD40F22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773442249;
	bh=TkmtIJAze8UJmZIudXPimiVbMqynCWmz/HWOk9Fs5fo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YvpIcHoxl/vpPcH3vwBvRy5UlNVOrR7GRiSratpVivwAhDQ4VVeLa8+f/G63c97ar
	 9+sUqpndGOVwbW4NSmmiBY1+0VNlzfWWC98zYnL7ZAsqBD97XEYN3eKO6W8a49bChW
	 jr4RxKI0k786uswWvAX72KfIzbXhO6yci9hlETLW2odbplmwG5PkxB4cQc6gi/H/yy
	 arKdA6mjDUCj03SYIghbU7v9yyoKpa/+x9AzA6wVtAdbcbnVynz9N55VsK/cYOyOBI
	 L8jf86x4qUtnkoXjD/yQFg5ZMKAie70LkYhLuLISqcCsQiOs4Of3PQvwNa3PCyIIHG
	 Ofeq6/t2gK7+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 944AD40F22;
	Fri, 13 Mar 2026 22:50:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 579D91B4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BE7940658
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jqd-zMyqhM2W for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 829ED4005A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 829ED4005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B59BA8739A; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 23:29:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e0ab7e9eb4409e32a09c7fd258d9fe48477d283
X-Git-Newrev: 9af1a2bd07d739ecdca5e6d3c0632cb773f46ea9
X-Patchwork-Hint: ignore
Message-Id: <20260313225044.B59BA8739A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburcu: enable host package
 variant
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9af1a2bd07d739ecdca5e6d3c0632cb773f46ea9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

host-liburcu is needed for host-xfsprogs.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/liburcu/liburcu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 656dfb2408..cf1b08e469 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -21,3 +21,4 @@ LIBURCU_INSTALL_STAGING = YES
 LIBURCU_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
