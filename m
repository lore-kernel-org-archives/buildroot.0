Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0891C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 22:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3467283F89;
	Thu, 16 Dec 2021 22:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qyYOI1pJ2q_A; Thu, 16 Dec 2021 22:09:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A877383F88;
	Thu, 16 Dec 2021 22:09:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CD121BF29D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 22:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C1BB83F87
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 22:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjLLF_tkaXMu for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 22:09:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C95A284B27
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 22:09:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a9so516963wrr.8
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 14:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0yPqwjUbcnblQ5aZ5hCO4DAhSXjED4xIMavZi8u/M7s=;
 b=MsSvMn4BCPwCNTRp08r2GbNrwpCAMUO7k1ORurZQolftB7CdC+tjRuhy9l1KCseUUM
 4dZ04z/eKptE7Buqmrofoe3rEfz9IrN7yrjt3ghZ/a62/qI3wPUwNgyayVuduLYsRa9l
 0LnnYbwzUEnUvx+Co7FAnXxfLT/az8KfiZwYJeLVzTefFZzMFQWcUPWuv+FjphzPCEfj
 Z579N8w0nGeg7IJYW/f+gwPO0lcaqmZkPLyOpN+ZxGOQTWh2165DO9sqjWtdCQPjBBpD
 mitrXrpowbS3eLncZh5qkEH1pvv3tOjLPDuJInMMhE5qMkplGDygEYaPCs0L3NU0EfJ7
 8FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0yPqwjUbcnblQ5aZ5hCO4DAhSXjED4xIMavZi8u/M7s=;
 b=7Adc8rR8kEzD8C2GJcRe6gO7thmqCMWaKYZXzPYnohulRrbCGFqlY0kgA2qzCy1Tv/
 7GIw7T1pIY7oXdsKGKQ9HwHtur6U+CxvReZtfXmD26ALoTaj/eMx4HYBNmNJFkf42MZO
 N0wsjCwZVqtGFX0Pco21gap26Nm3Uun3bChsIF8j+WXlACumR3dPjl92NXtsEwx63yCf
 Z+HiFZvLUmdoqRANgt9mGygTRv6Q1R1xIVTnRucj2bPXy9Uz175tp+YNe3S0fICEfioy
 m/a06/fef9RkERbkvTZHdbMoD5I4DtJgacyxpZ8JSnIOJDHomgiFGvlLtJO6ojHbQGUX
 tPag==
X-Gm-Message-State: AOAM531Lxoqm2sSsr5UJf5xOA6jBp9FyVFHNOKgWLo26icTZc3gvaffP
 4EblUZrts2jfU27dO/ZOlZBdPAWIkxlVaQ==
X-Google-Smtp-Source: ABdhPJxW/7bfO6aLcU4lfV5dh8ZKFCo0aY/Y6HBTT4jU/QnDPh4Wbu0gQNeU/kPvAL1dE0Qag3qJUA==
X-Received: by 2002:a05:6000:188b:: with SMTP id
 a11mr41667wri.326.1639692551827; 
 Thu, 16 Dec 2021 14:09:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id v15sm5808468wro.35.2021.12.16.14.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:09:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 23:08:40 +0100
Message-Id: <20211216220840.948363-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Config.in.legacy: improve iputils options
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

Improve iputils options added by commit
db0c2a287970a8832b59f3cf9d81aa18aced2cec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a314f2ceba..eb977c2685 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -147,16 +147,17 @@ endif
 comment "Legacy options removed in 2022.02"
 
 config BR2_PACKAGE_IPUTILS_TFTPD
-	bool "tftpd"
+	bool "iputils tftpd option removed"
 	select BR2_LEGACY
 	help
-	  tftpd has been removed from upstream.
+	  tftpd has been removed from iputils since version 20211215.
 
 config BR2_PACKAGE_IPUTILS_TRACEROUTE6
-	bool "traceroute6"
+	bool "iputils traceroute6 option removed"
 	select BR2_LEGACY
 	help
-	  traceroute6 has been removed from upstream.
+	  traceroute6 has been removed from iputils since version
+	  20211215.
 
 config BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
 	bool "libmediaart 'none' backend removed"
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
