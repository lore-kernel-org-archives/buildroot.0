Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA04CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F85760F58;
	Fri, 12 Jun 2026 11:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8GvVDD-UG9r; Fri, 12 Jun 2026 11:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D5560F4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263356;
	bh=QyHqkzyXUO5pQ4jdCKruv2BEeFoleokZTd4ljoxOmr4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SX30wNp6PACHYzaNHAH/OTGy/f8QF1Xtr88RjfoYAPWR6+/E6qsjyFddr3Dy/Nllv
	 TjtQwqsiW2URqxvtXLM23z4BY4XHQlSWyBtDdZlLjxVU6mwoLEwDoa1vWf2hT2jVzB
	 RG+RB/KOcVU/zoQJd5PjK+cKKwY4bOlC1ZPm/0H/ki8JW3InexAtABxqNxILOplGW3
	 UPCO6ld/cVlDROYsQV6eNwgUxo8VSWZ6iU3TG7JhAbiJroSfWhc4WdjqK/KPOfra3B
	 gWX3kI1Rxls3p1k4W5CF5lCIS6xEy0uQ1waQtgX9Jl54YmyAMQdu8mOk4x+onEQBnV
	 aW3O964K6of3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D5560F4C;
	Fri, 12 Jun 2026 11:22:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E96B1F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99DE240658
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVX6I4siT5w9 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9240040655
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9240040655
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C97D880EA; Fri, 12 Jun 2026 11:22:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:09:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e55f89ffa43329063130498c2af0d1e93f2a03de
X-Git-Newrev: 116effbc600d745ad6bf90e7e6cdf13eb6209d8f
X-Patchwork-Hint: ignore
Message-Id: <20260612112203.5C97D880EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zsh: correct
 download URL after 5.9.1 release
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/116effbc600d745ad6bf90e7e6cdf13eb6209d8f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes:
https://autobuild.buildroot.net/results/9f0f50858b2f41c306f172bf011a34d2c0ad65dc/

>>> zsh 5.9 Downloading
wget -nd -t 3 --no-check-certificate -O '/home/autobuild/autobuild/instance-42/output-1/build/.zsh-5.9.tar.xz.FpXHXy/output' 'http://www.zsh.org/pub/zsh-5.9.tar.xz'
URL transformed to HTTPS due to an HSTS policy
--2026-06-01 01:46:35--  https://www.zsh.org/pub/zsh-5.9.tar.xz
Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
Resolving www.zsh.org (www.zsh.org)... 94.142.241.90
Connecting to www.zsh.org (www.zsh.org)|94.142.241.90|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2026-06-01 01:46:36 ERROR 404: Not Found.

zsh-5.9.1 was released on 2026-05-31 and 5.9.0 release tarball moved under
old/, so update ZSH_SITE to match.

https://zsh.sourceforge.io/News/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 92cdec5a54a009ece181eaaa6446fadef0303a66)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/zsh/zsh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 7e577fa9e1..b18788417c 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZSH_VERSION = 5.9
-ZSH_SITE = http://www.zsh.org/pub
+ZSH_SITE = http://www.zsh.org/pub/old
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
