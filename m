Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A6CEB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 17:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29A6F4026A;
	Wed, 14 Jun 2023 17:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29A6F4026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUC3_E5bJL0m; Wed, 14 Jun 2023 17:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BB6541863;
	Wed, 14 Jun 2023 17:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BB6541863
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DB601BF34A
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 17:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26A4F6137B
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 17:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A4F6137B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iowrbBiXoe8E for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 17:30:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF3A612DE
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEF3A612DE
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 17:30:36 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout02.t-online.de (Postfix) with SMTP id E270D413B
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 19:30:33 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.188.179]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q9UKH-2oPPEX0; Wed, 14 Jun 2023 19:30:33 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:39424)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q9UKH-0003Xi-0N
 for buildroot@buildroot.org; Wed, 14 Jun 2023 19:30:33 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 19:30:33 +0200
Message-Id: <20230614173033.1748392-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614173033.1748392-1-bernd.kuhls@t-online.de>
References: <20230614173033.1748392-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686763833-42FF7266-E9D11514/0/0 CLEAN NORMAL
X-TOI-MSGID: 22fd5e01-c1ff-4fe4-9d0a-d651a5c95457
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xapp_xhost: disable gettext
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

Fixes a build error similar to
http://autobuild.buildroot.net/results/856/856b0f332b4a82a5ce308643c37a14d3c6aebcc1/

To reproduce just enable this package using the defconfig on a host
without /usr/bin/gettext and without /usr/bin/xgettext.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xhost/xapp_xhost.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index 55f7ca5cc7..4638095976 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -12,4 +12,8 @@ XAPP_XHOST_LICENSE_FILES = COPYING
 XAPP_XHOST_DEPENDENCIES = xlib_libX11 xlib_libXmu $(TARGET_NLS_DEPENDENCIES)
 XAPP_XHOST_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+XAPP_XHOST_CONF_ENV += ac_cv_search_gettext=no
+endif
+
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
