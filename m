Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3FCC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 01:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AECF60EF8;
	Wed,  8 Dec 2021 01:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIk56rNnM3DV; Wed,  8 Dec 2021 01:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D07BD60EF6;
	Wed,  8 Dec 2021 01:08:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 214741BF3ED
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 01:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EFC44013E
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 01:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qEvBD6CiQkAS for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 01:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58961400C7
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 01:08:19 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so3181598pju.3
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 17:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2rqyWx3uizV4nADQTVhN7nSkLXsmKh5ZekTuZXNi1j8=;
 b=Obrl8xboM6AdA1HyaxZK1ZjtvPIE3Kp7rI8J8OQw6d+0tm96WVLcmpHKyTdONSRDrm
 XRp9T3mcfkHMzhjuWFCqkDb/vZB4/4EC/I4CNB2ZVJD5JytEJRLJB95JthPXwMZ/XVKu
 XkBzZaHhVTy0gGicDobZFvLRwsQWi+B1wD5PlN05QEW2oN1WZCZCwxf+EqvDmsnNCg2B
 3w3ztLVsbmij/Ot4oPM+alRej91YIN0K4sUvbmPdZPCIzzHSSUOxvI4oNGDRH8SSmfMw
 qQsjGQfNRqMafFG72DJ+9RRwtPD1aKVk/i8KZtwbBQPgeA1vL+9fUFS2lUPrgsDQZDPI
 Q2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2rqyWx3uizV4nADQTVhN7nSkLXsmKh5ZekTuZXNi1j8=;
 b=Fisw/ipAhdJ7SHFur85I6dhtOdcvFX+3WIg/BPhhu5hALWxe86RZs3X6nLTBsbtgbK
 sDI5e2r54+VFhw6EmuBXUlq4aC/HMNfT8AC1oCTJwS3ArRoJd6JY4uhD6c+PjJqJ+p7U
 R5l1ahK1laxNdlk2iSFhfyCWCVWVibkf7dZYQfhanikp7izi1q/0kMlA5VEXpHHsJs9z
 npcJgSavlhvEHpyHxgeSNwOvxyo2XbdiRx25ePBHCCqdmLZrd4NQDzpQRFOQDyEGg9io
 6kittct8ODe0Zfub+sc1MsYAnm8gwTn4fGPou2P2kkhmMImKL9bejWj5oKWr2ecu9guE
 pjbg==
X-Gm-Message-State: AOAM533SaPsCAfnFYy3lC+tLvqYFt9g5IDMQTVjJ2qAjADrWmqUJrmT5
 4a1yKhBQdRsXTUv3X84o6Jry3bAsVz8lLw==
X-Google-Smtp-Source: ABdhPJyI0ZQZEXX+ZKRpOsoaTj+451kbiEkAy89TNJjlDl7QAD7kvTVxnsF9V/erJXdJq9s1zcR5Wg==
X-Received: by 2002:a17:902:db12:b0:142:3ac:7ec3 with SMTP id
 m18-20020a170902db1200b0014203ac7ec3mr55048241plx.2.1638925698569; 
 Tue, 07 Dec 2021 17:08:18 -0800 (PST)
Received: from adam-workstation.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id m13sm664421pgt.22.2021.12.07.17.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 17:08:18 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 17:08:15 -0800
Message-Id: <20211208010816.3186969-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/polkit: enable selinux policykit
 module for refpolicy
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?= <alejandro.gonzalez.correo@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for polkit to work with SELinux.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/polkit/polkit.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index a8b91d21bc..a7ab725c81 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -14,6 +14,8 @@ POLKIT_INSTALL_STAGING = YES
 POLKIT_DEPENDENCIES = \
 	duktape libglib2 host-intltool expat $(TARGET_NLS_DEPENDENCIES)
 
+POLKIT_SELINUX_MODULES = policykit
+
 POLKIT_LDFLAGS = $(TARGET_NLS_LIBS)
 
 POLKIT_CONF_OPTS = \
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
