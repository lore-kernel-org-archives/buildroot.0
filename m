Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0132AC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 12:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7EAC60617;
	Sun,  5 Jul 2026 12:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqJTMwPNlf_I; Sun,  5 Jul 2026 12:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB6C8606E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783255614;
	bh=7kJ8lFfGzp8JZbbI4RDFAeQQQiV05yq56M4B64Ofz6w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EJJbDhkMJPG1z3trvkr+kv6kW+A44RnrIK1yS9fIf5qn4aigw7fk95Aj+ySndzto0
	 d3lJ2K6mXIBxdBW1GGCYVA87lnHwjZhEJ4yVKENe+SUR1+/jC6F0IfNfUUs460GHLa
	 pzfr0GdQaxNpbME2DPMXFSjPPGsVna9PMZcL4cmNdtWDYKjnbFqhCgxUQsj+J2+B69
	 p5TMb6zNOD6Uc5HDYJCHVYWLEDb5ioKwYONDjHjZIDo22hFfYCwvAh5CUE/jmtYHLU
	 vRboUNr7WnqtodWg29Lqet1MSAItGwynROqt1BGZGBMMmdFEOZq1rhJAukbjRFOLmS
	 9J3fToUFM/dnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB6C8606E3;
	Sun,  5 Jul 2026 12:46:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E56DB2A8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2E2D407E6
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08DPUR4aT12u for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 12:46:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F4150407E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F4150407E7
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:46:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 927E588478; Sun,  5 Jul 2026 12:46:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jul 2026 14:46:35 +0200
Subject: [git commit] DEVELOPERS: add Vincent Stehlé for aarch64-efi files
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b88b96246d100843004cd7cbb7f642ad982bfb88
X-Git-Newrev: bff9d7181f53886332df55877eda9507cbda2ec4
X-Patchwork-Hint: ignore
Message-Id: <20260705124622.927E588478@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============1483305704581170169=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1483305704581170169==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bff9d7181f53886332df55877eda9507cbda2ec4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1770eeeb43..fdfab8b489 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3359,11 +3359,13 @@ F:	package/nss-myhostname/
 F:	package/utp_com/
 
 N:	Vincent Stehlé <vincent.stehle@arm.com>
+F:	board/aarch64-efi/
 F:	board/arm/fvp-ebbr/
 F:	board/compulab/iot-gate-imx8-ebbr/
 F:	board/pine64/rockpro64-ebbr/
 F:	board/qemu/aarch64-ebbr/
 F:	board/qemu/arm-ebbr/
+F:	configs/aarch64_efi_defconfig
 F:	configs/arm_fvp_ebbr_defconfig
 F:	configs/iot-gate-imx8_ebbr_defconfig
 F:	configs/qemu_aarch64_ebbr_defconfig

--===============1483305704581170169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1483305704581170169==--
