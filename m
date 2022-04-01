Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E170AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 18:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78EB060B24;
	Fri,  1 Apr 2022 18:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqWUhNCwj_5b; Fri,  1 Apr 2022 18:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B000760E95;
	Fri,  1 Apr 2022 18:06:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE311BF20F
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 18:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D01482B08
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 18:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1dQ9YUK0mfz for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 18:05:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12CED82B93
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 18:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648836322;
 bh=M4qaCiuYuJg13n9SDmrfB3MXaa3QhboWQnbLlbzDRzA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Z3g6GKDWVt+lI9qKTeAWitUlNit4TKa/islx2Zb0GIdnhGKcZQFPmsagdi0DaqIsa
 f/I/8nMBOELBKqr7eZ8U4IQ9CeIpvBZHxRFVwh/wxeIjLoU9FYW2wKi8KlvH2VZjR4
 VkdnZCnavNIoz1gnTI0ATvnCtVGDMdkw+oEqEliY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.24]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McY8T-1oAUoh1OsX-00cwJb; Fri, 01
 Apr 2022 20:05:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 20:05:20 +0200
Message-Id: <20220401180520.15772-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401180520.15772-1-ps.report@gmx.net>
References: <20220401180520.15772-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Mo/bGu28Ir0BQNcvlLNpa8jDHDUEVsiNkTjVmRgOkCXYCECXm/e
 zDj8bG+mMgupsstgTwHpNY1BS8wuTv8W68ffHDZEmicNE4+La8e6cExQkzOGmPPvAVGcePZ
 QdoQt5zTiJ8B792uWteiEP8gXGDosQfsHus0F8oVJsCLiVomuXBJwGUxi7hC1sX8UE9E2bN
 nx4SK/F2rKUO/LmPJprmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rhK7tdy8Iu0=:cO49KSNUq+NvvnhBqyXdmW
 veXt3x50sNsdxX5KGojG6UT41DRANqaqLLZtYUvKLePy/M4g4Js6jRoU6OXtTQE9Knhce7ao0
 +e3MfFWwxsQdhwUptKrdJOxUMbkg8sUi6BH/ICZ/YHIqcwAUyDRh0XREpronv1qC9HhBc3JhZ
 3PrMPu1QBR1ImCDfrBNFtw7+u7X0kHGQvsdw512XHdwaF+bDZxKgunqOFNojU4xAINspXb0KF
 pRX7Va1nEcza+BYT74qLn5M8beDpk9Aojq/CSphujLZGPk/6xZPZ6IwbY1GqQ5YAgVLD2QQuE
 2APalxECZz63tstjPGf/eg5ieMneMJsOj2WXBv6bLX4cTMqMuNdz+ldI/BI39k7qvSX2R28HI
 K5uAAZgpORbWoAEeAWWtBoZZ6GrgRjj7joFVOG9LlfrnxSNXx8Yn6SOIc/eVUmOi2QDvyIBUV
 HJIFLpmmAthyHRk7+wY+SDuBS6oSDKAufmfmsD9b2+XI1tazJFqC16kNoCib2iPcNQBb/Y3lz
 OFDPB9scBDpdBaiLoFHFsP/KslC1row0wcY5R80y0whvupg0BwmFRLEv8zItdzQMO4CAAKmFT
 e3xZ8emI+cBUVf58merrhcGh4VE/Xuuhn40ZVccU4Pk/q/SoOfUqJdvO3UsHgtIJInhVM+U63
 Zj1oG0z9XRlUFn5IQ8aDN8gqZK5pO/bRhb6V6IZ+QDeAR2P9rQs5GfMLzXGHcpZjl89sfnvEJ
 e2eRDQorcapXJ/pdXtz3px5nGh8ltt4CLnHzC1xBd4e+p+W1KSD5LyAf+iMRBhaWPu+lVVzio
 BCYdFEoFeqkumPSwL01DZwnn9vl6qO9pRVYPsqbWEL0mwYrTsQAvEYSeDUCM+58V9QqY6M5TD
 d1zH0ywkTgdY+vvWI2+cIyvWcM1hm/qoNBAkXcHqesK9t8UXYeWDf2Bqf/AqdTT78rOdSLGAR
 cY7lJ55J4O+N8HZlUhK+SM4xUQt2GBhaC+lDJ45fB4o8PLywzEv4mrbVB5onr0oTSDc7IWOwD
 oZcFYU/IuAbsYjtPgsQ3UNEQGu/AHR2OCHf0U48/uQrGq57ESdQbTVwv3G/GU7Xw1hiXrjffN
 eE1wRlqQJo0OOQ=
Subject: [Buildroot] [PATCH v1 4/4] package/apr-util: change project url
 from http to https
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- change project url from http to https (and remove trailing slash)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/apr-util/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 6c5e3bbdf5..c1a967bdec 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_APR_UTIL
 	help
 	  The utility library for the apache runtime project
 
-	  http://apr.apache.org/
+	  https://apr.apache.org
 
 comment "apr-util needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
