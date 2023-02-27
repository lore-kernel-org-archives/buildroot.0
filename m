Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D531C64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 15:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A4056103E;
	Mon, 27 Feb 2023 15:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A4056103E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FiETZTkqPA_e; Mon, 27 Feb 2023 15:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7230D60AE0;
	Mon, 27 Feb 2023 15:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7230D60AE0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF4801BF31B
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 15:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C96DC81749
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 15:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C96DC81749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ezLdaRrrR8B for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 15:15:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19EF18142B
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 15:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19EF18142B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A0A586C04; Mon, 27 Feb 2023 15:15:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 16:13:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8280400fbadde09e51ccff312d7a4ef6a386f589
X-Git-Newrev: 99d9dc1ad87796be17c4cdc9a1ac72d1b31c111b
X-Patchwork-Hint: ignore
Message-Id: <20230227151507.0A0A586C04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flac: drop unrecognized option
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99d9dc1ad87796be17c4cdc9a1ac72d1b31c111b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xmms-plugin has been dropped since version 1.4.2 and
https://github.com/xiph/flac/commit/8fbeff238c41464fe220cd23c45861c9302d1172

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flac/flac.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index ebb4778521..595c2379b0 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -17,7 +17,6 @@ FLAC_CONF_OPTS = \
 	$(if $(BR2_POWERPC_CPU_HAS_ALTIVEC),--enable-altivec,--disable-altivec) \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
 	$(if $(BR2_POWERPC_CPU_HAS_VSX),--enable-vsx,--disable-vsx) \
-	--disable-xmms-plugin \
 	--disable-stack-smash-protection
 
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
