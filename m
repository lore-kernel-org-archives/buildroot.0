Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FDAC7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 16:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE46B84483;
	Mon, 12 Jun 2023 16:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE46B84483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7CTsDpa-Fsb; Mon, 12 Jun 2023 16:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1814C81B9D;
	Mon, 12 Jun 2023 16:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1814C81B9D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F7DC1BF271
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 16:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1668415B7
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 16:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1668415B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDd8VFri40sH for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 16:02:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EC1D415BC
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EC1D415BC
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 16:02:29 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout05.t-online.de (Postfix) with SMTP id 7A8FA1BC9A
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 18:02:06 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.180.237]) by fwd85.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8jzZ-1f9oXJ0; Mon, 12 Jun 2023 18:02:05 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40978)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8jzY-0000P9-2v
 for buildroot@buildroot.org; Mon, 12 Jun 2023 18:02:04 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 18:02:04 +0200
Message-Id: <20230612160204.1474380-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686585725-AFD93DAB-8E5AF67B/0/0 CLEAN NORMAL
X-TOI-MSGID: d950d0b0-5f13-47bf-b469-61c4c6b7c551
Subject: [Buildroot] [PATCH 1/1] package/speex: force arm mode instead of
 Thumb mode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

/tmp/cclxE0xY.s: Assembler messages:
/tmp/cclxE0xY.s:118: Error: cannot honor width suffix -- `smlabb r2,r0,r4,r6'
/tmp/cclxE0xY.s:134: Error: cannot honor width suffix -- `smlabb r9,r2,r2,r3'
/tmp/cclxE0xY.s:812: Error: cannot honor width suffix -- `smlabb r1,r2,r2,r6'
/tmp/cclxE0xY.s:1202: Error: cannot honor width suffix -- `smulbb r3,r0,r6'
/tmp/cclxE0xY.s:2298: Error: cannot honor width suffix -- `smulbb r3,r0,r4'
/tmp/cclxE0xY.s:3133: Error: cannot honor width suffix -- `smulbb r3,r2,r5'

Fixes:
http://autobuild.buildroot.net/results/c55/c557ca72832c942f201b4a21f913f74534857cc6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/speex/speex.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 6d61e93833..0bbcb2bde2 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -26,6 +26,10 @@ ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
 SPEEX_CONF_OPTS += --enable-arm5e-asm
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+SPEEX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 define SPEEX_LIBTOOL_FIXUP
 	$(SED) 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' $(@D)/libtool
 	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(@D)/libtool
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
