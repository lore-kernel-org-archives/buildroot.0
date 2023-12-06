Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24370C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 22:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB0BA4206B;
	Wed,  6 Dec 2023 22:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB0BA4206B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXXjvX0rM4Pg; Wed,  6 Dec 2023 22:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1063042080;
	Wed,  6 Dec 2023 22:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1063042080
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C19E1BF296
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 22:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43E33400CE
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 22:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E33400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_B8W6bg1M6g for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 22:44:28 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB95E40359
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 22:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB95E40359
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-332f90a375eso293553f8f.3
 for <buildroot@buildroot.org>; Wed, 06 Dec 2023 14:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701902666; x=1702507466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SNN/Xf8nH3211ZF6qqgjNC/OQ7fh/QZwI1GxAgNG240=;
 b=l+Psur+1FdYQfiyVGnHwC5PmRRrYAjKBPDlpX6AwxorxL1uUxrrMEn9pUQY2/pWiB0
 oJixyNC7m6guWKsS2aWIQc+amHeO0YVVVL5kFH5XMeqbIeQKxDPPQXPj/81mKX4sjS3H
 TCOejNOZg9QpVWqxANXKi03TV5Y5WWK1XLzkzQPSwbS84+R4Eb5T41LMxXUkEZEWgDr2
 bXqfCbj4d+c+nwgk+PL/cj1jLssPdQRmQZ20qjHGdoBA1M5Gmtxa2L+pTAkZtYLvIAJ3
 6T9fPo1Ewwl5K85jQ30nrzKblQiDnarrSJRwnkMjOYjGCU5BF3uyJpkAbwXi4zjgt26b
 WE9A==
X-Gm-Message-State: AOJu0YwhfYPjy3SqbuSmnn6R1Td0of1R7nwc5qnivAXIY0878Am/WquB
 EedjnmK/5Ptye0YwbgmLfKD5TmcL1kd5T0L0isk=
X-Google-Smtp-Source: AGHT+IGrW1w0htqSctAGr+/xlAwH7bwU+XZ+TpoU+iQ11qSczui4678V64Ez4mYQZhp/S5kgbEMZPA==
X-Received: by 2002:adf:ed03:0:b0:333:2fd2:51fb with SMTP id
 a3-20020adfed03000000b003332fd251fbmr909567wro.116.1701902665735; 
 Wed, 06 Dec 2023 14:44:25 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a05600018c600b00334b1564f0esm668567wrq.89.2023.12.06.14.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 14:44:25 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  6 Dec 2023 23:44:22 +0100
Message-ID: <20231206224422.16063-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206224422.16063-1-romain.naour@smile.fr>
References: <20231206224422.16063-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1701902666; x=1702507466;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SNN/Xf8nH3211ZF6qqgjNC/OQ7fh/QZwI1GxAgNG240=;
 b=msEzfRxH34wGrQJXE4An129TKaBZGFKO3gkr0FYQa6N9fDkTaMgzqiUQSsGhkABm6f
 2MthpEK58Qnoo2tmsthU0AsfWhhBbWCB2qWvgndExE47eAgZCPJ250os4AkGUHsdwzXP
 ehaAX6E51+/foSA6BrhCgreCYPjEPL8BeyjOvrQ9tGxYVUwX7fw+wbu47orEV0FI4bZr
 JRgststMrGoHFmr5DiC+KNlegDcY3iVuP0JRWvsuW1rN63mxSh69kV3k6IyVJsLikpCf
 EqLukoaYS3VCQtBXx5aDplh1JDwLjt/CPTnKxkx8H2De3BEJ8I5qP+2m6gayILyJvju/
 bQFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=msEzfRxH
Subject: [Buildroot] [PATCH 3/3] support/testing: TestDtbocfg: bump kernel
 to 5.10.202
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The prebuilt kernel has been updated to 5.10.202, sync the kernel
built by TestDtbocfg.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_dtbocfg.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_dtbocfg.py b/support/testing/tests/package/test_dtbocfg.py
index d25b1692b4..56a1ed4820 100644
--- a/support/testing/tests/package/test_dtbocfg.py
+++ b/support/testing/tests/package/test_dtbocfg.py
@@ -8,7 +8,7 @@ class TestDtbocfg(infra.basetest.BRTest):
         """
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_PACKAGE_DTBOCFG=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
