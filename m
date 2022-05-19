Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B287C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D7F41CF5;
	Thu, 19 May 2022 14:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxXBVtzvHhxp; Thu, 19 May 2022 14:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E896241986;
	Thu, 19 May 2022 14:09:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12A831BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE77541D23
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mxyi1DM4vadV for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0122B41D20
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id j24so7372638wrb.1
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+lJdS9BGVzMU7H6ZjIU8FxXDKUHQxOQiRv3UhIaLL9A=;
 b=m8A+koq/u3SdO+bF9uXljNcSRyZvmFR5P/fvtT5J4u5M55hViX37xaR+f0Gv62sNz4
 6EOgq2ZhVMc8O6l0aaaM5i8zNxtOWw8A6VqqZZSoDxHnL4dNZA/UOzfQl61aDGbLwFVt
 XqSexg9MILNiNkDf619Br/zQEZqQcJTJZIsD1Xu68SzUq2Sj9c0O7Oxw4qOBCMpxL/hN
 Rnfl0voxA1+OpzIKjCwqwZ+Rj9bxmz04PJfHFNKYk+qcU9ZKPwxRioxHSls8NHc86f9a
 lqGYa1rxwr2JTTeKEx3RYdTmd4wIs1PmjUI604Qjk2RP9DvQ1KOP75TFjqwIdQxSZHuW
 bFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+lJdS9BGVzMU7H6ZjIU8FxXDKUHQxOQiRv3UhIaLL9A=;
 b=noc62je6xtgrv96lnhB2SVImdjqT8O+jw7bNx7NgNfvMpZ8c7WNrrloDHTCxSTyoim
 B3lJY5JYKzA0Do1I9gZ1y6aC/u2A4ZWubQ0P/L+Faj00CL/rRPnHJxrlJ7gNJTv/nYzZ
 //Mc6qlXXdL6Jmbtq5GbYnMWMtMQH5mZ46vlQYjgtfLj0SPBoPzU1Jyhkkats4Ktxp8P
 hmt75kq0whbFU8Xv5kSaQo5gufuJusEXn2RILROl5T6spynoXklqEQ8rBLeQL9+X3IQn
 Cc8BRTRaS4BI1GWfoNa1dP96gip2iZag4C2PcGfRGAyRTWDhk4qT72Lz3s18WQlyk9Cy
 O0dQ==
X-Gm-Message-State: AOAM530Vp9bCcCxBibLrp7+uby7OI89LwDkIAijjj8Wg0fqiwKWn1kgP
 YT3R80EeSHM1GhF1IFRHipH/uZUP12M=
X-Google-Smtp-Source: ABdhPJwcaBj02w9RjBXw7o5bhPSgjR+i7ehr4E+ypM5s9q1doKAdGvrCuDG30NfnRpfA3zUOZ1AZBw==
X-Received: by 2002:a05:6000:1e1a:b0:20c:565d:ca1c with SMTP id
 bj26-20020a0560001e1a00b0020c565dca1cmr4079717wrb.643.1652969315878; 
 Thu, 19 May 2022 07:08:35 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:35 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:07:56 +0200
Message-Id: <20220519140810.1953601-7-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 06/20] package/erlang-p1-stringprep: bump
 version to 1.0.27
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-stringprep/erlang-p1-stringprep.hash | 2 +-
 package/erlang-p1-stringprep/erlang-p1-stringprep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
index e23cc4f38b..eec611829a 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  47f9f8ee901f47b7f62c5140ea09f113efe7fedd5e8ffb92d50f51c5e11fb67f  erlang-p1-stringprep-1.0.23.tar.gz
+sha256  cdc2ffa6ba2171f55b78e69cfce5dab6099cbb6bc6955d88c5c53b0cf24d13af  erlang-p1-stringprep-1.0.27.tar.gz
 sha256  f44415631770cb818de6d92f3961fdfe6e407a5154f84b87cc06ac27323e919c  LICENSE.ALL
 sha256  42aef2a1337ef1f45ae2832aa5aa268c79b2560fb1f3ebab519629372cb24ffe  LICENSE.TCL
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
index 580f4a9aa9..233be52c58 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STRINGPREP_VERSION = 1.0.23
+ERLANG_P1_STRINGPREP_VERSION = 1.0.27
 ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
 ERLANG_P1_STRINGPREP_LICENSE = TCL (tools/*.tcl), Apache-2.0 (rest)
 ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.ALL LICENSE.TCL LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
