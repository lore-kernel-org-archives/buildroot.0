Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE0CC77B60
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 23:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ED4A84300;
	Fri, 28 Apr 2023 23:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ED4A84300
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsbRvykfomtD; Fri, 28 Apr 2023 23:06:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6479884334;
	Fri, 28 Apr 2023 23:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6479884334
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11BDC1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 23:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCCFB6167D
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 23:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCCFB6167D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJwAc4AaBMQO for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 23:06:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3277A6154B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3277A6154B
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 23:06:25 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so2209165e9.3
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 16:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682723183; x=1685315183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uaZ4xojZBjEZ84sYu1ttVV+0dX0mCZmnQDbnxU79x6I=;
 b=MrDZCkdTM2lZ7lkQVH8rdSZZAE5NfPucrm4gCNN5YnUO8vjJ3TcvWULmt1nUVUvlGp
 lOus+VCCYY2il8OwpE8d/+ddoDwazHBN6S69TxPKnpC1vr0XO2VrQovbNy2RiSj/YguT
 CvMi6RPN8vAZlVkIHwBWcNC21KfhtYfw8QtnSFVhyLepQAbRRE4N2BrPTB1b04i1/0Q5
 hA1nBIwkE84EHpBb04isG5qoER5ObuBOBtmD8BjTl/8EgL5SnfbOsEIQ14pxYY8rWWmJ
 UsAZy4eK9fQDuscjpXbxJwzIVr5Z383PsDizAsqKQkzpkG0gKDI2CyO+HiEZ7MsOAR05
 mWJQ==
X-Gm-Message-State: AC+VfDxeXklqK0Q6/fQ49O/bklJuTMzTBIYa9UeiqUH/NpN0kaHHD6fp
 St+C7N9dQvgMJDuMMgO/XyvSMPIOMvw=
X-Google-Smtp-Source: ACHHUZ53/mZwTnol324FNKG4CzmLUwwJwTnsRKgqQCMMEvHNCG/smon0kwGUQsfteOtvzRAp/V2GAw==
X-Received: by 2002:a05:6000:136e:b0:2f6:c7af:945c with SMTP id
 q14-20020a056000136e00b002f6c7af945cmr5297918wrz.31.1682723183266; 
 Fri, 28 Apr 2023 16:06:23 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 n16-20020adfe350000000b002c71b4d476asm22146330wrj.106.2023.04.28.16.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 16:06:22 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 01:06:17 +0200
Message-Id: <20230428230618.261911-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682723183; x=1685315183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uaZ4xojZBjEZ84sYu1ttVV+0dX0mCZmnQDbnxU79x6I=;
 b=OWqlra5sCOW1ZlJphxnbpzNE21IBXqYNa/jOOMwOCZS25HFZlh//y5quMALtdMukCM
 I//qv+lXBg26qUVGvCe9LI9dc+TsOS9UuEa+Kui6ngUyCj4HmbWA98zBGPqF65K07jdb
 YUbu+uqN8n/hKyVh6UmTwsu8o2HWIoDDHtX5LZSo2jH1txaYNXQ5d4Y8Gn5EH6P7zwIE
 mLiuC4t5HZEbvzKLL6X3iaViwf+PK11eHOcQ3zpw9zCXZl6seJgbGYWwlS57acT2g8VF
 hKCmsYxm0iemplAa/TzlikEx+XrHi+zd0q2R+pTy3jBf4IgfFkKPWqpV3wRg1i1wiOSV
 J1Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=OWqlra5s
Subject: [Buildroot] [PATCH] Config.in.legacy: add missing binutils 2.36.x
 entry
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

Commit [1] removed binutils 2.36.1 but forgot to add the legacy
entry.

[1] d08639e6b9e5b687c21c35041bb60a941fc7edb4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 Config.in.legacy | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 53649cd3da..7f72594ddc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -341,6 +341,12 @@ config BR2_PACKAGE_USBREDIR_SERVER
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_BINUTILS_VERSION_2_36_X
+	bool "binutils 2.36.x has been removed"
+	select BR2_LEGACY
+	help
+	  binutils 2.36 has been removed, use a newer version.
+
 config BR2_PACKAGE_RABBITMQ_SERVER
 	bool "rabbitmq-server removed"
 	select BR2_LEGACY
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
