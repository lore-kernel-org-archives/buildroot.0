Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04749EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 13:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95AA7404A5;
	Thu, 15 Jun 2023 13:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95AA7404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k_vLbmp-OsF2; Thu, 15 Jun 2023 13:44:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DC04404E9;
	Thu, 15 Jun 2023 13:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DC04404E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9E321BF30B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C228B404E9
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C228B404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLraTriQWLmx for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 13:43:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF2A3404A5
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF2A3404A5
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 13:43:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30aea656e36so5846337f8f.1
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836626; x=1689428626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6pTJxM/OIl3L1ONIDrKoTrcFrn7aI1hkSKNX7geSRnQ=;
 b=MZO3AdPw30iUm0MTtTD/zj7D3vm/SOZGNqv1hftd2QqGOvTQCUkVqz7mMMlZNTiRhE
 DMogOTAUpTLegBsHUYaNGJG71SySgY7EwunTWjA8fi2/V1R3fcJubz4KiP36peojgWJL
 9U4kfKmeWqPaMr0ic1lGiF3x+d+Fr1a8s+TJ1jsQn57qekSvETo9GwTmOg461TA8hn3z
 F3wAOvWauImu3oh/KkiD32L4lgF8Cp/NUpX5PS2Wh7Ad1G5iDPSTzknC9DpZejYGDvc7
 WyMhXDzuE9Gbqx/xUbqRnhh9M6Eh86Q6Iz3RZOPJ074huC3bDdytsRxTHE/Bbsyp+pv3
 mDgg==
X-Gm-Message-State: AC+VfDyzU5ty1fASIX9IEAvC+7gJTbz3aSJ0UTKxr+2zLBn6uRpq7Xre
 b6GnOE21Bo4WsC/o7e81ikSfgnJUE8ZbSU6mHo8=
X-Google-Smtp-Source: ACHHUZ6Bigat+9VkrDdScA9Gpuox0rmHqcRrS56f1IoFkCtauvNbWRBVXtXfHhPCK4DWNMWkdUleEw==
X-Received: by 2002:a5d:560d:0:b0:30a:ae5b:9e93 with SMTP id
 l13-20020a5d560d000000b0030aae5b9e93mr11618172wrv.11.1686836626515; 
 Thu, 15 Jun 2023 06:43:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:31f3:6562:63d2:17f])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm21129602wru.97.2023.06.15.06.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 06:43:46 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 15:43:07 +0200
Message-Id: <20230615134315.494330-4-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615134315.494330-1-sebastian.weyer@smile.fr>
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686836626; x=1689428626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6pTJxM/OIl3L1ONIDrKoTrcFrn7aI1hkSKNX7geSRnQ=;
 b=sO+hifEy9/lzHGsoHfql2+18lvmHC1Qo8bzv7V0gcIyhHzIEBJZJTg7hbMkCHQPiQo
 f+CAKeGzLfmy0nhC9BTCOt+inL6H6OV4sR6/PeeZflKJBu6571s2sh9jxkrsYeT4Ytsz
 WFJIn1HIVOcjR8PlzSdinC6lRsAaXn+z0FK7jTKI/3DNTKsWDf2WsS0++ldDr38n8uhB
 TzOOdSWnGdsCWoh9yiJ4qFS2o3ezNbKkz8fY/TNta2Pez6zbnjio5bR9aUmyZWPQL2cr
 blZ2WSRlrylC8uT90AhQmZ8sGAxwSbf+ePonlzkVVyJtuXmhpLCcHIc/dYNky5Q+xpjA
 y4/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=sO+hifEy
Subject: [Buildroot] [PATCH v4 03/10] package/lld: move to llvm-project
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Lang Daniel <d.lang@abatec.at>,
 Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

To make version bumping easier, move lld to a new llvm-project subfolder
and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
v4: change inaccuracy in commit message (move llvm -> move lld)
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
index c4273c5f85..befafff1d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1638,7 +1638,7 @@ F:	package/clang/
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
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
