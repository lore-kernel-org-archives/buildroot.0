Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA258CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE0F6820A7;
	Fri,  5 Jun 2026 12:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tptJDzBs6TKV; Fri,  5 Jun 2026 12:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C965E820A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663166;
	bh=rAZLRaA1rvZcb4kiUYSSWKTwBSGpVzySAAxiPlSJahQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eJycyWb0dkowz4SEOMbQ5H9eKkBpip3dHeJ/L+cxg+O/M3NNl3QygDQq5mjFxFT5I
	 x1s7gVYhLxZXbs0zeeJ3H5vE3EjcjTOimb/YrQoTTfhu1FrKzzSNvwOv8BIABgynJr
	 cOAZNEDWRpNnF933xEH/L92MgPb2bTn9AIt98tnM5zA1qzm+bvWVWuHGafnfL6p2qC
	 f/AxBaR9WrWbh+lu5KJqKFaP8UjlfWxYZ171v//ONzBdhVc00XJv1DPJXggG9BkbG6
	 d/xGXBHRm7OYqpyU5MHkdYDiS4PIwlmZ5MDthFnHifnY9nRZnL7lQglkAfiemCvK35
	 B1dqWQ2eBB43g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C965E820A3;
	Fri,  5 Jun 2026 12:39:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E68B49B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F41B34039F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzl7faQNIpyk for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AD4C40334
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AD4C40334
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6837187B39; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:19:16 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d2910d13224afec58fc77ef0468d6a1278f912c0
X-Git-Newrev: 641ae239a758c60586fbdb64e9f5432f984b52c2
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.6837187B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/stellarium: fix
 qt5serialport dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/641ae239a758c60586fbdb64e9f5432f984b52c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

qt5serialport is only needed when GPS support is enabled:
https://github.com/Stellarium/stellarium/blob/v25.4/CMakeLists.txt#L623,
so having qt5serialport without gpsd doesn't bring anything.

Please note that we disable telescope support by default so only gpsd
enables the usage of qt5serialport.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8e2238ccce83623c575446f11a84cc2712cdd225)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/stellarium/stellarium.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 660d518860..48dadfec61 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -32,11 +32,8 @@ else
 STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT5SERIALPORT),y)
-STELLARIUM_DEPENDENCIES += qt5serialport
-ifeq ($(BR2_PACKAGE_GPSD),y)
-STELLARIUM_DEPENDENCIES += gpsd
-endif
+ifeq ($(BR2_PACKAGE_GPSD)$(BR2_PACKAGE_QT5SERIALPORT),yy)
+STELLARIUM_DEPENDENCIES += gpsd qt5serialport
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=ON
 else
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
