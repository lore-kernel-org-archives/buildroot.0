Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F89C433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 20:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AED6240169;
	Fri, 11 Nov 2022 20:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED6240169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1spAhnOh7WiR; Fri, 11 Nov 2022 20:29:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB6F640132;
	Fri, 11 Nov 2022 20:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB6F640132
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E041D1BF42C
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B342181F25
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B342181F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5NQcNs-vg7O for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 20:29:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E25F81F22
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E25F81F22
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 20:29:35 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout06.t-online.de (Postfix) with SMTP id A2E19F199
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 21:29:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.183.139]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1otaeP-0BV1of0; Fri, 11 Nov 2022 21:29:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:58716)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1otaeP-0002Ib-1J
 for buildroot@buildroot.org; Fri, 11 Nov 2022 21:29:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 21:29:21 +0100
Message-Id: <20221111202921.3999-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1668198561-F9C53742-5E1AE9AF/0/0 CLEAN NORMAL
X-TOI-MSGID: b0a23ccc-c387-4737-af14-cf10557612a9
Subject: [Buildroot] [PATCH v2 1/1] package/alsa-utils: update dependency
 for topology support
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

This is a follow-up patch for
https://git.busybox.net/buildroot/commit/?id=28497102e1788df3628bd3324a3304a03c7942d0
which created a new option for topology support in alsa-lib, this
dependency was not ported over to alsa-utils.

Fixes:
http://autobuild.buildroot.net/results/a9c9f5157365efe8271bf69dab0d5a5532b196ea/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Updated dependency handling (Thomas)

 package/alsa-utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 555f06fd21..3429d0b406 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -46,6 +46,7 @@ config BR2_PACKAGE_ALSA_UTILS_ALSAUCM
 config BR2_PACKAGE_ALSA_UTILS_ALSATPLG
 	bool "alsatplg"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	select BR2_PACKAGE_ALSA_LIB_TOPOLOGY
 
 comment "alsatplg needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
