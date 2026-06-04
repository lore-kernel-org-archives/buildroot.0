Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F27CD8C80
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 383E14116F;
	Fri,  5 Jun 2026 12:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqV4OhBjFsbx; Fri,  5 Jun 2026 12:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61FB741149
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663171;
	bh=jH5Qx4fKohTSPyejCm+3Das3zidfDsbfsTh++mWyyyY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V9gWum3SFOamgmraPjFKjXoUVMpSj/4wTsk73Hfh96DNFMBxdNrpo+SeRVx/9YCBT
	 ubZYA/uAD9sfEfepyIsWdG7GQAZ7hRl47MbEk1Uju4EJRUkcGP/6s1f7+WW53Wl3hD
	 Fklhlwb7q7z+YRiN5b0p1TSiYbhJgSR20z/sacwFxHuG2oQ+Ql+7NWNhgosB3B86Pf
	 Uyc89D7/HPpUxsCekbowc3s9Px8mYQmW60gwZKj+/noo0msUgz83lvtywTzP5V/fVR
	 7Q+Yd7QYOQTxFiJ3DY2DXciG18ZgOk/YROlJW8BVwIV2Z8Ar2o3vUX/HUXc8UYKSXk
	 92Iq9Z0EGWNBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61FB741149;
	Fri,  5 Jun 2026 12:39:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10A893B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B22541054
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKPom8VMygzk for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56FCC4100E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56FCC4100E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80D19872F5; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:36:32 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: cd1c5871d17743898cf0cad6d7dd56d6e4fa8061
X-Git-Newrev: 46794e33bc651e5ddd0f6fe5ffa84880e2b36207
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.80D19872F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 package/gstreamer1/gst1-plugins-bad: disable qsv support
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46794e33bc651e5ddd0f6fe5ffa84880e2b36207
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit d0cacc6acfb9357bc5aec61f7d9e330c2e41a190)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
