Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9829C77B75
	for <buildroot@archiver.kernel.org>; Tue, 18 Apr 2023 19:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B0F183C27;
	Tue, 18 Apr 2023 19:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B0F183C27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddj8W5b51Y_q; Tue, 18 Apr 2023 19:19:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D20683C21;
	Tue, 18 Apr 2023 19:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D20683C21
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B01421C41B3
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 19:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89F3983C21
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 19:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89F3983C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjRPxrLJguTG for <buildroot@lists.busybox.net>;
 Tue, 18 Apr 2023 19:19:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 414B983C19
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 414B983C19
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 19:19:33 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4ec81245ae1so2466213e87.0
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 12:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681845570; x=1684437570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6FiriOA62IHIrji9xbfIw8eeNu4bFtqXUb7HtD5fTmQ=;
 b=WIraRftZOV9g/GD5TL3ytUq43JSWS0heesm86T2u1cF/eEI37r9XEBT0m3Jr/jq0t+
 6jRHb6cAUxDdLUGMcB4uIT9NP4Zm5lsVlHItFoe4eGkPdKUF7y1YJl8+EAZM5bOax4QQ
 D2TNv0O3FsT2Tx01lG7VNzmZFu/HLYjHS9X8CbDNbNCyfSdfIgcPSDJI3FwA3dhjIUrD
 ZD414yEY4kNdAQVojZWQTN6N9x6/27LqZWZozgsYYP1+69Y2+9dYZqDiiUgIM3soUMLz
 a413dQIZGzYODthzK26AaL/3NUDXvHfEjAV9zGC+Hae05iRImhDOy+NbT6QwgY5yWKVF
 shOQ==
X-Gm-Message-State: AAQBX9dk2SJtT9oFRVXI9DYpmTwGzi4nLJe3WAF7JReja1m8ww/yuQ3a
 4F4V0QdNzgksq4qO0C/i5t/9DF+xGSHefQ==
X-Google-Smtp-Source: AKy350bRYzPgL5ddg6Nt0qwespIcpGdvGEUS299JFDPRfGPJH87lcT1YQHHOWjx/MsO5RjPQBOup7A==
X-Received: by 2002:ac2:5a50:0:b0:4b3:d6e1:26bb with SMTP id
 r16-20020ac25a50000000b004b3d6e126bbmr2933943lfn.29.1681845570233; 
 Tue, 18 Apr 2023 12:19:30 -0700 (PDT)
Received: from localhost.localdomain ([80.211.22.60])
 by smtp.googlemail.com with ESMTPSA id
 u18-20020a2e8552000000b002a8c7c5d64dsm946258ljj.1.2023.04.18.12.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 12:19:29 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Apr 2023 22:19:23 +0300
Message-Id: <20230418191923.1113413-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681845570; x=1684437570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6FiriOA62IHIrji9xbfIw8eeNu4bFtqXUb7HtD5fTmQ=;
 b=I3hvIjermVFwO83vpikyCFTDHAHGxQuz+zuJQzm0Gh/wxQ2lbyb0AGx1FgugjBtd6s
 RivQqrLLD3vufg4awiqCnMnJtDo7fyM6h7AzzaRjKqQgM/E7c53woKVwYj/AS8qhVQ+z
 NFEBHZYL7LIfPmSU1LJUoU57odDER+SakPQeEMKtcPZzn6EGRJgqKAtEB7zcQHDckm2E
 Vxg1UH6RG2+z4LIqUmWHyMED4h1Aj9N7ljewRLDja8uJPR4qDGg0itwgGkkvAHcK4aTB
 nNheBl2zDR0FrIcA9gcos3v7VYWJRmVBgiBfIKzHcKkxuT8mJRT86vgLxVKq/ADe/zP3
 VFVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=I3hvIjer
Subject: [Buildroot] [PATCH 1/1] package/cmake: add support for riscv
 architecture
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package binaries can be successfully built for and then executed on
RISC-V platforms including RV32 and RV64 variants. Tested in QEMU.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/cmake/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 3c47fdcb49..4ef5612b57 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 		BR2_mipsel    || BR2_mips64el    || BR2_powerpc  || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc    || \
 		BR2_i386      || BR2_x86_64      || BR2_xtensa   || \
-		BR2_s390x
+		BR2_s390x     || BR2_riscv
 
 config BR2_PACKAGE_CMAKE
 	bool
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
