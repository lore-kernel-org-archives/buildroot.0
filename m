Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6548FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 20:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6EFA4194E;
	Wed, 15 Jun 2022 20:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SVRLzyhkkBp4; Wed, 15 Jun 2022 20:19:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C593A410CF;
	Wed, 15 Jun 2022 20:19:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 778401BF356
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 20:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7408C40B14
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 20:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRQ9Mf5imDmV for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 20:19:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85358404B2
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 20:19:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h5so16858277wrb.0
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 13:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ukr0oQ/H7erZ4f0WnmGTNfHPAZm7xY+215mHfdORIFk=;
 b=PY9NNd+i8kLC52ZxdYmh7gE7v1rrDO+55Ofa7p0AElk/vjbj2Op8q9Pe7AILl2PIXd
 8FgJ/iqx2dlFsHX4JHCCGUljRsI7Tdmho204Go2pqCLPqyfsseR3sSgf7GnWur0D56z9
 YzQh2dFaR7QB4+g1GSyyQgvYctfVcL+fAO/JR3b+q099E2W3M51BWLh/6nqR8iRs7wbm
 4dVXiJDjnT1p4eWccSlIgZi3jsvU3GacZIgs26BltmDLi1bSgpnyKS9V2UNfOSDGIlYv
 n7frXiysRPCzf99syUXDW194m7BDphpdruHbKRq92B6CRKkXr/W7yevs/8z1db132Tgb
 8lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ukr0oQ/H7erZ4f0WnmGTNfHPAZm7xY+215mHfdORIFk=;
 b=qto6qF/s+vHRO2TjK96MWjFu85aZ/pd0TRX8hcyTsWwts8XdNVwzg7gusC9NUyycnW
 RR8E//HyhHvkl4upiHV72OPlOD1ficYIICJwldTZvPoB3yCettqtULrAgSWhg8hfQrlT
 62Ddbz7vG8/rHdpySjw1i8qLcImZafLrIaYfiSnaHftlHS56eMIcLWsM7RrribnkLoCN
 PSN7o5BtTENNKGjsVf/UEZI8MlMxUSekw2wLI7YstPK8mrIBnLa4pMwQT9prRcwP7kVC
 rcCvHDSFEJjqt3W2G+KeOLj+nf9cHvQQOWR6yLVAg2tORtV0w4PpElAKm05D00DjzCiu
 5Xkw==
X-Gm-Message-State: AJIora9E1UYKptrhznkE2A67rMsRGfIAx0SKCy22QuHTCQmDhi6EOu1C
 gHSy3sf2ZC0lUP+55G8SCQSU+83XapA=
X-Google-Smtp-Source: AGRyM1sQnTML+7gmGUuhC2b4mDh72Wu3PD3DMeReKbhXiey3Ob0dkMhveraATQM28nTPyRxSB3EExQ==
X-Received: by 2002:a5d:5707:0:b0:219:e581:479e with SMTP id
 a7-20020a5d5707000000b00219e581479emr1368526wrv.643.1655324349358; 
 Wed, 15 Jun 2022 13:19:09 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a5d6187000000b002117f872f81sm15077131wru.113.2022.06.15.13.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 13:19:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 22:16:22 +0200
Message-Id: <20220615201622.25057-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wine: needs NPTL
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wine unconditionally uses pthread_attr_setstack resulting in the
following build failure without NPTL:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/i586-buildroot-linux-uclibc/11.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: dlls/ntdll/unix/thread.o: in function `NtCreateThreadEx':
thread.c:(.text+0x61b): undefined reference to `pthread_attr_setstack'

Fixes:
 - http://autobuild.buildroot.org/results/a866d65cda97845a8c829acad2c057bab00cde08

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wine/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/wine/Config.in b/package/wine/Config.in
index 9de8cf0f6d..18fb0a64a2 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -13,6 +13,8 @@ config BR2_PACKAGE_WINE
 	depends on BR2_PACKAGE_WINE_ARCH_SUPPORTS
 	# Wine unconditionally builds shared libraries
 	depends on !BR2_STATIC_LIBS
+	# pthread_attr_setstack
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  Wine is a compatibility layer capable of running Windows
 	  applications on Linux. Instead of simulating internal
@@ -23,6 +25,6 @@ config BR2_PACKAGE_WINE
 
 	  http://www.winehq.org
 
-comment "wine needs a toolchain w/ dynamic library"
+comment "wine needs a toolchain w/ dynamic library, NPTL"
 	depends on BR2_PACKAGE_WINE_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
