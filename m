Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6705C433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 21:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 670F841272;
	Thu, 26 May 2022 21:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QoOOt3k3c1MM; Thu, 26 May 2022 21:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8885141270;
	Thu, 26 May 2022 21:34:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DCF31BF30E
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 21:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF8F941271
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 21:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3AkVjyuwbDlG for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 21:34:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 294294126F
 for <buildroot@buildroot.org>; Thu, 26 May 2022 21:34:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id p10so3593369wrg.12
 for <buildroot@buildroot.org>; Thu, 26 May 2022 14:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UbRL3D6V2QUWhzTJ1MjQwt4mnFsXuoZ0E0a5IGCUfrs=;
 b=SB4sAwNugvVXdEMryAi6OPrvEJSkAQbV1MLCZ+rHT656gLPdWi2Ge47jk1GOdCZAIM
 Ay5r1+vUA6ef23GQWmZM88iixdwXqMoyMGEyEvCVzKINrm2lILTAz8ZjlC8eEuV8R3sG
 rkmOLP2WnypdpdzZsMi+nPvaA4+u4CUYZU8bwFGKFcaoyZbNP5kr1nEt8frifgkM3bOI
 w1QjwLznBvOXt/Oq3IhDKwqbwo8/r/pdqpH0K3I/LbSUI5zgEATRj1Zst11E8Eb0qPcg
 ZM0yu7Nm76T4neQGvmIeurqIqX8U+2T7O2ec2iHMx8nXlhBtAXkIYBXs3DHwvrPTssb+
 jPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UbRL3D6V2QUWhzTJ1MjQwt4mnFsXuoZ0E0a5IGCUfrs=;
 b=x4V/zT5e3g1clZCJImtVv6OEQr8oMSblNOHSZ6+Mbi5Q2satOFYy5cUq2ceQkGhbxx
 7rQF/wzTTJQxnCjf8IHVmKIVPGa1YVo0/7kwzE5G7UT4WPJ8glNr0dfdv8u8su3hiioo
 IhJuGSGcvsVFBlwzoZpbIjYRNEutmCNBMlTzv7PNTHnYa63xYRQ+94dOhOkQJZ6LXZj3
 1fbHAx9kbaJFVNDybQpvzHuaj3yd/yvqHgMd1/wSrgOsqG3njfqFBLoRw0/9JpfHEENI
 kUhyPZIkppMPvxnw30UB81NHL7gD4Dne/DCOhddLewJl2q6UQzGiCnVJdSPg9beKpGC0
 ptmQ==
X-Gm-Message-State: AOAM533DWbdwG0ioTxyGFI3viBkf9NIwAj25Gb2CsOedFNMGamRXCQs0
 JFe+bLXSVgs5oXEPzYLIVBzsgUIfdlw=
X-Google-Smtp-Source: ABdhPJx3Luelp5aoNT4PdOd8xa0/8MDnZxkOL9YOrUXQ8D8Awf9U2htmkUiNRyzpZXHFjVGyO53mrw==
X-Received: by 2002:adf:d183:0:b0:210:132:1afb with SMTP id
 v3-20020adfd183000000b0021001321afbmr7595903wrc.556.1653600849266; 
 Thu, 26 May 2022 14:34:09 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 n186-20020a1c27c3000000b00397071b10dfsm304689wmn.10.2022.05.26.14.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:34:08 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 23:34:06 +0200
Message-Id: <20220526213406.384405-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/qemu_arm_vexpress_tz_defconfig:
 optee-os needs dtc compiler
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

optee-os 3.17.0 need host-dtc package to compile the devicetree
added by the commit [1].

[1] https://github.com/OP-TEE/optee_os/commit/3e03eb38ae68be06f43432d8034b69b7b3bd7ff6

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/2510255578

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>
---
 configs/qemu_arm_vexpress_tz_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index def11721ae..f8956f1c05 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -38,6 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
 
 # OP-TEE components
 BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
 BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
 BR2_PACKAGE_OPTEE_BENCHMARK=y
 BR2_PACKAGE_OPTEE_EXAMPLES=y
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
