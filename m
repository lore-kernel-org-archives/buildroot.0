Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772D9C3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 19:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28F9E606AA;
	Thu, 11 Jul 2024 19:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQdWuSR8uNhy; Thu, 11 Jul 2024 19:27:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43A82606E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43A82606E0;
	Thu, 11 Jul 2024 19:27:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EDCE1BF479
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B56F84027
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofwO6UsstNAB for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 19:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 62DF284026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62DF284026
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62DF284026
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 19:27:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 72168240004;
 Thu, 11 Jul 2024 19:27:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 21:27:19 +0200
Message-ID: <20240711192719.1161600-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720726041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/M5pFeOqpt2CQjnUI+X3mMEuffEky2poDL/kgkIh+fM=;
 b=S3ScdeN6AGlTYacsmyuvE2nU8rJyqOBGPX0ugcf3wqXgv1JL62D83FZInjO6GYdk8gVxlp
 ACmKI1avjbsOVHA/GVB81qPpjbJV/Ugw1D2qv9/uMKWAsPUDsY57r/mvgHk1MOWY52nvQR
 Fl4mJ/MXUNGAksVZsRzOA/EXZ33WKOcV2BLjq7PwbriJes54pBLsE5cshYGSjJMt/PT3RX
 aF61+n31N9WPgwSQi4dUUopZTJho0SyCuzl+jOycwHe7VDhGjd/gFjJFi0AoOqeDbsFu1z
 3vr87lR1YAq6axYMLtiD+qBQXQc72YspwOjY4ihfd/aige2Q+YV6WTSWGj7rVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S3ScdeN6
Subject: [Buildroot] [PATCH] package/ncftp: use correct SPDX license code
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to https://spdx.org/licenses/, the correct license code for
the "Clarified Artistic License" is ClArtistic.

The only other package in Buildroot containing code under this license
is google-breakpad, and it is already using the ClArtistic SPDX code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncftp/ncftp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index a3aa3fb194..57c3a5d08b 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -8,7 +8,7 @@ NCFTP_VERSION = 3.2.7
 NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.xz
 NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp
 NCFTP_TARGET_BINS = ncftp
-NCFTP_LICENSE = Clarified Artistic License
+NCFTP_LICENSE = ClArtistic
 NCFTP_LICENSE_FILES = doc/LICENSE.txt
 
 NCFTP_DEPENDENCIES = host-autoconf
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
