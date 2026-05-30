Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D14CD6E54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2558042EC9;
	Sat, 30 May 2026 13:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zj0eac0FNqEV; Sat, 30 May 2026 13:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5642B42EF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149171;
	bh=dCddfuaJwaAWFJPXvfonavK5Xwnuzzf3suhAP+WFrZ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W4GogI40XYV8uYBz1VHP18MuYS5SHQztBe8ujm+AAiAL76PXNe0/3S2IzdlrS8Khc
	 AO+pIsvq9BbmT7xLkunj1P4flFRs2pB39dFodkV63nzmCz6Zjx2q9gJZWmveIJ08c/
	 y1FnU2KZhIja9W40RWiUbnM2qVhpeUVZmWbqX/tLPDpYn8UE0DlPFn3NgRK39esMPe
	 9VCc5Nx4HCy8DhoYk14vWk6zNSSRa6JudZzE2ZTybqM/FG2clM6AFWo9iiqh/hhQdJ
	 r+5ZIa/5zFfkEvee88I2jKa8e1/foRMJ2gl8hyD3im5YbwBPJBJbxN9Y0j91eJoaE/
	 A6w6FaR7NyL2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5642B42EF5;
	Sat, 30 May 2026 13:52:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5439F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0C1742671
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NflrhIjAh-Yo for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4F6D42677
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4F6D42677
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A82FB8750D; Sat, 30 May 2026 13:52:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b3329ed3e027f7a57f5b96a2a842643bebbee693
X-Git-Newrev: 504840bcc24e7f01e21e38512b67d6747603b129
X-Patchwork-Hint: ignore
Message-Id: <20260530135221.A82FB8750D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_17
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/504840bcc24e7f01e21e38512b67d6747603b129
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 624b5e9d21..863a1eed34 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -344,6 +344,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
