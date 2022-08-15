Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D259C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2EA881B84;
	Mon, 15 Aug 2022 09:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2EA881B84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYJ0OiZw_AkL; Mon, 15 Aug 2022 09:23:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1627A81B26;
	Mon, 15 Aug 2022 09:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1627A81B26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 72DAF1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7033540AAB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7033540AAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ce8S4JQFIXM6 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96C9540ACE
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96C9540ACE
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id ADC9D875C0; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:04:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b440abe1d0ee725765981179e7b1e8a76209d0c0
X-Git-Newrev: 8d8a83fd1f7615f7fdd2f230dc6a360f0840733b
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.ADC9D875C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcsc-lite: fix typo on
 BR2_PACKAGE_PCSC_LITE_*
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8d8a83fd1f7615f7fdd2f230dc6a360f0840733b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The typo was added in 2012 by commit
'8c345d91cf pcsc-lite: new package'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcsc-lite/pcsc-lite.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index d007d8da2f..34950dd866 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -37,11 +37,11 @@ else
 PCSC_LITE_CONF_OPTS += --disable-libsystemd
 endif
 
-ifeq ($(PACKAGE_PCSC_LITE_DEBUGATR),y)
+ifeq ($(BR2_PACKAGE_PCSC_LITE_DEBUGATR),y)
 PCSC_LITE_CONF_OPTS += --enable-debugatr
 endif
 
-ifeq ($(PACKAGE_PCSC_LITE_EMBEDDED),y)
+ifeq ($(BR2_PACKAGE_PCSC_LITE_EMBEDDED),y)
 PCSC_LITE_CONF_OPTS += --enable-embedded
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
