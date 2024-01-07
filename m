Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED98C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 21:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F24BD82F11;
	Sun,  7 Jan 2024 21:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F24BD82F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIgHgKtMOcnV; Sun,  7 Jan 2024 21:43:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 558C28294A;
	Sun,  7 Jan 2024 21:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 558C28294A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6C601BF2EF
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 21:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78FB54027C
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78FB54027C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1X5RGiJqG68 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 21:43:01 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9804C40266
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 21:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9804C40266
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7ba8e33dd0cso75696739f.0
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 13:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704663780; x=1705268580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SI3MeErQ9AvHW/mV0OJqF2Ri3aKPsLFBTyDSFAcVuuI=;
 b=K7YVqrcKBNDEonZY5L+3hW/vcHFcsJmVyeP1gDI2mqtOY3kBbaTtYtasagC6iiRtlR
 /wMbkAsUWKhhYTKF9HouaNQ90U0JQ2vliomsUU4E/VKi+idiUrDyNae1O7a9WNIG1a4T
 R/n/AYZFhu8Gzj77Z3G5sYRwzzzofAgC0kZqpa8AedknQ3dS5F0CMFzC3IbfbhpLNd62
 wtofxb9JH9GdJS320Ex/PT9rYfHUD7h3dKA/W5nXb9X6/TNEH+7j59j1kTqtL2/Y0fR0
 8eYjQQKxxrxSyyFIxH1nxsu4voLCSeJKiL+E55xButoynfUMoyj4qGixzbIOIDst3ron
 lALg==
X-Gm-Message-State: AOJu0YyiDmsFcMhe21gwVqMzIv+8+7VF67pUsArKmsy/ltbOZVvDckWY
 HhlN4ipwfAOop2oT3GhAc8n/fsKTfFCP9A==
X-Google-Smtp-Source: AGHT+IE7y6uPP2MQrJhQybyDKP7WYGzsNFPnLM1ElxpnDKWbzigLrps+G1EgCBHViADZ/wXf5+K3kg==
X-Received: by 2002:a5d:8407:0:b0:7ba:b9fd:a234 with SMTP id
 i7-20020a5d8407000000b007bab9fda234mr3369373ion.37.1704663779735; 
 Sun, 07 Jan 2024 13:42:59 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bt9-20020a056638430900b0046da402ed29sm1878738jab.109.2024.01.07.13.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 13:42:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 14:42:54 -0700
Message-Id: <20240107214255.3331708-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704663780; x=1705268580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SI3MeErQ9AvHW/mV0OJqF2Ri3aKPsLFBTyDSFAcVuuI=;
 b=co/PEDw567kbYgKWC2Cqd6vEwdtHFe5ir4ndtKDXmylHt6OEG0Zd8bPRnNDPbluqcP
 WMKFKjQuWqmWtNot2ExRbRIf0Lrnodjau/64NmrQRRv3bW7X4hJwIlTcxCRx3P6wzzec
 3qnEfrXAof6GOLXCRcuz7qKTC4peFHWu4mexC0PYswOfQnhN+llhSpvD81I5WStKq1qH
 yLMQ3b/ALnKzGIxxsbSrZND8s3Y0mR4TDD2ZDkNecIuYctd0Vd8wh1vuoBdGZwBCp1UK
 CF47bAxGaa6cY3Wq9jESAYik79gplXnuONmnIeNbsyyMHXqKT4tiGXXG8Z7+kubh5Kxv
 8uzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=co/PEDw5
Subject: [Buildroot] [PATCH 1/2] package/python-brotli: drop C++ depends
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

C++ is no longer required for python-brotli as of version 1.1.0:
https://github.com/google/brotli/commit/c8df4b3049ff1283fc4525defbcd003188f88963

Drop python-brotli C++ depends comment from python-weasyprint
reverse dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-brotli/Config.in     | 4 ----
 package/python-weasyprint/Config.in | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/python-brotli/Config.in b/package/python-brotli/Config.in
index c31315392b..ca493bfeff 100644
--- a/package/python-brotli/Config.in
+++ b/package/python-brotli/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_PYTHON_BROTLI
 	bool "python-brotli"
-	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Python bindings for the Brotli compression library.
 
 	  https://github.com/google/brotli
-
-comment "python-brotli needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
index 18d72d742e..65210fb1eb 100644
--- a/package/python-weasyprint/Config.in
+++ b/package/python-weasyprint/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEASYPRINT
 	bool "python-weasyprint"
-	depends on BR2_INSTALL_LIBSTDCPP # python-brotli, python-zopfli
+	depends on BR2_INSTALL_LIBSTDCPP # python-zopfli
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
