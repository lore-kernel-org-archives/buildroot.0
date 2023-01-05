Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9FDC4708E
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 18:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9F0B82199;
	Thu,  5 Jan 2023 18:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9F0B82199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sm0iopuZo6B4; Thu,  5 Jan 2023 18:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FC7082195;
	Thu,  5 Jan 2023 18:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FC7082195
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8931BF267
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 18:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3141582195
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 18:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3141582195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gN_5fyalhawm for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 18:51:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A2A482194
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A2A482194
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 18:51:45 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout05.t-online.de (Postfix) with SMTP id 9D10914423
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 19:51:42 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pDVL2-0jZzcX0; Thu, 5 Jan 2023 19:51:40 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56404)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pDVL2-0004Px-0a
 for buildroot@buildroot.org; Thu, 05 Jan 2023 19:51:40 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  5 Jan 2023 19:51:40 +0100
Message-Id: <20230105185140.622799-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672944700-2D0B8EA1-AE60BBBF/0/0 CLEAN NORMAL
X-TOI-MSGID: e9d6fe81-6365-45e5-999f-91f698010364
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: add configure option
 to install gpg-error-config
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

Upstream commit[1]

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=0b47de9c719b0ed0da0791f0525de073737bde5a

changed behaviour: "gpg-error-config is now only installed when enabled"

Fixes:
http://autobuild.buildroot.net/results/bc1/bc1566a0fa42f68f1f15f74a61d4081e269e1689/

[1] included in version 1.46, added in buildroot with commit b5bdcb4cc5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libgpg-error/libgpg-error.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index ab3c7c3bf2..3f4a45a7e4 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -15,6 +15,7 @@ LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LIBGPG_ERROR_CONF_OPTS = \
 	--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
+	--enable-install-gpg-error-config \
 	--disable-tests \
 	--disable-languages
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
