Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F5AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0A18402E1;
	Mon, 29 Nov 2021 22:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XD6cQRaBjUly; Mon, 29 Nov 2021 22:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE25B401BD;
	Mon, 29 Nov 2021 22:19:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2853F1BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 180D360A4E
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cz2eWH9hhgo7 for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:19:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D5F660A4F
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:19:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so13402729wme.4
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h/2Zmd4moGug1BuQ93WYaZ4Zk/ZY91OeQ7DThr0w2s0=;
 b=LjzrMpexk6+50t+Lh4Wt4VUnomV12tBSRVGUOHFp+1EqUdqUnJwOecX+ygKHOHLl1A
 2O19arAs+YuPlFKcjWNmMmMiAm3x0N+DGj6ux9Nuu+TWmvUdSTKBp7vls6wq7T0hr7aU
 FLeEd/BESaU+WC4lj4ygHORl2cK4vkrElgWvMY9moVxCOn9809W8lRpq4cs0r14XXxVH
 j6tBKi7bobkpGtZdNKWUOSXyArdKMzMgHhHoi/gujuK06kh+Ljio+O4b0kqpz+HXXBdv
 7TQphNLkn6OnMC9MwzJ09FzUS7fmMV+ip8b63EdGEeCy2xchyiSf7pXu3lxhRGU6eXDQ
 bE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h/2Zmd4moGug1BuQ93WYaZ4Zk/ZY91OeQ7DThr0w2s0=;
 b=lJYF2DpXNGllzE9kNbjVO2cGAiVu182kUhIM9sv1+BBov/WYezCZ2DRShfKnjoU1IB
 y/a4zszWHJGMYuc8CIQutZYil5jquDBqfdg0b28orkacqrhDGLC7DsNvIMbrnnjJy5J8
 zkwQrvX0UL2kOq6yVRm8J5yWo9DdPAcm+0xCUgOJcsUPiCm7+uEAjtT2ziW6Q0gOo7+O
 CMEzOqDJMRjSnus10bihTv2CoAc3CbN5FeeFxW8TryP/LIqcvi9bTc2COjizMr1VFTBi
 R7kVAT7PE9KhPF2EDez+z7YS7l9WWy2zBr/Q+2KaV13im/utX2t1IIf7Tx3vO5WH1UI+
 raWQ==
X-Gm-Message-State: AOAM533C1piZynjaMuZM/MvCxJRc2k/BHD23Pi8PL+hqWI2/Yah9DQDn
 Qyj2NyiwAIJIqpprlzcuzhRDwOMmMZk=
X-Google-Smtp-Source: ABdhPJw2qpwkFkGGLLxmuu/ttQbD0PKyc+HrHRmZDzaTc39QwlUTk+w7rZoCA9j76keHkFlqRobi+w==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr787107wmg.86.1638224387586; 
 Mon, 29 Nov 2021 14:19:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id y7sm14580802wrw.55.2021.11.29.14.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:19:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:17:11 +0100
Message-Id: <20211129221711.2183726-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/restclient-cpp: drop spurious space
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
014c47cfbf014e916efef688ac5f892e5082d188

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/restclient-cpp/restclient-cpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/restclient-cpp/restclient-cpp.mk b/package/restclient-cpp/restclient-cpp.mk
index 826be870b9..1ba9ed8139 100644
--- a/package/restclient-cpp/restclient-cpp.mk
+++ b/package/restclient-cpp/restclient-cpp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RESTCLIENT_CPP_VERSION = 0.5.2
-RESTCLIENT_CPP_SITE =  $(call github,mrtazz,restclient-cpp,$(RESTCLIENT_CPP_VERSION))
+RESTCLIENT_CPP_SITE = $(call github,mrtazz,restclient-cpp,$(RESTCLIENT_CPP_VERSION))
 RESTCLIENT_CPP_LICENSE = MIT
 RESTCLIENT_CPP_LICENSE_FILES = LICENSE
 RESTCLIENT_CPP_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
