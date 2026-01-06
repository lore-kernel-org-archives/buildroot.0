Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055E1D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE5CF4131C;
	Wed,  7 Jan 2026 18:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNlloG3E-KLa; Wed,  7 Jan 2026 18:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5F93412F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808909;
	bh=UPD9CFdA0+zQe2aJ1LhW1FD4TOYO9gL1SPj4M+NVLgY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z8BKtl9OdDTgduqSDXSdt/bTfH8/x6b55BzxE+dBPVo86hh997OJ/hUXNzDpF0xyw
	 RtOfjdgxy0oAX+wzPDxE5nrc/GlEs4kqVRXUhVLpZ75xlNchCK4jjjsizIKnBnXJi1
	 mREFlfx77e+ozcSabAghwQHiu82jLsUMSSHla+aAbLUWGM/zcqeTI8OB5JdEDzgSJt
	 5XiwJ2F7GEUA62JfVNiqKcJBRuudYWqs1qxw0Tqkh/9JNtnB0PuE4N34zVnPlUpGTK
	 F4uKjhq977flRYhHzAE05L++jbVrwSZG4di+U9x0oDwzeG2uFN3Hxh4k25szTDTjFt
	 etPSJJWOl+BRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5F93412F5;
	Wed,  7 Jan 2026 18:01:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FEED25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7B1D80FB5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvlOqiDupZw8 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0109680EDB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0109680EDB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F332187C86; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:39:34 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 262a051134a5698a0ae7405eacaac4f16a626a07
X-Git-Newrev: d362a9c2f6d0f83ad1dbc89d7470705b1adceac2
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.F332187C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] DEVELOPERS: add Giulio
 Benetti to package util-linux
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

commit: https://git.buildroot.net/buildroot/commit/?id=d362a9c2f6d0f83ad1dbc89d7470705b1adceac2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 85a8faec193fd43bb7956b04ebbc77502cb4fe34)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cb7ab4bc51..3760bb6659 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1331,6 +1331,7 @@ F:	package/swupdate/
 F:	package/tmux/
 F:	package/trace-cmd/
 F:	package/udisks/
+F:	package/util-linux/
 F:	package/wilc-driver/
 F:	toolchain/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
