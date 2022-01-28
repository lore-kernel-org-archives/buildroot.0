Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D099C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 20:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD3AD405CF;
	Fri, 28 Jan 2022 20:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZd6e_p3sAcx; Fri, 28 Jan 2022 20:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFC1940253;
	Fri, 28 Jan 2022 20:53:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE8E1BF842
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5894840253
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSup2t8zzl1U for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 20:53:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22E6E4012E
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 20:53:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s9so13101933wrb.6
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 12:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kgbrwd3xCnSzpxda24wbaUe5EY+jS19PHFckVvmC3b8=;
 b=ABWyfdByI+3L9BeZjdL99hG74aigq2M5wuIJIU0cLC0osAC+HDLIjl/nw01X6vCJBY
 NlPH2te4C0nU3h2dHpoyu1PUFNAsH9s2Io8WI89HmqztPtMrdbNdweEn22PZBgYyZYHA
 dSgZvJynq2Qry/r6spsKpZZi7U++ZUizFJvkp+f4NoEzx513aAhrxH+EX+YXl1Q8+9JW
 gBtAPis+/B9KUrx0xq52vmexpalB9uVyY4bQx5bi5FXNu3cz/yfANCjoG/ed5nQ9ekrE
 j6fb227i9vefZhRYy9CdRZM1p5URmzhFUJyJpu7ZE1wHt9r1+Fay8QKH9880y/YLiXEn
 kU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kgbrwd3xCnSzpxda24wbaUe5EY+jS19PHFckVvmC3b8=;
 b=eLwb4sAZ5i0Munuay8mL/YdqyndnKdioGvhnvVbZTw59VO0iWS/MEmH4a7Fct0P7fB
 IwIXjZuRZ8z0EEU7uj/drqvnQpiTPnWJmFlfxAfBiNYHN5S+0jzbILS2JHYZrAsWsMks
 YibVE8RKdoN74vAqFWrYaJ7f0CPeidg+aGJj2b8hiccqKYRnwu6DLBz5kruTjoPAHFxW
 LdfQ+56zS01EaaHFSe3rveGNEt6PYmjBqAgrLWub3ecJ35GrEANVdCqu92W3yiwn7YqB
 odIhW9nWMth9FjmlOm5NlCzKD9K/Cv1APNwWwUvDXPiYsCfM7IueZ4yYY+wg2ocpO/zE
 w6Zg==
X-Gm-Message-State: AOAM531MVwStfka+u4FzCLk4gJ6HKMF9HS8gb1i5N2xNAUCCri+lHlGn
 BlM1gmRKkDz3eAmozeHKjJNuLgSS50I=
X-Google-Smtp-Source: ABdhPJyTskUxiySxqwjAOkp4goXiSRwrZzV0SlOmMqO5GLnW0x7BaGbq4kuv8b/l1YZFQ2swWtQIwA==
X-Received: by 2002:a5d:6e88:: with SMTP id k8mr8248892wrz.384.1643403232066; 
 Fri, 28 Jan 2022 12:53:52 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id s9sm5337243wrr.84.2022.01.28.12.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 12:53:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 21:52:00 +0100
Message-Id: <20220128205201.2798205-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/glslsandbox: kms needs gbm
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Obviously, KMS/DRM/GBM needs gbm so add a dependency on libgbm which was
added by commit 4a541ee93242e67f7fab625607f5501c6925d451:

checking for gbm... no
configure: error: Package requirements (gbm) were not met:

Package 'gbm', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/31b3fff9748300e293b4efb5615176ccce48dd15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glslsandbox-player/Config.in             | 1 +
 package/glslsandbox-player/glslsandbox-player.mk | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 3aa6049dfb..e36e8d74c8 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -70,6 +70,7 @@ choice
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
 	bool "KMS/DRM/GBM"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBDRM
 
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index c5fbf062b7..8886788587 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -37,9 +37,7 @@ GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-install-scripts
 endif
 
 ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS),y)
-# gbm dependency is not needed, as it is normally packaged with
-# libegl/libgles drivers.
-GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm
+GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm libgbm
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=kms
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-utgard
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
