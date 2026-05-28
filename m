Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA9ECD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91AC061445;
	Fri, 29 May 2026 08:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id El76Rv57mjeE; Fri, 29 May 2026 08:26:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B16D26143F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043183;
	bh=kbaWPk/1wGaQUDfkdSPXqYokk4bqNXOnyHcvNj4qX/Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BwvWGUEc3Z/NfrUpvsylrafUv5szUxJzJhjIMCkdfVng0apVXegky+tbLHjgqy76q
	 qlLkFXMYCo82pouX4QDg+CCQu8TVQNMTxEhsR8NH5PJ+MSI0f2d/WrC8snXy64bYnh
	 qgnJ8gSHry60h9YB4BUCz/JsVOl5SwmAvK68JyHeawG6CFDE4JZ+lISC1XWmvpj970
	 iDUz+IuhRrHlptkZnBi3QqpMFEgRjXnNu9WyVhWQF8wxqJPfHuhHeQqMj3slTEhlf7
	 vCO77po+fQR9t/hSbBAa2/1zLytq9ub5qRpNHIGppZ4v5SvGg8Rd1xjXVT3wjse/20
	 3/KbHs3vSRODQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B16D26143F;
	Fri, 29 May 2026 08:26:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15314288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 990EC41FA1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGfIgrCTW_aD for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7AE841F5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7AE841F5A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6766C87334; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:50:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 51f3392f54adb0bc13dd0f9a2d8f285ec69a0cfe
X-Git-Newrev: f9aa372a76abda2055f4c8de2231a67969f10b62
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.6766C87334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: update entry
 for Viacheslav Bocharov
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9aa372a76abda2055f4c8de2231a67969f10b62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- Update email address to v@baodeep.com.
- Take over maintainership of package/amlogic-boot-fip.

Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9d4d79f9aebd7974ecab60c9c335190ef974aece)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4a22d2f305..28cfea7dd8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3246,7 +3246,8 @@ F:	package/llvm-project/llvm/
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
 
-N:	Viacheslav Bocharov <adeep@lexina.in>
+N:	Viacheslav Bocharov <v@baodeep.com>
+F:	package/amlogic-boot-fip/
 F:	package/rtl8822cs/
 
 N:	Victor Huesca <victor.huesca@bootlin.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
