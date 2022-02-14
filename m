Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4E6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB2DC60B54;
	Mon, 14 Feb 2022 21:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04Vxsvfywf5j; Mon, 14 Feb 2022 21:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09926607F2;
	Mon, 14 Feb 2022 21:19:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 813D81BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B6AE8137A
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNHFqtXsMjJn for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:19:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C38798136F
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:19:38 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id p10so10767531pfo.12
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 13:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CAPOmvzhWCIgBfpBhNAe1HRBpH6E5jxP03Xwyel9Brw=;
 b=Es22yoar2EjDGgCTzHoQVgWyC6cKVUvsm+fw2bSSwG8bBcSGDZCegZJozWX7mOBJ8b
 tlKbgVsqEdbMYf4nEtD8dRfUivTYcQzA6IAyDm6JYuilj96y9RX8FabmD+4jIf/9q/zJ
 mu9ptQnI9MG8C0BAVPcy5EHWoLP7Ap2KQPK/tkTzy9vcTFMYst5rJupUcWhN+BzojsGV
 A6TTyD+TkU9TljKhBzsXfy/qDmMI1DFrFWgdt7OcFRcYNbiRO2ehoA6C8usHHZB7Smq1
 4/Q3JWpuSJRHyGL3P0QO5pumKeJX+Z04uzSvJsEXWcdUwpZShQtuuiaSXCRlaFjfXi16
 N0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CAPOmvzhWCIgBfpBhNAe1HRBpH6E5jxP03Xwyel9Brw=;
 b=YcPJbs91lVHviQBHWb/Tr/f50DDvBRMJwhG4lAL1YEbRsLpyoZpRZa322TTqsnkw0i
 03mjcjDXriyt1DX66h/9mlIQcjz8yyPrTQfquGA60Ppla3qfE4EiMmPTdnFTHXcK4Sla
 792YD/BuYt3rHnaJJjrTt6MN2/DqHfbAEaj4vWTDplUaXORnsmKnXImEzvXKbm8ZuCNA
 PCyp2jmR32jMM08Aw9bQP+6SAPDP/FXMZilkXXgoHATAmy8xNon+m/hUPa36/hO9NmHA
 QBcXWO3MzNzddWHGR6gJrDuSI/tTn8BPs79lOnG68q3rrxchU5qWfg0AlJhRcr2mL5C5
 CY0g==
X-Gm-Message-State: AOAM533XvkPNGz53WrufvzGi1Fw6CG5ZHh6wI7Z0OGdRjKEB1QaCPsjX
 /E9h0LmNZIPzRp7T9nBdhSlFhPbjoCM=
X-Google-Smtp-Source: ABdhPJwpXJSWx5Kwwv/XHNW/iEIrUEGNn2PAs8Q61FddJnYH6zq8aZfkL0flXbYUJuUOQ5pyiHrTPQ==
X-Received: by 2002:aa7:8202:: with SMTP id k2mr1037616pfi.66.1644873577869;
 Mon, 14 Feb 2022 13:19:37 -0800 (PST)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:a54a:1650:6ba3:f974])
 by smtp.gmail.com with ESMTPSA id e8sm20646845pfv.168.2022.02.14.13.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:19:37 -0800 (PST)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 10:19:26 +1300
Message-Id: <20220214211927.3673441-1-judge.packham@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] syslog-ng: Bump version to 3.35.1
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 55d01501cb..64ff980593 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 3.34
+@version: 3.35
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 99ed363eca..ab643627e8 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  cece39ec1c68c88d493705e0a528b83d038da384e89d4838393ccc75f62a2d4c  syslog-ng-3.34.1.tar.gz
+sha256  1d0238b06b3e5987c859e5b529ecee738f75bacff04b149398b1fe8cbb121e53  syslog-ng-3.35.1.tar.gz
 sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index c05ec9785c..fc57a56820 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.34.1
+SYSLOG_NG_VERSION = 3.35.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
