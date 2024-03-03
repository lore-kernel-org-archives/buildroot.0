Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F226C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 10:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB9C14088A;
	Sun,  3 Mar 2024 10:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ufcIsVGuUqY7; Sun,  3 Mar 2024 10:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96F6D4088F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F6D4088F;
	Sun,  3 Mar 2024 10:50:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B54A1BF293
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 892A760A9A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 10:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QN9DYWur_I7S for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 10:50:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04D05608BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04D05608BE
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04D05608BE
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 10:50:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412e2dfa58eso104525e9.0
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 02:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709463038; x=1710067838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mx3jtaErQKHeA21M25hv9bLtYaeNMwODOfnjXP2O4z8=;
 b=VfqsjjZsS6pzGt0jAHYgr9oWnaXNeZXio66Io906bwKlJivMXusOMRVhCxJY1oPQUo
 TiWPEBOfHGvbkIekrqUIfWHOZjtenzwD6aRoH5YHyXFLEZQJQjG+xSCMfqoM8HYqIyGo
 iUDxRGQld+FPJFMGFY/f6pu3bINeYMI95dEtCGLbacwhXGZQn8zgwqUGaBHaHRMVK6c+
 915MOnyO7yHWNmC2YM2c3BH4w4Z9bp4lsyua2QxZfZqErbRz2DMCo1gjpzlc/5nMBuG/
 IGB5x3XBq8jZJPNI5W1zFi0a5ZOf4KgRiITP5pEUfh/UOfxZkij3+rxG9O1ZEstA1nh8
 1/Cw==
X-Gm-Message-State: AOJu0Yy0qqBDb1EMjbwvsc8KjJZYSk5lHK2c0+dB9MNnDOw9ZmJNgm59
 EOWv5zUmfNDSqShdRVCw3lKPyKGUBxD817J1BOV1VzyEIEx0CMI0hpD2Bx8o
X-Google-Smtp-Source: AGHT+IEn/1Jd/mVJp7oQXw8sdRh7z+JNCXPwsBTlm+2EjYXQj/c6DBAUDVsA8h7TfVna23qw/LMP7g==
X-Received: by 2002:a05:600c:4f81:b0:412:db74:41f8 with SMTP id
 n1-20020a05600c4f8100b00412db7441f8mr1811867wmq.17.1709463037802; 
 Sun, 03 Mar 2024 02:50:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05600c45c600b004129e8af6absm11243114wmo.33.2024.03.03.02.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 02:50:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 11:50:34 +0100
Message-ID: <20240303105034.466131-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709463038; x=1710067838; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mx3jtaErQKHeA21M25hv9bLtYaeNMwODOfnjXP2O4z8=;
 b=aANnog6bk2+tcVmdQhaHhuibvxsY1WFDc4T+bVLiiWInyS64e/EBPcxYTUS6ioz9KT
 NQG2y6Qn5w5k1qG56e+c0It85QNKg/a7SbUiOpyjP/q9TYKE3yZ5xvSKZx02J6+yyorT
 IZCGLMUkeAbp0EIA/HD7RPu8Ro7Zy0yj0cDBiW9SB9QcdoWOTgklYzMR8Z3FIfzzjh4N
 ZLPE4qh1svieulewU5mJKm8/fNeYA5qOJO+I3cX62ZFbytOmGlh0HQGUD83l1GhuzNVO
 UXo/xlXCB4avXpd8ipeuG7sP0kyL4+D7N54rlA5y2RtJAaXZ4hEbs8WZwb49ZfesC2TA
 Wt1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aANnog6b
Subject: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 libopenssl needs perl bigint on s390x
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

Commit 7ea38660e01a87ab70c02e38c78a49202e8e5c21 confused bigint [1] with
Math::BigInt [2]:

Can't locate bigint.pm in @INC (you may need to install the bigint module) (@INC contains: /home/buildroot/autobuild/instance-1/output-1/build/libopenssl-3.2.1/crypto/chacha/asm/../.. /home/buildroot/autobuild/instance-1/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-1/output-1/build/libopenssl-3.2.1/crypto/chacha/asm/../../perlasm/s390x.pm line 16.
BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-1/output-1/build/libopenssl-3.2.1/crypto/chacha/asm/../../perlasm/s390x.pm line 16.

[1] https://perldoc.perl.org/bigint
[2] https://perldoc.perl.org/Math::BigInt

Fixes: 7ea38660e01a87ab70c02e38c78a49202e8e5c21
 - http://autobuild.buildroot.org/results/777d86a1e53dc3d6a16c829348673f1c33245a6c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 3d83cb3285..6d5fc36037 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -283,7 +283,7 @@ required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopens
 required_perl_modules="$required_perl_modules IPC::Cmd" # Used by (host-)libopenssl
 
 if grep -q ^BR2_PACKAGE_LIBOPENSSL=y $BR2_CONFIG && grep -q ^BR2_s390x=y $BR2_CONFIG ; then
-    required_perl_modules="$required_perl_modules Math::BigInt"
+    required_perl_modules="$required_perl_modules bigint"
 fi
 
 if grep -q ^BR2_PACKAGE_MOSH=y $BR2_CONFIG ; then
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
