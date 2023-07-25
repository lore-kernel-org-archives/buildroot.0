Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B146C001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 14:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CEEE813D0;
	Tue, 25 Jul 2023 14:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CEEE813D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiZMkFLHTN3h; Tue, 25 Jul 2023 14:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46A9381398;
	Tue, 25 Jul 2023 14:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46A9381398
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65BDC1BF588
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AE2A41827
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AE2A41827
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izVIz116nCWk for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 14:53:53 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15F4C41829
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 14:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15F4C41829
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7869bcee569so212023939f.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 07:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690296832; x=1690901632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dTlOon2a2khfLeYd1DnEhJ/993to0pKe7n7FYJ1hoJc=;
 b=RI4V8FC5wCE7OVegoJtot7OCkwwEFM4LVQYE1A6hknl5Qt+2y7ZZVxrE8fx2rSwUBD
 sZ1dE/ypeLXQIPfxVKUHuQAnNi8Sz9WaiOa+mwjyaX6bcZyPD8p7V4e3FMFg5e2QGjo1
 vGu1S1tDDpf6z3ArhUtFiM8zg825ilxnM8SFJlf6XlPIkpWXVXSnVVw7OErRI5IHeeP9
 2PSPpLrUD06J3foCPONDiHly45W7XotPI63suDknbi6g/oFnYAbz8MEsGLJ6dn+iNMPl
 Uvx8/L5Ux8fJiu9BqHfQ/i4R043ePsJld5EsAN12/Bl7kpQskyfLc0CSOjQTDqzWftXW
 Y95g==
X-Gm-Message-State: ABy/qLYO++y+8W/ai9C3FLaCokvZ+Y3RXLZrgt1Ej3Ay4dqGsGc3Ol42
 R4zlbtXp6aSng8iUtomCRRWT6gIkVBM=
X-Google-Smtp-Source: APBJJlHEnEKt4gMptLn+e44iffJjgMPHTpnRDUmfw4W9gkXkdC7RZtJiknzKH/2WveOU1m/bsqtqEQ==
X-Received: by 2002:a92:c5a8:0:b0:348:c665:fae5 with SMTP id
 r8-20020a92c5a8000000b00348c665fae5mr2954526ilt.16.1690296831768; 
 Tue, 25 Jul 2023 07:53:51 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 dy46-20020a0566381d6e00b0042b3ad1656bsm3744256jab.45.2023.07.25.07.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 07:53:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 08:53:49 -0600
Message-Id: <20230725145349.1013615-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690296832; x=1690901632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dTlOon2a2khfLeYd1DnEhJ/993to0pKe7n7FYJ1hoJc=;
 b=ljswT8Cw8kuV2qKtkrZbNX/x87ETomoRUgiQ26+5B6kHyyzF+/r5Xdk/Kr1YW5ln5B
 vI0qN5H+O4allCZUNOjfS9wKLilTsk2Bg76Lew64xQ14VMxbGSH9E3H61A9nQX6Ln2EO
 U1Gm16WibDsgyH+PEoeK1IGpk9ONtrhBqr3pxaFPp2Qhfh/jxpiydizdfMCbD2YWD1xA
 60vXW8f9XXHzHtHokjvMiULyRmxZYxwVQECGwZ5bG9Q/gsOfSxkLTK0GstfUOGZWV5Xr
 ZGgnr02Ytz1IDOQ87AzR8W9Da25Il2ZdlcOXOcf7l9wN2H53VrWy5JNbToPuSQN1yvX/
 j3bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ljswT8Cw
Subject: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.22.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wayland/wayland.hash | 6 +++---
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 1c7fe705e1..5da527e318 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-June/042268.html
-sha256  6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac  wayland-1.21.0.tar.xz
-sha512  5575216d30fdf5c63caa6bcad071e15f2a4f3acb12df776806073f65db37a50b5b5b3cc7957c5497636f4ac01893e2eaab26e453ded44b287acde01762f5fdc3  wayland-1.21.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2023-April/042647.html
+sha256  1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842  wayland-1.22.0.tar.xz
+sha512  fb1974efc8433e97254eb83fe28974198f2b4d8246418eb3d34ce657055461e0c97bc06dd52e5066ae91bbe05bac611dc49a0937ba226ac6388d5a47241efb12  wayland-1.22.0.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 0a6e5e9ec7..1a764d5580 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.21.0
+WAYLAND_VERSION = 1.22.0
 WAYLAND_SITE = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(WAYLAND_VERSION)/downloads
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
