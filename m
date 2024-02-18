Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DE7C48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 18:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D78681F1D;
	Sun, 18 Feb 2024 18:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zh78Ih5APPqH; Sun, 18 Feb 2024 18:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01A7981F3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01A7981F3B;
	Sun, 18 Feb 2024 18:45:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1EA61BF86C
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD8A340732
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-qPFikPmS7q for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 381C2405DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 381C2405DE
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 381C2405DE
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 18:45:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bmASrFAK1ce1vbmAUrHZJ0; Sun, 18 Feb 2024 19:45:38 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 19:45:31 +0100
Message-Id: <20240218184536.1922309-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKoj9QbZm3o7ZFS7LiFVcAudpdw8zZ6vQIcsYnRdNqyQbLvWRBkN//Z/eq2ZkLkNfCHbYPDazvD1l/kMetz7vXWet7y5HRSCPBnXW3iHjTgxjyqE8kQE
 N0xCdAQQjuIKkbxDT/2oeiB21wdFvZrfdYSgioVqTe5psCLKt4YIh1bpd5uKjPf7HvEDQ9pfTxORNmxC/VxYrQEgQvNXoGHeyB3Rv4UzHEOqVMaatSS7btsV
 qsUW+cduvxAEmBR9/TX6KOw9DWxami75tIa8yLv0ajYZaNyL30a5xpOc1I5bnM/Azx645VCo6H9soR/0tKbtqz9J97wXLgqU2rp/UUrga2ZhQ/sFMz2gTOtN
 uTK7vKwz1ypQNSd1qiMBHqSaynGNIxmbZqBXIM6/MqUfu9zCC1BjoM2Oujy1S7gKDC5Atb8Rei0fm2hzhUaGoHmd5V/E920QC4vd0U5l+bGJXjABnNogbEtc
 k8t+3czUijbBeyCwjUIuS85cWc2cv42rFaKcx3Hu+rdWIyZ99e8PbVFz0A5x3kzv83gYITzhDapFANCd7VsQcbzd56rBlsZ7JaitX7F667zEACTt2kfvyRVX
 PAA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708281938; bh=Y/vWCxi8r0NKShAva4ueJdRt4zM4eSwAggUlnkIXHSY=;
 h=From:To:Subject:Date:MIME-Version;
 b=KZkTaCPLit2o7wuQXAYnUYVxfShR5ffxobq1sZXxPdkB8phLhuyDSeZsg9FP24QBq
 3a+rxYssMa0Hb2tRVfMAYTbuDvuWexmhxNNYWNMaeocurwq6OHm8DcSKrPGrfwIH45
 9doGR8JKGp+TBTQ7wr43aoydz/tF10lgXPyb+kT4SeIQ3IL4arUwc/8/9kgToSYiL2
 jB68plQrWLyYsFn465XTA8NxgK+RQbz5LGUfhxFM53uQO+Sf5+LMsWtQgjO7CwSQAc
 PsvgAXUegjTETc9K7qIa4LXVmt/JWPgiXnGWBTchyC43Gw3gmgVurW5ruKP+Ppj5Vz
 MB8wCD9gCexFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=KZkTaCPL
Subject: [Buildroot] [PATCH 3/8] package/kf5/kf5-kcoreaddons: drop nios2
 binutils bug 27597 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/kf5/kf5-kcoreaddons/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kf5/kf5-kcoreaddons/Config.in b/package/kf5/kf5-kcoreaddons/Config.in
index 02bd38e395..88fda03ee0 100644
--- a/package/kf5/kf5-kcoreaddons/Config.in
+++ b/package/kf5/kf5-kcoreaddons/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KF5_KCOREADDONS
 	bool "kf5-kcoreaddons"
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
 	select BR2_PACKAGE_QT5TOOLS
 	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
