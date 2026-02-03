Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB0AE6E7F7
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB67F80BCE;
	Tue,  3 Feb 2026 10:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYP90DfVmh2a; Tue,  3 Feb 2026 10:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70C1E80890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770115468;
	bh=uV46QxLMCNLgdSwGo/p7uDtdCAKiojI9ha+ngTKFg0A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WZbWrnU2Ma+RHsmdPEDOudkIfCYmflXjoHByfZtpfUI9bdUFz4dl1b2JbDietMBah
	 5xsRp1R6M9r550SeP+bNRI+dv/Ga8YWUnVoDVbqO2D7m5h2oP6rBXkJ+jW38ypvbdu
	 uGCtutyCoawtLuJ9qoXsN1p5vR3WecGm4G/l4LeWIHcJy/ENAwcAQ6D9o8U574rUOp
	 j1YGgJa5qzDLFroAVxqhLdlBhC6z6k/r+HbzeaBHyJKLYwoRvSuaor2uBCLi2CuMCv
	 urdZKx55Onb81zwZzXxs9oMwXcTM5MCCgRwNGTwJVXDZTOvIBnp3BNk2ZUFuFL4T2x
	 ByzzSmWMvglPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C1E80890;
	Tue,  3 Feb 2026 10:44:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF2BC34C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4D1441138
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZMzYVq-qYUG for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3EE41137
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D3EE41137
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA1FE865D8; Tue,  3 Feb 2026 10:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 11:41:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53c2c0903dcddc364cd231648af36122c09c0b3f
X-Git-Newrev: 2f218b1c291e07e30f9a43991cc57c4137606660
X-Patchwork-Hint: ignore
Message-Id: <20260203104423.EA1FE865D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to package
 bind
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f218b1c291e07e30f9a43991cc57c4137606660
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9fedc81332..280d00d13e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1289,6 +1289,7 @@ F:	configs/mangopi_mq1rdw2_defconfig
 F:	configs/olimex_a*
 F:	configs/rockpro64_defconfig
 F:	package/at/
+F:	package/bind/
 F:	package/binutils/
 F:	package/cryptsetup/
 F:	package/dash/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
