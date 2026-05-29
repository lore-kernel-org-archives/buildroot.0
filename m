Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EE7CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68E16615F0;
	Fri, 29 May 2026 17:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DKVCMTk10Il; Fri, 29 May 2026 17:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B961615F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780077302;
	bh=bquZ1Mvj9T7cfghFJb7pJ6h7H+Qyvo6c3t9m1ZKcJMM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iE+nSs4D1I7cPyC5XjRJfhofLFGdC4md06nz4AHYXqNFpXyqCzFHBV7SbNTOLzt0D
	 au2lO81QK5Uu47vH3TpJrpfrzlayx0hQciyUdRNRT9p70Qy07VeS9sucGwO5t8EeeT
	 wsX1EhuS/s0YbHUtTUNoUm4yngrzRoqW1yEsQmgU/yxUrdv1zOAPXf/p8zyzXWQp1S
	 /4KZ29+GtRkhaVIvs3GLmfvsiW+MGeE3LF6TsCadJ1hPOHxW2pChv2FFimmyTbqfWO
	 EVfWOtAFSMw7HSNOdWhgZcWqfs3fcU+wR/mv44dquNQsttBBXJg71bMxDKbTkoBPVC
	 vytS49n8eaHGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B961615F1;
	Fri, 29 May 2026 17:55:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00DCCF4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D52E9423BA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-HOKsIQar8g for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 047C7423B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 047C7423B9
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:55:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EF1E8740D; Fri, 29 May 2026 17:54:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 19:52:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 526b89cfd883073c048e32cabe4597e2c83084bd
X-Git-Newrev: d0cacc6acfb9357bc5aec61f7d9e330c2e41a190
X-Patchwork-Hint: ignore
Message-Id: <20260529175447.4EF1E8740D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad:
 disable qsv support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0cacc6acfb9357bc5aec61f7d9e330c2e41a190
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/64ed6075b782578d57edd09b3463071d6e5a4342
added support for the Intel Quick Sync Video Encoder with version 1.22.0
that was added to buildroot with commit
895840edd2784492d9b7066330b43842b703343b.

On unsupported platform the build is broken:

In file included from ../sys/qsv/libmfx/api/vpl/mfxdispatcher.h:10,
                 from ../sys/qsv/libmfx/dispatcher/vpl/mfx_dispatcher_vpl_log.h:24,
                 from ../sys/qsv/libmfx/dispatcher/vpl/mfx_dispatcher_vpl_log.cpp:7:
../sys/qsv/libmfx/api/vpl/mfxdefs.h:75:6: error: #error Unknown packing
   75 |     #error Unknown packing

caused by
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/1.24.13/subprojects/gst-plugins-bad/sys/qsv/libmfx/api/vpl/mfxdefs.h?ref_type=tags#L75

For now we disable qsv support to fix build errors on

arc: https://autobuild.buildroot.net/results/2d5/2d5666324db2fca7ab0419e28481829edca949b3/
m68k: https://autobuild.buildroot.net/results/53b/53ba2e9d09c25fe85e96b6e1fc9adbfcf5a637b2/
microblazeel: https://autobuild.buildroot.net/results/bc2/bc2b2324f385d2cafdae71ac19804f27f7a7414b/
or1k: https://autobuild.buildroot.net/results/17e/17e3dac016a08da8db58d735d0f2d3acc259f81f/
sparc: https://autobuild.buildroot.net/results/f07/f07995804faa0be38bbba462c52be86c6c69822b/

Fixes:
https://autobuild.buildroot.net/results/bc2/bc2b2324f385d2cafdae71ac19804f27f7a7414b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index c6fb669e13..ac554749c9 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -39,6 +39,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Davtp=disabled \
 	-Dopensles=disabled \
 	-Dmsdk=disabled \
+	-Dqsv=disabled \
 	-Dvoamrwbenc=disabled \
 	-Dbs2b=disabled \
 	-Dchromaprint=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
