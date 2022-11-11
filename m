Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9036C4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 22:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D0FA41892;
	Fri, 11 Nov 2022 22:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D0FA41892
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipHAVjgsCcIF; Fri, 11 Nov 2022 22:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19805418A4;
	Fri, 11 Nov 2022 22:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19805418A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37ED11BF290
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2F7661045
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2F7661045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IC1tTbyfK19q for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 22:52:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D50AE6102A
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 22:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D50AE6102A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2CDE8324F; Fri, 11 Nov 2022 22:52:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 23:52:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a378178cdd93a7b8d2c83d091b61478440f331a0
X-Git-Newrev: e62cf8d9025506ebcb9c1b1d3bb49523474851eb
X-Patchwork-Hint: ignore
Message-Id: <20221111225210.C2CDE8324F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-utils: update dependency for
 topology support
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

commit: https://git.buildroot.net/buildroot/commit/?id=e62cf8d9025506ebcb9c1b1d3bb49523474851eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a follow-up patch for
https://git.busybox.net/buildroot/commit/?id=28497102e1788df3628bd3324a3304a03c7942d0
which created a new option for topology support in alsa-lib, this
dependency was not ported over to alsa-utils.

Fixes:
http://autobuild.buildroot.net/results/a9c9f5157365efe8271bf69dab0d5a5532b196ea/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
