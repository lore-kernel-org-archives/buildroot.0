Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9AFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 16:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE73813DB;
	Sun,  2 Jan 2022 16:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6Uoojr02EQd; Sun,  2 Jan 2022 16:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBFCF813D0;
	Sun,  2 Jan 2022 16:55:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6CF1BF3FC
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 16:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75BF4813D0
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 16:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EvI0F6Fy-llG for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 16:54:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB21A813C4
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 16:54:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k18so28939365wrg.11
 for <buildroot@buildroot.org>; Sun, 02 Jan 2022 08:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xalovlNbSY4ispK+mqdIpX4ciowY9xzYQBJO8QvHPmo=;
 b=MDOOiL+9sp+Gg3O9z3AkR1Pih+4dx4xxabw/79aErkurffqmXJaD9mYAvZBAGNmWAs
 z0o7V87p75xcCsxH90NgL6X/9nGVNpu2/u7ulpDd+kbZ7zRG0+zJGvD0ikOY0Pk5aYQ4
 yW009u6RgZXoosTJ3UgrJPyG1B2R+D6LImX1vsy7qm63nyFHw+a/QB0G93OifSTkgsf5
 eKd3ECpjIS2aPajwQm4NHvqVwf2UWqdDw5jIp4x1unVXUy+LsF9ybDzRdgQG5SyoXkl0
 iXbtcp0u9Cmow9j8+fx2DWS4HMbpcUvbT9/nCc0UxHFDKetiMZ66YH/XsQpLf3Gg4ivr
 7NzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xalovlNbSY4ispK+mqdIpX4ciowY9xzYQBJO8QvHPmo=;
 b=P92hiL9DWru0j3Hv3cW86pzfCEF9OmMILxaBDd26a/cmuTnyjMpDYB/PuwQp14wei+
 W5qgy8TovV1d8ap+AiPdF/BPoXA+Yo03Eu4kimatIR+bHD03Qh2i3HIWEfQ0YqdxU9aC
 APWREwbLzZoZmwLw45faeInVQ4LSZmgW7RuwGK7Tso5C0FaEG8hFVGpWLfXXyP+bxm9J
 eqUyX2g/fSiCqxidmxRH2Ti0lYCnuXd2Mo1qld8AufZYqpFFjewDPaxX1CUtKDOjHyBi
 2hba/IXY325g7KurXtMXbmF2dULttcZSCnspQyAnMIyVfgSGpbkuKi5Ekz5HvSDRJSut
 2kYQ==
X-Gm-Message-State: AOAM531x6c0jYNGeVrVO9UlryvEUC3XAPc3kTu7fZasKiFdK4/+SSon2
 sDpVZQWE3TJGR6/UyrgvT2dRZ63ShlM=
X-Google-Smtp-Source: ABdhPJwbt8qibHQUTGwdqz0ZxM9qV9ZWVIO3GWdg0cQDT+V+yNYfV++6ejXLLSTTJiZR/7povyAKew==
X-Received: by 2002:a05:6000:1ac9:: with SMTP id
 i9mr34934330wry.531.1641142496126; 
 Sun, 02 Jan 2022 08:54:56 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id c8sm32298946wrp.40.2022.01.02.08.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 08:54:55 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 17:54:31 +0100
Message-Id: <20220102165431.3551867-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/qemu/aarch64-sbsa: use
 partition-type-uuid for genimage-15
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Genimage 15 restricted the partition-type option to mbr and hybrid
partition-table-type and now prints a warning when it is used [1]:

ERROR: hdimage(disk.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type

[1] https://github.com/pengutronix/genimage/commit/1d72d8091f83790a0a35a1ea7dc25d46adba8876

Sync the genimage.cfg with the one used for aarch64_efi_defconfig

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717179
https://gitlab.com/buildroot.org/buildroot/-/jobs/1921792262

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 board/qemu/aarch64-sbsa/genimage.cfg | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
index 121ae9f37b..bdf8a89d75 100644
--- a/board/qemu/aarch64-sbsa/genimage.cfg
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -18,12 +18,14 @@ image disk.img {
 	}
 
 	partition boot {
-		partition-type = 0xEF
 		image = "efi-part.vfat"
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		offset = 32K
+		bootable = true
 	}
 
 	partition root {
-		partition-type = 0x83
+		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
 		image = "rootfs.ext2"
 	}
 }
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
