Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B192EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 22:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6135A80C46;
	Fri, 22 Apr 2022 22:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMX6umDTUrYo; Fri, 22 Apr 2022 22:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A55AA80C20;
	Fri, 22 Apr 2022 22:00:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7EF1BF336
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B7D540AFE
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 22:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mPWdYGSnCxur for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 22:00:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DF0440141
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 22:00:25 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v12so6030857wrv.10
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 15:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WJn5Pm6Nio5/dCDB2CFKPLH4z9duVc79VhMyJ+CmATU=;
 b=bEK1b0D69xmISF90LyW2NuVav6b3e07h0ml4Iyn2uRrYrqio+fBaIRLacFsbxkAXQH
 67CpEsVPFseqbZIK4TxweOCbqlt3MF4803NenMBcZ8fPMPJXsAp6RDA/pM6VIzJKvD5j
 NcsdXXujAoV4vRYYTcV5dkR8hCOigf34ULMTagS0whd1kZYg9x8Xa5e8lSVggbiU/VIM
 +xrOw0W69CPMhvcOvUho375qhQjjR8U4oPHq23mAQSajbYIP1n1ms6K8JXqvfK12wF21
 WWUuldLJtSER4is08vGzBY8SbhBTMlWrykuMnYp/JsPbbBPfQqBluyH9ZFhC/tawC3Rd
 LBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WJn5Pm6Nio5/dCDB2CFKPLH4z9duVc79VhMyJ+CmATU=;
 b=HSGmZg4jh0ziRibztZVcsnYzqBlG10vqRjtVBnleH1vXpsTf9ZiBUF6lj4rHLRkyTi
 7Wa4fCKbnbaE4lSniC6FTCQlemdfBAwUdzfZIsOp7L5z1hqZAL9d1QmV3WdD4EQRKUOT
 M0tdlrhxTjQLxszWEuCcRFtrSZGvv/KoseOjNX+8bCwVDBGr1udVd9gQl66dRQHkJTC1
 o5N13T9vg3C1jodQYlr7m2O/lt19wVBa44FOo01u5B1U9BYimpYdiXw0Q+miUeWDRqvR
 44nEXdOEuOcXC2+6LIR9gDfIB0CLY5CQErtg7RHtaXaKr4xaQzBbOU7EXUdeKMJsDw/w
 gBPg==
X-Gm-Message-State: AOAM5309NpIXNf18Tc8XVqf6ll0862nMefCHSrijIG+QcYZmiuzvqvGa
 9hnKfCk22AFPC27WRLXkvsCeJ24s3NI=
X-Google-Smtp-Source: ABdhPJzg0fSefrXYN5e8e9nixLdC5JVoTNrY7ZgsGfw6s1+gVp8nikBkVX1iZwfnTBOaNU+MWMvvmg==
X-Received: by 2002:a5d:4307:0:b0:207:9f82:e238 with SMTP id
 h7-20020a5d4307000000b002079f82e238mr5613908wrq.430.1650664823037; 
 Fri, 22 Apr 2022 15:00:23 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a1c541b000000b003928e866d32sm5604807wmb.37.2022.04.22.15.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 15:00:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 23:58:13 +0200
Message-Id: <20220422215813.2528195-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/util-linux: lsfd needs headers >=
 3.19
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

lsfd depends on kcmp.h which is only exported since kernel 3.19 and
https://github.com/torvalds/linux/commit/3f4994cfc15f38a3159c6e3a4b3ab2e1481a6b02
resulting in the following build failure since bump to version 2.38 in
commit ee978e853a6a4c9bb5ed661c1ae704e79f155a35:

configure: error: lsfd selected, but required linux/kcmp.h header file not available

Fixes:
 - http://autobuild.buildroot.org/results/555c272fe0f966f7f46d493236cb6dabeca24d9b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/util-linux/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index d3c0070160..917f1bc2b4 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -206,10 +206,15 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 config BR2_PACKAGE_UTIL_LINUX_LSFD
 	bool "lsfd"
 	depends on BR2_USE_MMU # libsmartcols
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
 	  List file descriptors (modern replacement for lsof)
 
+comment "lsfd needs a toolchain w/ headers >= 3.19"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+
 config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
 	bool "lslogins"
 	depends on BR2_USE_MMU # libsmartcols
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
