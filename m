Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58FACD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAB2C85A22;
	Tue,  9 Jun 2026 13:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJw4zc-d_m2K; Tue,  9 Jun 2026 13:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E8D85A2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010209;
	bh=964QEiNKr3T6JBQbsAGlDR7h+gliBw5P+dO5CgMLJpQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZvXcoCiLG/toR2XxCmQK5bXllOHjOUgDgjAM0/uM2B92U/u4XUpS0MURdFG1HMCYl
	 F3rkznvytZTAJFKvvQKWQ7sJdaAQB561dPaIPhrDJjCE+3ZjHatSEzW4nBZ4RkH2nv
	 Vv8uo+C5ptMxKM7Ekafy/aLz3tvOKxrK9LVEocrR2JyDj+zsE4l3/A2Fv4YfHVggSo
	 nRnanLui3IME8PtPQjlO/pAlqb6t66nt+tnySbxZ+MjEyX5boo0te0jTgOWWMrw3XB
	 vC6HOKzwHrxpP2o+PnXbfpOadp4S2qIeF/bak/17kF3GWDuWah206JBkVRtLKX1pPZ
	 LHAvUci4K7/aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7E8D85A2A;
	Tue,  9 Jun 2026 13:03:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C55B196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C9414542E
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuPa7R_JiJjh for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CFD9454B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CFD9454B4
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6F0F87E7E; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:36:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6768a2b6820142c31d95b5f84722caada1aa000
X-Git-Newrev: f22ee807403a440b4f66ad8a5741d8f5fc04cd74
X-Patchwork-Hint: ignore
Message-Id: <20260609130119.B6F0F87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5base: optionally use libudev
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f22ee807403a440b4f66ad8a5741d8f5fc04cd74
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

qt5base only requires libudev, not a full udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt5/qt5base/qt5base.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 3ad2bdfc04..e465969f64 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -101,8 +101,8 @@ ifneq ($(QT5BASE_CONFIG_FILE),)
 QT5BASE_CONFIGURE_OPTS += -qconfig buildroot
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-QT5BASE_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+QT5BASE_DEPENDENCIES += libudev
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS), y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
