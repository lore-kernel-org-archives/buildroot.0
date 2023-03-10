Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860A0C6FA99
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 17:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0449541B8C;
	Fri, 10 Mar 2023 17:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0449541B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id heKOjuBZDZ-Y; Fri, 10 Mar 2023 17:06:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1858241B8D;
	Fri, 10 Mar 2023 17:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1858241B8D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6851BF3B8
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 17:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6834B404AF
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 17:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6834B404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GkfsbT_8kwQV for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 17:06:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C3A3400AF
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C3A3400AF
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 17:06:15 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout10.t-online.de (Postfix) with SMTP id 9129B5D7C
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 18:06:12 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.179.197]) by fwd76.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pagC4-03ZMMz0; Fri, 10 Mar 2023 18:06:12 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44514)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pagC3-0001nM-2b
 for buildroot@buildroot.org; Fri, 10 Mar 2023 18:06:11 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 10 Mar 2023 18:06:11 +0100
Message-Id: <20230310170611.425280-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678467972-E5D7A2C2-953D8CDB/0/0 CLEAN NORMAL
X-TOI-MSGID: b4d01055-60cc-4628-a09e-1daae2c8f51b
Subject: [Buildroot] [PATCH 1/1] package/php: link with -latomic if needed
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

Fixes:
http://autobuild.buildroot.net/results/112/112ec5cb0de6f55a29caf7ec563367afd28eb8a0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index bd7d5a8c3c..49f02d7f20 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -35,6 +35,10 @@ ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 PHP_STATIC_LIBS += -lpthread
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+PHP_EXTRA_LIBS += -latomic
+endif
+
 ifeq ($(call qstrip,$(BR2_TARGET_LOCALTIME)),)
 PHP_LOCALTIME = UTC
 else
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
