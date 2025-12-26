Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A5EE8FDA6
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 10:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0D64092F;
	Fri, 26 Dec 2025 10:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXQtq0d_aNiY; Fri, 26 Dec 2025 10:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8822A4091C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766745459;
	bh=K7vuPyQCoVTh2y2FpScm1Hx4Ser4lIltRjkOKRr6wFI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GGcAmy3NhCPpb78DYd+1R48aaaknt97QnZhKA4dujct6Ww01ytTlcwH5JSy/UzwAn
	 p9VSLZ7QhInNVUFx/TdCe03Vy3cBuDLyiUO/w2cZG7qoYyl94q3dBIvZNyZxJSRYLP
	 AWWrZDFJXBhAUZU9Yb8GjAKYiW2awb89hIvGnbmTHErIcfhV7zqORLzyJxlCZaIC7e
	 HTnJTL2oBLa38VT5zdWoxzrerEbrJRu1nj3SJVkEsJVPaMrcJ5z0DprL7SnXTtugGu
	 T2U9fxSMm6GK2TIwywY1HeUoMICzpghxeAcYjdVmj+uuJ/WAzSKfOT9PBEU2hj7hMD
	 yWEQjzxr+T6fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8822A4091C;
	Fri, 26 Dec 2025 10:37:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B99DFEC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 980BA4091D
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Spr3l3SxPqNh for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 10:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3ECB4091C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3ECB4091C
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:37:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C23C18764A; Fri, 26 Dec 2025 10:37:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 11:30:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ebd5a4b1068798ca5f0ca1ea9411f6702a8fe31
X-Git-Newrev: dca8423fbcc8389021ddb710cf7f9eec8aa047f3
X-Patchwork-Hint: ignore
Message-Id: <20251226103736.C23C18764A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to tmux
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

commit: https://git.buildroot.net/buildroot/commit/?id=dca8423fbcc8389021ddb710cf7f9eec8aa047f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32f11d1e66..f16a724b15 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1329,6 +1329,7 @@ F:	package/sunxi-mali-utgard-driver/
 F:	package/sunxi-tools/
 F:	package/swugenerator/
 F:	package/swupdate/
+F:	package/tmux/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	package/wilc-driver/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
