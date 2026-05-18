Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F024ACD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC409607AD;
	Mon, 18 May 2026 20:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWIi-I6BHEMc; Mon, 18 May 2026 20:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0C15607AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779135798;
	bh=0PzBW7hwPkjseYdNhKua5XC5+T+Ytv19Tqt3Y6H0Stc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aIMzdTbuXeeET/lLImTIm65v4uYOwmBCNwroOqE1KFPCPK5zlCvB8/N7nwpPAA2pJ
	 jRcH0uksbVUfyQow3DGNVPy6h/325rsk4XOASqQ5qqs1wku9cPHHSg+CYOIqLG6um0
	 bG46BL9Izl40xA/TCNUS8p0+7+CIqbbUTk1Lzf8HWgyDEuL1ajIjlyHEFN437gvIC2
	 l9R2+lLyQ5Wrm8nIDklKR+nb9hl1/diTo8c26YUT4s8T87xk9TW3zoB5Li8R9/OJP7
	 X3W4sh1jm37eFd9ZKLCjOZpMOYIr1fSpZBberj2pnN5yKNvtJ5lY2/dGZHo/PmMJbe
	 Eh4VbGBIh7FmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C15607AE;
	Mon, 18 May 2026 20:23:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63C41265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A533409B0
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77EdNoWdw6AN for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:23:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A37AC409AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A37AC409AF
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:23:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 552F686595; Mon, 18 May 2026 20:23:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 22:21:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 009b044a449d8905ab8a0a3f8063aead5286c016
X-Git-Newrev: c17d110b10d4462822d712e327ee0579cf45af10
X-Patchwork-Hint: ignore
Message-Id: <20260518202308.552F686595@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: added Shubham Chakraborty for
 htop
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c17d110b10d4462822d712e327ee0579cf45af10
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f2060c7101..125e7f8248 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3051,6 +3051,7 @@ F:	package/wolfssl/
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/dos2unix/
+F:	package/htop/
 F:	package/hyperfine/
 F:	package/pv/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
