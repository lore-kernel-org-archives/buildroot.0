Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03FCEB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 17:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D85140292;
	Wed, 14 Jun 2023 17:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D85140292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1dRzO8amOsMQ; Wed, 14 Jun 2023 17:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FE444185C;
	Wed, 14 Jun 2023 17:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FE444185C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC821BF34A
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 17:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2399E6137D
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 17:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2399E6137D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hy-vMnE-aF_I for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 17:30:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B586137B
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4B586137B
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 17:30:36 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout10.t-online.de (Postfix) with SMTP id C23E83A138
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 19:30:33 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.188.179]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q9UKH-0a1PE10; Wed, 14 Jun 2023 19:30:33 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:39424)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q9UKH-0003Xi-0G
 for buildroot@buildroot.org; Wed, 14 Jun 2023 19:30:33 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 19:30:32 +0200
Message-Id: <20230614173033.1748392-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686763833-43FF5570-E4E24EB6/0/0 CLEAN NORMAL
X-TOI-MSGID: 368bcc41-b4bb-4f9f-989c-754e2f28f48f
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xapp_xfd: disable gettext
 detection when not needed
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
http://autobuild.buildroot.net/results/856/856b0f332b4a82a5ce308643c37a14d3c6aebcc1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xfd/xapp_xfd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 1ef1d69db3..bccbc1da5d 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -25,4 +25,8 @@ else
 XAPP_XFD_CONF_OPTS += --without-xkb
 endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+XAPP_XFD_CONF_ENV += ac_cv_search_gettext=no
+endif
+
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
