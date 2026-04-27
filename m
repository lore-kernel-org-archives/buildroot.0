Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F99DFF885E
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 09:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66D1E85529;
	Mon, 27 Apr 2026 09:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHYzkSh_1l7G; Mon, 27 Apr 2026 09:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 626B085503
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777282710;
	bh=VmK4G0DcctM/RIEjSrc54SANwWJtdgS3shVScHms8yk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lkQVg2x7n3Nfcp6fqyaX/olszysUJdSvYRW93dL5vQwEf6Df+kw+rlQOJKDF/lWia
	 XMWAjFUYzNbu59eD8ASt5wtKqD2zefIL3nfRXjYyq6/cx4kME8WjLq1FJT5oJCukAx
	 bxpyj1JLBy1w6WNct5LnyFO2fRmUCZiO9Hp7BACdwHr7Oc/G9KtN/XQO4bl8gzNVba
	 K65usjU1vObkO2l1mxhy1v+gvE2x1wWanpOCiLI3gQWswo6fk1kmRFnZRjk8Rfof88
	 6eBDOfFKbSFC565NPlWpgy9hhjTTRFA9f3uZpEktz+cq8i3ZhlHpWz6fW4bbf8Ayik
	 QLUoGuMKWZ6BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 626B085503;
	Mon, 27 Apr 2026 09:38:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95E1F2DF
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 09:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81ED16171C
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 09:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yPc94RkzlS7 for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 09:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F137612F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F137612F4
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 09:38:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F7E283458; Mon, 27 Apr 2026 09:38:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 11:37:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ae431d3911f5d5cf7a0f0f5d4c5d2ee1cf484f1
X-Git-Newrev: 201d6f4937d3b428a7ec858d0cb1cdb7483469f0
X-Patchwork-Hint: ignore
Message-Id: <20260427093827.4F7E283458@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3/Config.in.host: remove
 select on BR2_PACKAGE_HOST_OPENSSL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/201d6f4937d3b428a7ec858d0cb1cdb7483469f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

There is no such option, and according to the commit history never
was. If BR2_PACKAGE_HOST_PYTHON3_SSL=y the build adds host-openssl to
HOST_PYTHON3_DEPENDENCIES directly.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python3/Config.in.host | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index f3fcd63567..28fc0dbaf8 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -24,7 +24,6 @@ config BR2_PACKAGE_HOST_PYTHON3_CURSES
 
 config BR2_PACKAGE_HOST_PYTHON3_SSL
 	bool "ssl"
-	select BR2_PACKAGE_HOST_OPENSSL
 	help
 	  _ssl module for host Python3.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
