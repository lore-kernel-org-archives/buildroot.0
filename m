Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3367C44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E5F140C39;
	Fri, 10 Jul 2026 13:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbSAxUR5IbkR; Fri, 10 Jul 2026 13:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8E5240C35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691134;
	bh=xIXNjcQoA7axqWJp7IdpKNCtN4xaYi2g5zCR5XKytoA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KqWL6/8BHbWBWmtiCGPhRQRDYtBq+H5aDtUCuUGYUy1xPmux2chZxrUGK99KWLPmw
	 KBifUQfXd++ZdaxGx6MqcYMU/+MBAVPMiThXOSWaBY6N1SNJcTo+jFhS/BMTDEJ4qE
	 RfCw/f3LmppLTd4v/+3s4/tpRaIIuPEJ2udBu24OW4eccgXmaufqW8TA7QlenrVbaW
	 p0Tp20e8h3ejhLdXFR/W2j7qTPSstDJPOurfeQLFOKn1/Z+6mbHGSYO0D0pbGH9fSY
	 do+TCWR+MjYzguLnhvmWRER58A/CPtWUlGTiJ7GljIttPGbBbv/TuCATWUDujRLn3f
	 LgZss5RiZ5sMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8E5240C35;
	Fri, 10 Jul 2026 13:45:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB792FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0101940B7D
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtMHTVFOvRjh for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C21C940AB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C21C940AB6
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:45:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E173C8868F; Fri, 10 Jul 2026 13:44:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 15:01:05 +0200
Subject: [git commit branch/2026.05.x] DEVELOPERS: add Vincent Stehlé for aarch64-efi files
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 28ae0cac6ffb3aae435a1f728c24fd94864f52bc
X-Git-Newrev: ae90e070025236c7331c6675deedc4cb6372b2bc
X-Patchwork-Hint: ignore
Message-Id: <20260710134427.E173C8868F@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============6814433350731452682=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6814433350731452682==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ae90e070025236c7331c6675deedc4cb6372b2bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bff9d7181f53886332df55877eda9507cbda2ec4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9aaffa29a9..3530d515a2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3343,11 +3343,13 @@ F:	package/nss-myhostname/
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

--===============6814433350731452682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6814433350731452682==--
