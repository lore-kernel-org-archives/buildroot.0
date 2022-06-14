Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D23C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 17:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31484186A;
	Tue, 14 Jun 2022 17:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nkdcgh_MIio8; Tue, 14 Jun 2022 17:10:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F5F0417EF;
	Tue, 14 Jun 2022 17:10:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11D9B1BF23C
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DD2D417EF
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M_kwIWQjoAcq for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 17:10:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F34241684
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 17:10:30 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b8so12529529edj.11
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 10:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aHo29Y4Ad6pox6QI0CzpXsaSDbObjWqfEm8aql/6JRA=;
 b=KuppRzpLldFWTmdtLBxpZD8QQbZFDi+FEs+VYVAe0c87bQihXPsTwguhCQFhf2haMJ
 i5GM6A0h9cOrzhrYboD7FAujQsRYBpx0uQA62WzoNU/YLgD/BzngvHLRUz89eA55GHPc
 +xIHyvogB1BjJ/fbCjWqcjztdtLVoAZ852kldUOtpLdcfxmU2+vVzmXuKlkUUFZEVN2k
 o4Y1UPFS36S7KwFpdKtJ0GdoAZ3H2Z5bWxnb9dyELvOLdEfadzr7ofA6D8PIuu574H1I
 JrjvUbIGM2XzLEO82Zz8VTx+3JzBJLyxzW7OkmGmRsQvRK1lzF3Uv+QK8K7L31z57Gcd
 oO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aHo29Y4Ad6pox6QI0CzpXsaSDbObjWqfEm8aql/6JRA=;
 b=Wz7iuNmhib3ZE+yQoDLOd8FtT+4X9PNyum6zbr/3PQKb0VFu2NmOHGl58h4VeZ4sxo
 JEazy0jdh007TcqGU0lYPZJQqTDjXpYENHB4HrKEnYGsD123RjpzIpNbXENQ8hbS5dM+
 P5VkLiQ/A3wBmWsfXdiKxDufbNcvCRsnDlF9EIjhcR4E+qQvrf99qZHZxmHa6w9mDUS0
 QUWqfVbqgMiRAtv68IVoVPQ5owdCGIe8Eh8M+RtvaZEIbhn8M+HJi36qcOnFmMPDI7u1
 C3suYX6THnZ+PwuO5GW8ocK2aPqp8ENqij5S7aGIoZq+9Xjedlwb+ObR/7PXFau8lmV8
 2smQ==
X-Gm-Message-State: AOAM532ktiRngq6kuJnd+DsPKsyxme5DY3r2gKWgb1WGxFxe01RDoyZK
 Pk0mofUanzEvHTVaNcL3dEhIAp8bkUbHyg==
X-Google-Smtp-Source: ABdhPJw0aXlqmQzAZekwtczqAPWaXcJEU9zC2WK4cAduZJaG07HQMEZh+TSuRF/5mLeGPALLTlAqYw==
X-Received: by 2002:a05:6402:1f0e:b0:42d:e38a:51f7 with SMTP id
 b14-20020a0564021f0e00b0042de38a51f7mr7573341edb.68.1655226628767; 
 Tue, 14 Jun 2022 10:10:28 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 n2-20020a17090695c200b006fe99b66198sm5234975ejy.60.2022.06.14.10.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 10:10:28 -0700 (PDT)
From: Ben Hutchings <ben.hutchings@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 19:10:15 +0200
Message-Id: <20220614171015.878311-1-ben.hutchings@mind.be>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/uclibc: Prevent config with unsupported
 RISC-V float ABI
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
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uClibc currently supports RISC-V with a soft-float or 64-bit
hard-float ABI, but not 32-bit hard-float.  Selecting
BR2_RISCV_ABI_LP64F results in a build failure:

./include/sys/asm.h:42:4: error: #error unsupported FLEN
   42 | #  error unsupported FLEN
      |    ^~~~~

Change the conditions for BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
accordingly.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 754c3ea014..221aa18a80 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
 	default y if BR2_mips64el
 	default y if BR2_or1k
 	default y if BR2_powerpc
-	default y if BR2_RISCV_64
+	default y if BR2_RISCV_64 && !BR2_RISCV_ABI_LP64F
 	default y if BR2_sh4
 	default y if BR2_sh4eb
 	default y if BR2_sparc
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
