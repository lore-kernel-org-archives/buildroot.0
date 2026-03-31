Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B34E1061B2B
	for <buildroot@archiver.kernel.org>; Tue, 31 Mar 2026 11:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E742060F86;
	Tue, 31 Mar 2026 11:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8f9pWdI6O4zt; Tue, 31 Mar 2026 11:06:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90F06607D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774955166;
	bh=naYkLaknjlUwm+SdfRsYXdRtpvuhYmJ+AYLJMCqCMXY=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=SSbN94SNvRhfd/jJ2FyI8xfHYaH+mNRRvtxq5jjTzmD3iOJEeHN1rKv3NDbkRhvT2
	 XZncdba4EA0pi/23S+TK9/2mo/951Y3JRZPUos6EarPgt4+usySl/rLDsXbXlTS+B4
	 oLxJneUTpKr1G8kjdFKTiDStiENewPKPlIrclntyrtY5mU9aGTSlD7a8pmSOvFoe7n
	 yb8KJNJKt5E0DsKcPZVNBEa/vlGwamvCIPRts+HVdONTzSdt6f2M2G4rVaU3vnRLE3
	 9ebJwnQzynfFl4oaPpkFnz2Fl1rs3iQ83HTeKSGNYoRoGYdWNKwjQV+edAFXf2Bp9q
	 OvCPFiZ6rsyxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90F06607D1;
	Tue, 31 Mar 2026 11:06:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49212E4
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 11:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AC2040684
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 11:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrW3OpQiwC-2 for <buildroot@buildroot.org>;
 Tue, 31 Mar 2026 11:06:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 438CB40593
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 438CB40593
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 438CB40593
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 11:06:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D6DC94E42885
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 11:05:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 984816029D
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 11:05:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 543F0104505CA; 
 Tue, 31 Mar 2026 13:05:57 +0200 (CEST)
Date: Tue, 31 Mar 2026 13:05:41 +0200
MIME-Version: 1.0
Message-Id: <20260331-fix-tartget-typo-v1-1-4f5ff0ea325a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIWqy2kC/yXMyw5AMBCF4VeRWZvEpSnxKmJBOxgLpB1CxLsrl
 l9yzn+BJ8fkoYoucLSz52UOSOMIzNjOAyHbYMiSTCd5nmLPB0rrZCBBOdcFS2NKpanQqrAQbqu
 jsPmSdfPbb91ERt4O3PcD3Jlnl3QAAAA=
X-Change-ID: 20260331-fix-tartget-typo-8cc846e7647d
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1774955158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=4e4JtSgp48nFY/B9d6wKf6tfguT6G7LvEDpF1+W5M1U=;
 b=K63f2E1ptP0wTO9YfJgnCRdTaGxY0eifXe6iB8lpkg/xyamkJr5/MaNes10rL709z09tQG
 vqPCOEwEI2Lrww3mWZaP9l3Dn9AnIl+JoM5qHGrgPbxa3ynVG964+kOko47xnjJZPZT7yy
 Foa3G2bE74iBIl5KSxag2NPFiOg95d7mpFGTHihLr6lgzRaSZoYZ0Q1E9tgykmz0//Vms3
 89miDIvdkA+QgEWV4WC5fkC0+LXAb7FrLSAi9D5/Xn0050lazGcZg4P7+4aNTuNUF9nZW8
 rxT1T+M5kfV4jUaZwVltF3sfwoG2Vsoaw5k35SLKMIjUe9r5OVH6OXukxqSJ1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=K63f2E1p
Subject: [Buildroot] [PATCH] system: fix typo in comment
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix "TARTGET_DIR" -> "TARGET_DIR" typo.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 system/system.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/system.mk b/system/system.mk
index 52e810868a82..3da9d3b2ddd1 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -60,7 +60,7 @@ endef
 endif
 
 # This function rsyncs the skeleton directory in $(1) to the destination
-# in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
+# in $(2), which should be either $(TARGET_DIR) or $(STAGING_DIR)
 define SYSTEM_RSYNC
 	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \

---
base-commit: 9018402c2c0bd92be0664df82d943e11fe782a6b
change-id: 20260331-fix-tartget-typo-8cc846e7647d

Best regards,
--  
Luca Ceresoli <luca.ceresoli@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
