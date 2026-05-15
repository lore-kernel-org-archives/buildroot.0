Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA04CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF66041D57;
	Fri, 15 May 2026 17:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bv9o-ULaGWos; Fri, 15 May 2026 17:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6129F41DFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867242;
	bh=6dUzuvLSHeL10filFKrEmxnilgGfnx7g4H/B0X74pOo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XhBL6fteiV1tBiERpSoKCiDaX7NuDkXWNUNbzYnIuCMobyQg3aR6djcPwpjtMEmQz
	 hemQatS/2nkF4RhJFxbyQBJM0CmzqVsE+mO0DnVKFUw9xbEuI2milypck8jttzE86O
	 bxolLULt5+FqXr6gbwKAQNWczeknksHDr1ygsz+bYdatlI+NxhnjGVMSJiyoffiQRf
	 fLhkSbHfUAfZuhdh47yeA/Ycaimg/7hajztEvhEPV84E9Bh3S5MqcrOVSHvobuvqHL
	 wVSEBl7zt1vyQ3R09C4j72mTIlFhiDuILgOtb6Fvhqt8phm5Ndho8DhWwzuI9cCduy
	 FZcGv+2cOkQSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6129F41DFB;
	Fri, 15 May 2026 17:47:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B253B45B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D215840FB0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0FFrmU2j1TN for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 312EC4027F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 312EC4027F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F582863D7; Fri, 15 May 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:25:56 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6e4668c060e55cd2786fac196621f3054e514293
X-Git-Newrev: 440738e2910d462b61594bbe7869482eb3613386
X-Patchwork-Hint: ignore
Message-Id: <20260515174640.6F582863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/frr: install
 systemd service files
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
Content-Type: multipart/mixed; boundary="===============7345766060060052926=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7345766060060052926==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/440738e2910d462b61594bbe7869482eb3613386
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The FRR package currently only installs systemv services files. The
upstream package also provides a systemd service file and a service
template file. Install those when systemd is selected as an init
manager.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 5af981a6727bb4a5e984c86556ec674e525db218)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/frr/frr.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 04282442fb..a9e1810854 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -131,5 +131,12 @@ define FRR_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50frr
 endef
 
+define FRR_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/tools/frr.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/frr.service
+	$(INSTALL) -D -m 644 $(@D)/tools/frr@.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/frr@.service
+endef
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))

--===============7345766060060052926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7345766060060052926==--
