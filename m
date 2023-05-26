Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB33C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 26 May 2023 22:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A4DE84DD9;
	Fri, 26 May 2023 22:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A4DE84DD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PzLVWd8zsF8F; Fri, 26 May 2023 22:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BF9A84DD7;
	Fri, 26 May 2023 22:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BF9A84DD7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98A431BF33D
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 22:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 712BF6F644
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 22:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 712BF6F644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXkPUwdryX15 for <buildroot@lists.busybox.net>;
 Fri, 26 May 2023 22:23:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71BA16F616
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71BA16F616
 for <buildroot@buildroot.org>; Fri, 26 May 2023 22:23:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6042d605dso8955795e9.2
 for <buildroot@buildroot.org>; Fri, 26 May 2023 15:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685139797; x=1687731797;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ago8aubvrGzvEWR33E3p5T6l77b0W/0xQl22/muZT8o=;
 b=hLXGxe0uTQDQtcny8yXh8UzYWw3aNhPRHGIOAW6jvmnARfMY1oyfMSYp1iOr2jreTA
 miDnVvEp429UIx6103RCJCFOu5o5EgyTeb/oU3tACaWhA5FBmbMnzZtqZ7x1+jhLilFe
 orR+JPOmz0yZZVdLGkXc3oZcfOrQ0S8wyEZhmYG2dHE7iKACi4aJa+L5ndVi6ckWCeML
 ldqqsL8DK1DelHs/n3/uzVVYU+IZE5xQmJLmyaMLMyFueGAVx96+cAT+cGthrL8Bq3nd
 MdKSNF7S6QRETHEA/49HM0+d488/4D65gbpu21mWzhhDF3fVA09wgcQTxTI60Ew+B49J
 Schg==
X-Gm-Message-State: AC+VfDzFq7I3knAt17tgWPbaXO3Rr152eOyIKrsUgludOpupwS+P70YJ
 Gow2he7Ec+QfkMosgERWHxoAHEjwjHE=
X-Google-Smtp-Source: ACHHUZ55MozyhSVufbCLnV5C5u7v1c8O7U8xhi9lPv/3s5ygO0jULpp0AJLD5eaDbTFmMiaGta88bg==
X-Received: by 2002:adf:ff85:0:b0:2f8:e190:e719 with SMTP id
 j5-20020adfff85000000b002f8e190e719mr2043127wrr.65.1685139797208; 
 Fri, 26 May 2023 15:23:17 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a5d5950000000b003078cd719ffsm6253699wri.95.2023.05.26.15.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 15:23:16 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 May 2023 00:23:12 +0200
Message-Id: <20230526222312.1674532-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685139797; x=1687731797;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ago8aubvrGzvEWR33E3p5T6l77b0W/0xQl22/muZT8o=;
 b=c437zEwW8j474yxybce2qknaKaBVFbAjYfGpGy2drnTueDtpNm/M8Akpo852UiLswx
 oNY0lYmunP3Q9wB0DGaXEttho5Qezn+FCVs4K13Cp5inu1B9qP+DwrmoLibOA1gBsTtO
 oooEUf9eVN8ouD04/udjWIxd5noUfszhKPTatDHfBfKyyVYokUqwk3XEKeCT85XHrDup
 SbV1VTqXfIFKcFmE+GwvBEJQKuklgITLh4Z8ilvRfpsvnwnANLXExv9SF8HiDFdBop2o
 nef6nXo4a8ibrmeGrFCu341eyOgSny13G4KEfY5aSTC+CFAMkucghxiHE+u64WOvu4eX
 vzrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=c437zEwW
Subject: [Buildroot] [PATCH] package/python-can: add missing setuptools
 runtime dependency
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

The commit [1] removed setuptools from runtime dependencies
"Drop spurious setuptools runtime dependency.". Since then
the test TestPythonPy3Can fail with the following error:

  ModuleNotFoundError: No module named 'pkg_resources'

Add back setuptools to provide "pkg_resources".

Fixes
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819285

[1] 09c966af735ca53b447f52965d123c21e43ae522

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/python-can/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 5d21e29d88..68a9ffca71 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_AENUM # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
