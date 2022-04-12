Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB715C433FE
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 20:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 614BC60E95;
	Tue, 12 Apr 2022 20:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZOYkj2qfpjPb; Tue, 12 Apr 2022 20:50:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EBE560EF9;
	Tue, 12 Apr 2022 20:50:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D7521BF346
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 20:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D3FC410E9
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 20:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pETaYKo8hkPZ for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 20:50:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09A9C40923
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 20:50:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso2667077wma.0
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 13:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PIFWljaCLwzvANRWPLfgsKY62arSUF8KGxSahjs1Vpw=;
 b=HGrNAG2ytT9nVle36x4SvIhf89cNOGNzyjUdLqb7fNW1J2bvw4gopE5CF+t7Hd6+Eu
 O+oIsvvCn2oOFpmaMOvM2eLY4Lg3j3Fj4MoQ7C8YWus6JmFpnxg8uxgYdl29RG2LilSo
 qfu/V1T5VMgTHTbZ2Wnsid4+QeL2UtUKZ2ln85w8K7EBYz8gfQjOgtRet2camwwzHGNR
 oDStvATedOt/ZjPV9PS87TA0sCPkcHP88QQlKT6VhcEVEkp1BsfX/i1RUmvEYK29K6Nt
 pjRK75CiV2TMjxL6CCW1+mooo8I3fsrI8CDwdjG6kCMuYo3q0fhNBqJ8jcgu0Q7l2Rfi
 ov9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PIFWljaCLwzvANRWPLfgsKY62arSUF8KGxSahjs1Vpw=;
 b=X++bKBiev4OIJ4atno4ERNV6EfQCYMeIlj8/mQBBTO4Moixo6T92marel1J9QldvIn
 DGYEdE75yC+ns6Lbc9cWt4Qa7yrcwGaFStHB5YFBpcQRAkms/C5vv4g6DnyU/WDClz73
 BqDboE39+49+dq/aWSW1HswKawX8UMRZomjnezTJewpaGoNsQY78e3Wp8/iyuPKuXyIH
 a0tfphe+2KMqA7DqPzgBOm/V9X7KGJFhHcqXn+V/wFHZdhBfbIYHU5NlsLTySzwAskJj
 7BMwj8WNSm/khKwz0Z0SDtEdTaZA8xtfPO2/+ki5WlUcD9THIbAMGu5iKzg+6uWV0PuI
 KmMQ==
X-Gm-Message-State: AOAM530Tyr5VaG4NNbYlR9C9XMd0wr+ah8vSCru330AKl2qPM7xU1cZL
 tPdcfdBPDq2oXuWy2K2QxszkDdqOj5Q=
X-Google-Smtp-Source: ABdhPJw8ZVmVFaJ7D+u5BvQ6+jNXM38exeEGL+jnHV0i1JKtTPsVt1B0sgIts1oicKL3yNg0BOwZAA==
X-Received: by 2002:a7b:c0d5:0:b0:38e:ca29:f40 with SMTP id
 s21-20020a7bc0d5000000b0038eca290f40mr3958015wmh.205.1649796641899; 
 Tue, 12 Apr 2022 13:50:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a7bc104000000b0038eba17a797sm433832wmi.31.2022.04.12.13.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 13:50:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 22:48:44 +0200
Message-Id: <20220412204844.24228-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bpftool: needs __sync_*_4 intrisics
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bpftool needs __sync_*_4 intrisics since its addition in commit
3675131e6c654d7536a184db0184fde7a97040e0 and
https://github.com/libbpf/libbpf/commit/b0c3d7133faa55fbcbc19f76f9cc9e183e178c97:

/nvmedata/autobuild/instance-26/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-26/output-1/build/bpftool-v6.7.0/src/libbpf/libbpf.a(libbpf.o): in function `bpf_program__attach_kprobe_opts':
libbpf.c:(.text+0xff88): undefined reference to `__sync_fetch_and_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/919b8351d3783ca30a860df87ae814d5c4b9fd41

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bpftool/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index a1ef3843e6..461be9e5b4 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 config BR2_PACKAGE_BPFTOOL
 	bool "bpftool"
 	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils, elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
@@ -24,6 +25,7 @@ config BR2_PACKAGE_BPFTOOL
 
 comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
 	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
