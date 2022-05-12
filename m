Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646F2C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E343082F8B;
	Thu, 12 May 2022 20:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KInL94PtU3nu; Thu, 12 May 2022 20:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F380C82F76;
	Thu, 12 May 2022 20:35:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11B121BF3A4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0037E41685
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NiZ9Nstfy0Sc for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:35:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2F64415C5
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:35:29 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout11.t-online.de (Postfix) with SMTP id 540841F736;
 Thu, 12 May 2022 22:34:37 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd74.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npFW8-1pThLN0; Thu, 12 May 2022 22:34:36 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48520)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npFW7-0004sh-OY;
 Thu, 12 May 2022 22:34:35 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 22:34:35 +0200
Message-Id: <20220512203435.1735055-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652387676-00012DCC-19FC31BF/0/0 CLEAN NORMAL
X-TOI-MSGID: f7b1de2f-574c-4951-a878-eccfade67338
Subject: [Buildroot] [PATCH 1/1] package/nut: fix typo in comment
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nut/nut.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index abb6433559..98891225a4 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -62,7 +62,7 @@ else
 NUT_CONF_OPTS += --without-cgi
 endif
 
-# nut-scanner needs libltdl, which is a wrapper arounf dlopen/dlsym,
+# nut-scanner needs libltdl, which is a wrapper around dlopen/dlsym,
 # so is not available for static-only builds.
 # There is no flag to directly enable/disable nut-scanner, it's done
 # via the --enable/disable-libltdl flag.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
