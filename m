Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5F5C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D3F5611FF;
	Fri, 10 Feb 2023 22:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D3F5611FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pnodgnlWe_gF; Fri, 10 Feb 2023 22:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4283C61212;
	Fri, 10 Feb 2023 22:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4283C61212
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7291BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FBA941B4D
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FBA941B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgHIuPo8sBLw for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:47:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF8E41B4C
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AF8E41B4C
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:47:28 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r2so6528103wrv.7
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mj1wZsehBD2kK4eEw4rjlKh7gpq8IOveuaGuVGCeRBc=;
 b=nxwPfQRmpQr8HtboSAiuevXTXKoiZhXP2NXc/A3MMOjxYC3V1RxV5eUOhDyqjTSRRM
 t8IO6Z585fAwELbs8Jf2YIQPbbEujKMBFusSgsBXtg8jQfuKSq4wVK0Y1jia7r9lTPK9
 LczH9+rZKNZNgw1cErB/AuDKD+e6Wz58QyQ9FPGPn/kTP627lmSZ99fOzUnMPADret8I
 Unc/l+yckeh2zJH2s6wywRejB2Uh/+znaeyaZBMdTiOpLWJDkhqVu/pHio8AInM5AICa
 Nrp7Dm1B8ClVLk5Y3RtA8n6ua+HzIi6O8gfRQjEbS7dBsbKkNb/vuXmjiECyhsmNANbq
 SW4Q==
X-Gm-Message-State: AO0yUKUrMx5t+masnbRJuYEvbEtxpRlgnWdQqWjOVo/nPWb8kYnMs5iM
 9g0bwMB2JoeGcin3DgDbR+61mACmZU2rF4t4
X-Google-Smtp-Source: AK7set+ck6tGKt+XTpoPhY5bcqwgAq8ZGkiGBQWYhsgQfWGuXIrRVvgNMjQfdT0hEsZQkAn4ZC32kg==
X-Received: by 2002:a5d:62c3:0:b0:2c5:4c92:1385 with SMTP id
 o3-20020a5d62c3000000b002c54c921385mr1978545wrv.24.1676069247291; 
 Fri, 10 Feb 2023 14:47:27 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm4576128wrn.59.2023.02.10.14.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:47:26 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:47:10 +0100
Message-Id: <20230210224717.3293906-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230210224717.3293906-1-romain.naour@smile.fr>
References: <20230210224717.3293906-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mj1wZsehBD2kK4eEw4rjlKh7gpq8IOveuaGuVGCeRBc=;
 b=lR/+6pUtSxGJJoRqi0mwo57JtsE4fS2zo6ZF4SE3medOI2roTbOwmobl/2egqNs+Ca
 vOB+xCpJC+QQaR8rxVoRTf4jFSnEUiaZJlHrACw0dfL+JUdCI3Xzzd0BHK15J+JYS5ZE
 xVol3GjB5ekuAfPbvZlvJnX5JjdVT3WVeasCAXrYRJ8vnhrXfiNdIyI6YvZpOAfNdLLg
 INL5Ud4wAuVzVP3l4YHy2qsnBLgyIfIsur35Cr2BIgOZvDz6ZdEQNFiuYK0qe2nQ/Fri
 NH4sxP6XJc8r4RJaUiiJOnYI73eNR253huTy9NmxxPk/9ms2r993aay7XPdAPO9KAKQR
 +Qag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=lR/+6pUt
Subject: [Buildroot] [PATCH v3 03/10] package/lld: move to llvm-project
 subfolder
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

To make version bumping easier, move llvm to a new llvm-project subfolder
and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                    | 2 +-
 package/Config.in.host                        | 2 +-
 package/{ => llvm-project}/lld/Config.in.host | 0
 package/{ => llvm-project}/lld/lld.hash       | 0
 package/{ => llvm-project}/lld/lld.mk         | 5 ++---
 5 files changed, 4 insertions(+), 5 deletions(-)
 rename package/{ => llvm-project}/lld/Config.in.host (100%)
 rename package/{ => llvm-project}/lld/lld.hash (100%)
 rename package/{ => llvm-project}/lld/lld.mk (87%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6244b30d0b..bbb7e2c2fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1618,7 +1618,7 @@ F:	package/clang/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
-F:	package/lld/
+F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
 F:	package/python-cython/
 F:	package/python-pycups/
diff --git a/package/Config.in.host b/package/Config.in.host
index dcadbfdfc1..9addc88522 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -51,7 +51,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
-	source "package/lld/Config.in.host"
+	source "package/llvm-project/lld/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/lzma-alone/Config.in.host"
diff --git a/package/lld/Config.in.host b/package/llvm-project/lld/Config.in.host
similarity index 100%
rename from package/lld/Config.in.host
rename to package/llvm-project/lld/Config.in.host
diff --git a/package/lld/lld.hash b/package/llvm-project/lld/lld.hash
similarity index 100%
rename from package/lld/lld.hash
rename to package/llvm-project/lld/lld.hash
diff --git a/package/lld/lld.mk b/package/llvm-project/lld/lld.mk
similarity index 87%
rename from package/lld/lld.mk
rename to package/llvm-project/lld/lld.mk
index 4bf903cda0..46ec3b13ff 100644
--- a/package/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-LLD_VERSION = 11.1.0
-LLD_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLD_VERSION)
+LLD_VERSION = $(LLVM_PROJECT_VERSION)
+LLD_SITE = $(LLVM_PROJECT_SITE)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
 LLD_LICENSE = Apache-2.0 with exceptions
 LLD_LICENSE_FILES = LICENSE.TXT
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
