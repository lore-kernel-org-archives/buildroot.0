Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E413C44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D961460711;
	Fri, 10 Jul 2026 13:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvLGRDdFqJ7Z; Fri, 10 Jul 2026 13:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF91606FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690996;
	bh=6u/N04DTQdFR3iRAgP+Vxk+3GCwE6vVwtybmJyXob1k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KppoW5c+44eY83sPqC7k5e1/hlt6C3C1f5u01xNMI1XqtUOORzmo+QcDFkG7OyfBT
	 uzIl7+njzSQhnLTGHnwhqkwnMIeU0m3p5OrE1qccid0ehJKa9BHqO0ERr24vXeIuMo
	 sQsdbeOZESMHsmmpsbtXplzrBBsmUOqfELTKkH9xbOYbS5NG+svXEUqpXonKcuem4o
	 61SOqabAamSE68PJAjQzsD2lrd9Pnt7CxoNTO3UCXGgmVD3hSZFBCdZlHUHmLZsenZ
	 TwqtiHw8D4wvip5W8Mnoz4E2DwamqtyhEj05rIk3hBktRjyWKAoWzQ+noCs7rxFgdJ
	 eBZTYWIKoGCcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DF91606FA;
	Fri, 10 Jul 2026 13:43:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6A782FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8C0F810B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jf4XXMT2o0ti for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2437810B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2437810B3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2341388675; Fri, 10 Jul 2026 13:42:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 15:01:03 +0200
Subject: [git commit branch/2025.02.x] DEVELOPERS: add Vincent Stehlé for aarch64-efi files
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2b412e077cbe63172d8554f3bfd72c8be89c3171
X-Git-Newrev: e690698e33e1eb0fdd4508bfe6d77433f01539f9
X-Patchwork-Hint: ignore
Message-Id: <20260710134218.2341388675@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============0562539503217617769=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0562539503217617769==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e690698e33e1eb0fdd4508bfe6d77433f01539f9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bff9d7181f53886332df55877eda9507cbda2ec4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0b130cbbd9..110338753e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3243,9 +3243,11 @@ F:	package/nss-myhostname/
 F:	package/utp_com/
 
 N:	Vincent Stehlé <vincent.stehle@arm.com>
+F:	board/aarch64-efi/
 F:	board/arm/fvp-ebbr/
 F:	board/qemu/aarch64-ebbr/
 F:	board/qemu/arm-ebbr/
+F:	configs/aarch64_efi_defconfig
 F:	configs/arm_fvp_ebbr_defconfig
 F:	configs/qemu_aarch64_ebbr_defconfig
 F:	configs/qemu_arm_ebbr_defconfig

--===============0562539503217617769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0562539503217617769==--
