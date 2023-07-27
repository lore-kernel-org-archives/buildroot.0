Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7007AC00528
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 18:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D523405EC;
	Thu, 27 Jul 2023 18:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D523405EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdryRaZIKWTd; Thu, 27 Jul 2023 18:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53DCD40540;
	Thu, 27 Jul 2023 18:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53DCD40540
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9F901BF3D6
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 18:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE7AA60F0F
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 18:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE7AA60F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vLP5DKCU0U_M for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 18:03:14 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09D6160C11
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 18:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09D6160C11
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-345fcf8951fso4741005ab.1
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 11:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690480992; x=1691085792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MuwRd/bJL/n9CPlxnrsgebcrJ3SGryfSHzjnMSpQ304=;
 b=GN0x4UurDvFCkwyCepg4o5aw4TEZFxkTRPB1ypEZ3MKcVqxJ4cfP6jAU0BiJSPhAKb
 R7Lo2y8SCrrYJ9Ndbk43UxA/m77o55KsnCnZg74LpTYq/8dWO2EEOiY8vGkihM3IKtdY
 hAxHup6oUzLO2jT1aN10Sp38cB7tfWB/1lAUkH9Hf8zzhC9+nRYR8YipeG0aBmSQLaut
 AsRPCpFOZFLYJx6ANInXbqDw5OVOJC0Fb2/gm7kcirdb/UdTFKrWdIAri3rzJ/EaxbO0
 ET2G5/naJ0/SS1x4WlLfxG6OyKS9nycdcu32dmlnF12KW+jevaWfxuiI6tTpH4rf65jg
 0D+A==
X-Gm-Message-State: ABy/qLax2+CPM+zbmjjzcSK6teC/39ItVyiVoyzYRbSZNGmqMqK/OJpv
 QNN7X23wDvDkeeQw4ONxdZI/PRi5K6E=
X-Google-Smtp-Source: APBJJlH+Ts2dIV6PHS5o9pESRqhocsAnS2cQVA6HMfHv8UM5LQcPOXtNMFAShhq2UsjTTwIzSsXDOQ==
X-Received: by 2002:a05:6e02:1524:b0:346:6b6d:79a4 with SMTP id
 i4-20020a056e02152400b003466b6d79a4mr208053ilu.26.1690480992587; 
 Thu, 27 Jul 2023 11:03:12 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 u29-20020a02cbdd000000b0042b669f5084sm572166jaq.62.2023.07.27.11.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 11:03:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 12:03:09 -0600
Message-Id: <20230727180309.2108530-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690480992; x=1691085792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MuwRd/bJL/n9CPlxnrsgebcrJ3SGryfSHzjnMSpQ304=;
 b=EmgZ8zSNnX5XbCE1WjknG1JTUT0UYaMC9l07rDz+zRyvCbAv864naklYfE04H3O5B6
 ErVqrp1BRc3EuILzLduxPsfxjHKgedECN2bOiXKtA8RMKitSWGz3QyO4qjxoMxcilF7j
 1qFhW5hMy3PaFhD0ECX04yNgmH/4Sz+r3+e310WZmeR3vn4E9X9nQg9uAPA37Le0jQfh
 2xpewun/wBzQk/AlAmk2IucbSnqqZPjpcqSkJVx69dcRtowYU6aTdBwsuYjMFu4PKxEN
 6emm2ZNr+bM7yOi4ogWP59lFtPrpK0DInjPs82Nvd5NdCi6/BSp8n794WYEIwWiTXX6/
 ajIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=EmgZ8zSN
Subject: [Buildroot] [PATCH 1/1] package/weston: select the seatd daemon
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When we updated weston to version 12.0.1 the only supported launcher
was the libseat based launcher.

For this launcher to function correctly when used with weston we also
need to enable the seatd daemon.

Fixes:
[libseat/backend/logind.c:660] Could not get primary session for user: No data available
[libseat/libseat.c:76] Backend 'logind' failed to open seat, skipping
[libseat/libseat.c:79] No backend was able to open a seat
libseat: could not open seat

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/weston/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 22996805f6..8aabe86652 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_SEATD
+	select BR2_PACKAGE_SEATD_DAEMON
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
