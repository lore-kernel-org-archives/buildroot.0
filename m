Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACD6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D9A60F99;
	Mon,  2 May 2022 21:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0ZolQk-ZwXB; Mon,  2 May 2022 21:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C22260F90;
	Mon,  2 May 2022 21:25:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3061BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED6AA60F90
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eyUS65i1bUqy for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:25:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A40FE60F87
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:25:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b19so21002936wrh.11
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HIoRx92/GuY11hGBhjlPmcsCOVX2Xa5xOZzt5C6xu9k=;
 b=bxiYErE77n62ZoHZC8HPvAtmNdd11/VdpcuhY7lOxJROfWEW+tM04RppWzf4uL/cR2
 MTt2tRufjDlniLkj6bFUMIdjtG3cVbbUY5wYgX/Kmdy0NI0iiYn+6zdvv3gLjpGAstgi
 c/zbbwt48vJo44r0RSdRSCsEzUwJo0Rj/a93uvY80nnAAMz2s9tl8qKlNHbQUXXskcOe
 MgcebE8LAkeuUM8yWLDqu5ACLK9M99pztJL7vRzHGjJwLdgqZS+rli5RZzP8z5CdxtQG
 WZhji/Ea7Kis9Ozy5xQBdULUEiE9q437QGY1GZ7zZSMwToDpJcORGPFhpEUFQ6DPqXKV
 rVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HIoRx92/GuY11hGBhjlPmcsCOVX2Xa5xOZzt5C6xu9k=;
 b=JtgTyxZGXpyOc408WnOew0YKfzy5xdyX6gynNMcYXNCU1RZBvP4fnYE/2N64LKPOrT
 B/aLzyLq1fBpYyr+re1wOdzWU7wZxQ2BQEZHP7xBhrpR2J9QALQaxkgVlm+u4pw3pek2
 0BupfEMH0+uQRfRItSIb9/znwPD4Kg5IYO/ObxUdCREYjZnlz15kRFaWuYJJ6iB5zP+W
 ergQgkUm33RLq+ZqRdFLyVYn48M0m1KMtZTGazUtioM3FmhlSmezH3BMGbqABE4eLaaP
 7as1mx/3oquai+sncj8sbUnWxFMlNXH7VyfrOQCKruzYaNLoff1naKnBEnvDpM/1hSA9
 RmeA==
X-Gm-Message-State: AOAM530NjbWJ09vXc+/+lAa8EiJKHt3gxqTOyGrXx8WEAyAHJwEN+pD8
 Jj/kZZfwAsuWycMYYR7VpXbSXX/F614=
X-Google-Smtp-Source: ABdhPJxB2WgB9sn3XJfNxzeh2MwJFDjLekPprtlZncj6cottOlEJTHGzAV6DS+K7nZY9CometregcQ==
X-Received: by 2002:adf:c6c2:0:b0:206:e60:1eef with SMTP id
 c2-20020adfc6c2000000b002060e601eefmr10525411wrh.579.1651526731860; 
 Mon, 02 May 2022 14:25:31 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 z6-20020adfc006000000b0020c5253d8e2sm8077016wre.46.2022.05.02.14.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 14:25:31 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 23:25:18 +0200
Message-Id: <20220502212519.75249-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/qemu: rewrite
 BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET to be more readable
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the same format introduced for BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
in commit 65e05cd914c895461a65ebdf901f991585529005.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/qemu/Config.in | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 7bb203a177..1afbc6c364 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	bool
 	# Only tested on these architectures
-	default y if BR2_aarch64 || BR2_i386 || BR2_mips || BR2_mipsel \
-		|| BR2_x86_64 || BR2_arm \
-		|| BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_i386
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
+	default y if BR2_x86_64
 
 comment "QEMU requires a toolchain with wchar, threads, gcc >= 8"
 	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
