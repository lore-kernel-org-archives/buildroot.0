Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607AEC4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 17:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAC1840A8E;
	Tue, 13 Dec 2022 17:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAC1840A8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2JK-S7aq3uh; Tue, 13 Dec 2022 17:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04963405D9;
	Tue, 13 Dec 2022 17:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04963405D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D96851BF275
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 17:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B44D060E8A
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 17:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B44D060E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IwVAEolzJ9FL for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 17:11:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 760E360BB9
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 760E360BB9
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 17:11:23 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout11.t-online.de (Postfix) with SMTP id 668F8204EE
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 18:11:08 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p58o4-1Hcl290; Tue, 13 Dec 2022 18:11:04 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:58380)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p58o3-0005wK-2Z
 for buildroot@buildroot.org; Tue, 13 Dec 2022 18:11:03 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 18:11:03 +0100
Message-Id: <20221213171103.684842-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670951464-C23211D1-B088CEB2/0/0 CLEAN NORMAL
X-TOI-MSGID: b8661865-d537-4ef2-8780-0058116ec544
Subject: [Buildroot] [PATCH 1/1] package/hddtemp: link to libintl when needed
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
http://autobuild.buildroot.net/results/e84/e84b7131f996302301dd0a8fd47362c9f2eab0bf/
http://autobuild.buildroot.net/results/524/52428940034d59887e0172fbd8481943d86db13b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/hddtemp/hddtemp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/hddtemp/hddtemp.mk b/package/hddtemp/hddtemp.mk
index 7023e11e59..4f45647dff 100644
--- a/package/hddtemp/hddtemp.mk
+++ b/package/hddtemp/hddtemp.mk
@@ -15,7 +15,8 @@ HDDTEMP_GETTEXTIZE = YES
 
 HDDTEMP_DB_PATH = /usr/share/misc/hddtemp.db
 HDDTEMP_CONF_OPTS = --with-db-path=$(HDDTEMP_DB_PATH)
-HDDTEMP_CONF_ENV = LIBS="$(HDDTEMP_LIBS)"
+HDDTEMP_CONF_ENV = LIBS="$(HDDTEMP_LIBS) $(TARGET_NLS_LIBS)"
+HDDTEMP_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 HDDTEMP_DEPENDENCIES += libexecinfo
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
