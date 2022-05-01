Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6F0C433F5
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 07:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568C360C0D;
	Sun,  1 May 2022 07:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuHJRBGdmbyt; Sun,  1 May 2022 07:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF32E60C02;
	Sun,  1 May 2022 07:38:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6C41BF3EF
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 07:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B3564031D
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 07:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPLbKHiSfoQe for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 07:38:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C2BE400AB
 for <buildroot@buildroot.org>; Sun,  1 May 2022 07:38:48 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id s14so175256ild.6
 for <buildroot@buildroot.org>; Sun, 01 May 2022 00:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QX6LCeEpe2KUF6tB2CySy6p22BRo19QA/4esrmKV9YQ=;
 b=kSLfhnuzme/Vs2wQ2N3eIDAJVMasSY7Il5cChHgTrpmOtrJtCeMWyEW7uFJj9NxDHv
 E0yVwldJVG+Vx1KGpJkFsv2XCkuxqvgAEBmFecc7u58icbt7hP30j+AU2etoROePNelo
 eZklP3iduVTK/CUMFbZqfdjSnbPgtR6MJfxsM7AvOs1A5USXMaaRQnwN3oT9mYnkd+WX
 js/xvN9rDheceGlWSnfg0PDChaV+HyPb8H21MOypizB45QjsTZ3FjNtctURR3Z65jMAJ
 lX0WU/QYRsZMaaTmKDRhYKiFTXyl//yc4N7B+GdfVUTBIOUCZ8hGXbj2UlZuwpgA3PAf
 FxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QX6LCeEpe2KUF6tB2CySy6p22BRo19QA/4esrmKV9YQ=;
 b=Hm/L0IjWs2fT1LgXCXDkeL7UJO7wlCgeNIhBWefYnkcO82BZmB50YlEcKKJCGJ7a8k
 QHJVxMUuY+W+88IftbdFWHH8Z08lqb5pFe9cV8JJWyvvhoe8VkTKSk9dkpePY45tnmfI
 hIpOr5IdCz563sw0FkzYbrwTvi7aPmDFdPb/b5fn1j7HYJDGmoNsSbBbHxVXlQorJOG+
 IOcoYTAcBpr+y0OBVxViNI/8bNMowhVkZk6qJb+FAsExF4fX8iD6lw0R4fFgdi2ttGHu
 UU4dLaeDSI4F5K1QOzJjImpWmbd6gdN5iO8S2wx8wF3dlatIqu+EP7MuFz4MWeabo/FR
 0lVw==
X-Gm-Message-State: AOAM530QuhikSdWnVBOJKSyEzoabgwqItuOmfWARkENoVWAV8AgkP6U7
 rabf0/jtsZ7P2mr6q1SsEEXnNEFT1Cs=
X-Google-Smtp-Source: ABdhPJwPTQJDJ/o0x3H3dTyTOfBw/4aR+/Q14eiycSUZrhRFpZeMSVq24sTcb4iOHsJtnsvBhpiN6g==
X-Received: by 2002:a05:6e02:17ce:b0:2cf:134a:1fc0 with SMTP id
 z14-20020a056e0217ce00b002cf134a1fc0mr17568ilu.23.1651390727441; 
 Sun, 01 May 2022 00:38:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 a7-20020a056e02120700b002cde6e352d0sm1772494ilq.26.2022.05.01.00.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 00:38:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 May 2022 01:38:44 -0600
Message-Id: <20220501073844.317391-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: fix ext2 config
 variable
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This should have been BR2_TARGET_ROOTFS_EXT2 as the
BR2_TARGET_ROOTFS_EXT2_GEN variable is an integer variable used
to indicate the ext2/ext3/ext4 variant.

Fixes:
 - http://autobuild.buildroot.net/results/5d7/5d7833212bd8a2b575945f848d8c91dabe7d3c30

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index ab1f6f43b1..70af84f002 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -443,7 +443,7 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
         configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
 
-    if 'BR2_TARGET_ROOTFS_EXT2_GEN=y\n' in configlines and \
+    if 'BR2_TARGET_ROOTFS_EXT2=y\n' in configlines and \
        'BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n' in configlines:
         configlines.remove('BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n')
         configlines.append('BR2_TARGET_ROOTFS_EXT2_SIZE="%s"\n' % ROOTFS_SIZE)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
