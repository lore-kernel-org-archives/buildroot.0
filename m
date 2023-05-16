Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239E9C77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 13:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B24D760BAF;
	Tue, 16 May 2023 13:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B24D760BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sbtr3qYcnMXF; Tue, 16 May 2023 13:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A54546162E;
	Tue, 16 May 2023 13:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A54546162E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 949991BF255
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65F1A41B40
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F1A41B40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3QvH2q6d7yM for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 13:51:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35554418FB
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35554418FB
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:51:30 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f4249b7badso101340845e9.3
 for <buildroot@buildroot.org>; Tue, 16 May 2023 06:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684245088; x=1686837088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VT/kT6Iclqh/opGUXp29KvKqdyrfTPIS6SJtprSNtas=;
 b=Uu9RRR8n8LX0JxgLWU4Gb5Su+GASmB4JT234TnLYUonKIITqxH1M1g1kytcUAQkrKs
 apm4afevKE73mkQ5PfKW+H+LyWAU+3XaOC3OlVQ47115vMCPjql3IIXqwc1i+crCMuVn
 mZIVIcatBfe/Zj6WjtrByAxu+ZYz2IJ18pYk2pFeMXCmBxBjr/ftjf975ypL3jCItUkc
 H54iC/T5XiQKjCAnfYjCjw2CjlTUlBWGfHRX7s6CXYrulIOyb5Wegwae4eB8GtfkxjQe
 O1OsYZ/HZV2kQyOv1Wizmz4PtPpGmFWHXP4UapE6h68m8NpdAoxcNtFbcIOewQIY16WP
 9JnA==
X-Gm-Message-State: AC+VfDxIqXrTiVwKVrPmkNxrsBNKAWdmZ2aWQtC9TOzmqlgOV/y17bNq
 xiY7Cv2C3qRN9zfX2JHP2LjsgFBgqNY=
X-Google-Smtp-Source: ACHHUZ5Z7d8iD+FsZPSir8G9YcYLKZuQd1zpHD9l9H4uysws3St/7Ig0pjk0BVBOEy6NKHa0yGCwUQ==
X-Received: by 2002:a5d:591c:0:b0:307:a5d1:dbae with SMTP id
 v28-20020a5d591c000000b00307a5d1dbaemr18972578wrd.71.1684245088085; 
 Tue, 16 May 2023 06:51:28 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d494e000000b003063a92bbf5sm2682437wrs.70.2023.05.16.06.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 06:51:27 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 15:51:05 +0200
Message-Id: <20230516135107.238343-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230516135107.238343-1-romain.naour@gmail.com>
References: <20230516135107.238343-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684245088; x=1686837088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VT/kT6Iclqh/opGUXp29KvKqdyrfTPIS6SJtprSNtas=;
 b=qNC8FUrvk7JwYghEbHuuTkTCMD6Edcof3/VpOP47q8Or2ENaws6KCaAbanF++HtYbZ
 iMe4387z1KZbAMaa8xJRRqDBTigVq/1SpWcceIIxI16Jz+01+Ngg74LnXxFq1OWtaj6u
 pxBtEiFKDBfLy5aspWztz7BGhztKIjZwdyVE3v0arPgu1cqW96LsXhVwltJMNY8rPLHE
 6JOOUdGroodEiifxYyZsqelqO1tdknmbUuhaCqeIt3wWruB2q+tDJAdKywjVT9MzMTlm
 rgnkyQag1OoniE5UeG+IrOcilrIY5zSWVCdZRkBAgbtGoO/Uw2GB+BWRwLXw9jWdoyy1
 MJtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qNC8FUrv
Subject: [Buildroot] [PATCH 4/6] arch/Config.in: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_13
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

This new symbol will be used by architectures introduced with gcc 13.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 arch/Config.in             | 4 ++++
 package/gcc/Config.in.host | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 1c0c400a98..db0d839c79 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -304,6 +304,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3beaaef309..0cbc9166e0 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -48,6 +48,7 @@ config BR2_GCC_VERSION_11_X
 
 config BR2_GCC_VERSION_12_X
 	bool "gcc 12.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
