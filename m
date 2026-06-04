Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B6ACD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D2D81E4C;
	Fri,  5 Jun 2026 12:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9RFd8zNunq1; Fri,  5 Jun 2026 12:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B3881E52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663081;
	bh=7HfhlncNB4+hl06pNKdy8dlD2cYy1dr84q7goiCYL54=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dVG6dVkJQQSSNYjNWvaFULF+54BpOoW0GQQuoeRnCWP7wMO8V7ZkikFgFQDTD0mjB
	 EZ/ka1ZRlelolYH9Hpc1V7avnzDF0IiQsU753tp1+yWy4iqNyhUP7yi3yu6DHoIF3F
	 x342ABRBAo2nL01PV1zytrzIhtuqGAFJGGqHI7OBXcmLjFJeiQnpu+DGD0voXCWKUI
	 EYJn/EvKvYgsktpjSCR1QfL8OAypzCpmnSkwHLRneT+OiT4bqY5+63k1mxv6DLOwi4
	 ypW2Lfx0xpzAjdDsGvygdfPkZXnFkbFA6PYMGVCGHpOwhOC5Do33OdCD7ePTEFmSkR
	 hqqIuN5fR97+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54B3881E52;
	Fri,  5 Jun 2026 12:38:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE8A388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97B9281E66
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htANeqH57ybJ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F54881E63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F54881E63
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59A7187B40; Fri,  5 Jun 2026 12:37:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:36:30 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 95faf0f8b808902da6b3353b8c1b2d4b794607e2
X-Git-Newrev: 5a6f96794a5569e49cbb90b8ff04581a5103a9fd
X-Patchwork-Hint: ignore
Message-Id: <20260605123711.59A7187B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5a6f96794a5569e49cbb90b8ff04581a5103a9fd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 99aa258786..0e295a4927 100644
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
