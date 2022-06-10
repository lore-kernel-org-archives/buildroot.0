Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66952C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 16:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF26584442;
	Fri, 10 Jun 2022 16:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLMxBT4Wi51A; Fri, 10 Jun 2022 16:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F9C084422;
	Fri, 10 Jun 2022 16:56:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BEA01BF358
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B8E084422
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBESLVYS4YMG for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 16:56:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B346843BB
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 16:56:47 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x17so37306014wrg.6
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iOQVxtt0HOaLBp/fJlDPxhp1qpm6tZxE8p07AQmRIeo=;
 b=cf0gSUtSiF5tN3CZ0epxUIRamkikvcl5gbkGg+fnLo8VeKcnAajpBjDM9QXbGYKVDl
 q6/aeaVvbUXyzrryT3oxwf3AXVs4vTkCmFh+jJuGwo74CoYjxUH1MlkfH+PRdA8oYgFa
 MHeBmlYBXxQfEbRZsxIe6ccjLQWfzwiI5g3GLg1aDUAi59Vt7Xt5GIjvWazFLDxRAaxq
 VY8Ch/xkHbZi38aRe7Y5qp2Be5d7+7SKuIg4ES/i3CSg/FbOM6Iy4WCDxfrmzXT6vQag
 Ni9ktFFc7R+DPAZI+WP9Jtvls0j6rbQbgxyRmxav+sHHb3rmefns66fr9IwIRGXM79qp
 yJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iOQVxtt0HOaLBp/fJlDPxhp1qpm6tZxE8p07AQmRIeo=;
 b=2DBvCCq7V7b4VShaEf5GMYvjOMJ8ck2l1IK0RY2pjsIPfFQ1isUzzY9fMrIqKfmfb6
 I/npAWiFp/QzbyLl/pmSB3KEmAEGLZXuvz7D/p2bOBU1k1TqFGLpa+HmxeTsOaaiWlY3
 PwtEVkI49T+IlkfUvd6bFLZZbxO2xTjO92fRJUb6jjgM2ufzJIRxtSrBf6YUrIUMNHwn
 lyqlN/2VoKApwlAAYjMyuiUltV0bZk4FTAjTZDI7fTqwTKsB2dRGbnKiXZyTxoWeM9Nc
 6Hhij4o1ecDTSIBSewQzx7B+8coFFA+AZAcMY55pSDGpPV2xsJpcXyiqrv9cK3WEt4Ig
 l1BQ==
X-Gm-Message-State: AOAM533zTuAVHbDq9KTx290gZPrO9l/HvKtvn/VA4+ukWBiupYM9rgzs
 qUeLm2OcBjrwBIO0GS02hmJA6UfBcas9qQ==
X-Google-Smtp-Source: ABdhPJxVCFmiNkuhPI4krmOQ5/SVdDAf5MHIOXPP9SekBr25X1mh55b7JHmRiv0uhzUMETceZ3uW6w==
X-Received: by 2002:a5d:5310:0:b0:218:101f:5de6 with SMTP id
 e16-20020a5d5310000000b00218101f5de6mr29930832wrv.171.1654880205525; 
 Fri, 10 Jun 2022 09:56:45 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b0039c3056c3dfsm4841653wms.27.2022.06.10.09.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:56:45 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 10 Jun 2022 18:56:41 +0200
Message-Id: <20220610165641.2574429-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 908dd32c4..d43da1344 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.2.0/htop-3.2.0.tar.xz.sha256
-sha256  e0f645d4ac324f2c4c48aaa7a3a96d007b95516559550be0b56e423fc5b6d783  htop-3.2.0.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.2.1/htop-3.2.1.tar.xz.sha256
+sha256  5a17121cf1c69d2f2e557c0b29d45a2c353ab983f644742e1c2e4ece15aa6cbb  htop-3.2.1.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index cb8170a0a..df2ec2590 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.2.0
+HTOP_VERSION = 3.2.1
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
