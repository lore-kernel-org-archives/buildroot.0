Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5B5EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 22:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4072242004;
	Thu, 27 Jul 2023 22:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4072242004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TV8EDwzjnb5e; Thu, 27 Jul 2023 22:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC37C42016;
	Thu, 27 Jul 2023 22:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC37C42016
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1381BF98E
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4387C60EE9
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4387C60EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijih4BM2N1JW for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 22:25:54 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BC8960EC2
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BC8960EC2
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbc54cab6fso15141275e9.0
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 15:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690496752; x=1691101552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qoWyYc3zxIzBunBXGE4rLugpg9iMAyQ49Mz0SmwN9Us=;
 b=BWES8xGDgecEstcSZuJAFn+jFn1zi7FhBunfYbW6E3rEgwOyuzkRshnLHe17ztRKvU
 GK4QbKSXMZrZifAspOM99V8zzLe7Hcl5gFCbAKvPuUSAKzrrC1RSnSYsA9H4jPDyylSW
 WtjTBZbQ3rbjszt7Oad3Qt2Si/MyswQ+aS4sCsqk1hlINRtecTaVL3gcZs+IyxBRTQ3c
 E0f5nr9wrAg3GIM1Kmle3ofaOL4TWeDfApXVm9QKBQJ3dYw0XJ3HYeber5nwB4KeItYN
 npd1yiJOmp7prWK8ou6g10zGcGVEZZCh7vUC+dtTG/ZRXEKY8Vv2m25tVdfcpcE9NM0T
 Oqgw==
X-Gm-Message-State: ABy/qLZ74rrT++yCWWH/NUxhOOn+Su03j5pNLGOHPxrUUjNB6DxiYiUe
 XhvhqtTQRTADdYMkbi1PmqJbltAtOjM=
X-Google-Smtp-Source: APBJJlGFLOJedP0wBdTS5z+Rc/0UqorhxoYVoNODuiJAt6411FnO4cOMHMBTiauk0VFf5w3UvvIChQ==
X-Received: by 2002:a1c:f70a:0:b0:3fc:1bd:95a6 with SMTP id
 v10-20020a1cf70a000000b003fc01bd95a6mr244352wmh.31.1690496751904; 
 Thu, 27 Jul 2023 15:25:51 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a5d5112000000b00313e59cb371sm3218163wrt.12.2023.07.27.15.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:25:51 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 00:25:43 +0200
Message-ID: <20230727222544.196562-7-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727222544.196562-1-romain.naour@gmail.com>
References: <20230727222544.196562-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690496752; x=1691101552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qoWyYc3zxIzBunBXGE4rLugpg9iMAyQ49Mz0SmwN9Us=;
 b=rx15HGaTbFSWQAwK0DpjgVjbLZ6ptT9honDhxiq0jONv6dPRtky1MX2E9tcQl9JHij
 FqXnY5f0deXQKHIdJhGdLI9YdypCt4L5ULkupcvjkqj/CNXNm8vkNrBMHZFDJbB/gY+m
 JD33gnGeJEh2wGEGpveOrBvY3oxGI4OtHTm4XBEjQT+F8c4CyKy3fUPWN4jve4wHOWBA
 HE64oXEFaHWRZRBkgCZte3hErBqsVfSU4Vzo+fCFXkig5OSpfpp7UiF/o/voeBPcVa6N
 ur/cX9V4CHI9uH4aOinz2enJNaoMsfPG8L+i8xZgPzh2pR8PbyI3Q9AlWEbRmUt6dNIT
 7S1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rx15HGaT
Subject: [Buildroot] [PATCH v2 7/8] arch/sparc: disable internal toolchain
 backend for sparc
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

Since gcc 11 [1] the sparc architecture is disabled since
it produce a non working image. Buildroot now provide gcc
13.x, 12.x and 11.x and we are going to remove gcc 10
that was the last working release (thanks to a local patch).

We have to disable the internal toolchain backend for sparc
before removing gcc 10. While at it, remove !BR2_sparc
dependency for gcc 11.x, 12.x and 13.x.

[1] 2ab88dac293aed5adf2504e8b182f9d8a306b935

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: disable disable internal toolchain backend for sparc
---
 arch/Config.in             |  5 +++++
 package/gcc/Config.in.host | 12 ------------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index db0d839c79..e37f4dab1d 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -216,6 +216,11 @@ config BR2_sh
 config BR2_sparc
 	bool "SPARC"
 	select BR2_USE_MMU
+	# uClibc-ng broken on sparc due to recent gcc changes
+	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
+	# gcc <= 10.x has been removed from Buildroot.
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC
 	  instruction set architecture (ISA) developed by Sun
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bf2ecbde65..e84ab84f23 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -38,10 +38,6 @@ config BR2_GCC_VERSION_11_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-	# uClibc-ng broken on sparc due to recent gcc changes
-	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
-	depends on !BR2_sparc
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
@@ -52,10 +48,6 @@ config BR2_GCC_VERSION_12_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-	# uClibc-ng broken on sparc due to recent gcc changes
-	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
-	depends on !BR2_sparc
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
@@ -65,10 +57,6 @@ config BR2_GCC_VERSION_13_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-	# uClibc-ng broken on sparc due to recent gcc changes
-	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
-	depends on !BR2_sparc
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
