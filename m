Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AD3C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:42:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C408A61050
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C408A61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9674140360;
	Tue,  3 Aug 2021 21:42:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAd4wAe25QiR; Tue,  3 Aug 2021 21:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0F624010B;
	Tue,  3 Aug 2021 21:42:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 067DF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64980605CF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9ts-gxMXfbR for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C146560883
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 24A83864A8; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 09:25:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 128901c80a58924c9e7a16465e30474eaa9fe3b0
X-Git-Newrev: f1e014655da6b77c9e1768cb0d6fb78f1321ae5b
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.24A83864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/beaglev-secondboot:
 update to include upstream fixes
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f1e014655da6b77c9e1768cb0d6fb78f1321ae5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update the commit id to include upstream fixes:

- Fix print format in load_and_run_ddr(e976d186e69a)
- Update copyright info (f2b049b7fff2)
- Avoid chiplink address exception (86664be28e5d)

Signed-off-by: Drew Fustini <drew@beagleboard.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/beaglev-secondboot/beaglev-secondboot.hash | 2 +-
 boot/beaglev-secondboot/beaglev-secondboot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/beaglev-secondboot/beaglev-secondboot.hash b/boot/beaglev-secondboot/beaglev-secondboot.hash
index d936263d1a..e0ca0e149d 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.hash
+++ b/boot/beaglev-secondboot/beaglev-secondboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  b97dc40dbfc49ced591d6ef53d06adebf90b9c467d3754ec51b2626593d97cbd  beaglev-secondboot-a4f0b4307f877890f998b3216cffcc9f27a5f993.tar.gz
+sha256  56519b20a8ac2b68770cacd5158190dfcb2b3762a759b1c44582ca25ffbccc5d  beaglev-secondboot-e976d186e69a1a84884265b0689626fa254a950d.tar.gz
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.mk b/boot/beaglev-secondboot/beaglev-secondboot.mk
index 7bd97165de..6d904b02ba 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.mk
+++ b/boot/beaglev-secondboot/beaglev-secondboot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'starfive' branch
-BEAGLEV_SECONDBOOT_VERSION = a4f0b4307f877890f998b3216cffcc9f27a5f993
+BEAGLEV_SECONDBOOT_VERSION = e976d186e69a1a84884265b0689626fa254a950d
 BEAGLEV_SECONDBOOT_SITE = $(call github,starfive-tech,beagle_secondBoot,$(BEAGLEV_SECONDBOOT_VERSION))
 BEAGLEV_SECONDBOOT_INSTALL_TARGET = NO
 BEAGLEV_SECONDBOOT_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
