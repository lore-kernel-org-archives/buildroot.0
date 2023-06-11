Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4A4C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 13:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 473C8402E0;
	Sun, 11 Jun 2023 13:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 473C8402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98IvN7w51vmc; Sun, 11 Jun 2023 13:16:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8501C40363;
	Sun, 11 Jun 2023 13:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8501C40363
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43A2A1BF2A3
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C32B60A6B
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C32B60A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0YZqNaghAZlK for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 13:16:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A93608F5
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51A93608F5
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 13:16:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30ae95c4e75so3355750f8f.2
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 06:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686489395; x=1689081395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JfdC/JKrCQIfE53G886l/Wx+3m0jFb6LIcqFRM48bNQ=;
 b=ZkWPMBx6OUbz1psYIVIzQKQCp87MdVgi2NGlOzj+nn/mi7J4nm1eZYhOlvk94TO2AN
 6xv/0igAcL5nHICe9zSWov9llNP3M9R9USqeuiIxAqAFJFq9gpSFtjsmlVQbPUDUwRR4
 1J/NHGu9XGP9RqB8VB9UedyhGfFuA9FAmbqHrQsY3ic+UpSzMo8DcZlIxWPHSqpTlrVH
 rZuOVraFCPn4ffHdQKRPWrk+hEGJg5MlNxubXL2WOPhmpdRV4Oa0G4zbJeIp3LSBdDF/
 ZoI+uINRffDQrKu0RNmgH5YtrnATbSKnGYq+zi2KtZysgz8mFjWu2qNOBSkfR7NRFG8T
 7+lw==
X-Gm-Message-State: AC+VfDyPODf25EdipxlwM60KJ3wqS4nhi2jNI+iRamAxrv6QsOIQCLe4
 m4oNHYXHLIKcUDZ0zUGtatl9UD6s418=
X-Google-Smtp-Source: ACHHUZ6iZmQXdLOFm1IDOP53AWxXOEkUZ8FewiCAt5NGm4e6Ku0n2TbjN3PuJMxtSCA8FVs5K0g86A==
X-Received: by 2002:a05:6000:1248:b0:2f8:3225:2bc2 with SMTP id
 j8-20020a056000124800b002f832252bc2mr2816525wrx.41.1686489395023; 
 Sun, 11 Jun 2023 06:16:35 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a5d4d4a000000b0030fc079b7f3sm747585wru.73.2023.06.11.06.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 06:16:34 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 15:16:27 +0200
Message-Id: <20230611131631.806432-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686489395; x=1689081395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JfdC/JKrCQIfE53G886l/Wx+3m0jFb6LIcqFRM48bNQ=;
 b=afn3iFnWFWW+pZ+gDLbm/xz8W9Yy7Ko3zvE3ynMvLvLtugYBtTuzqrd9EZqsHlBTkY
 YNgkvEPmB09xc1yDNr6vqHMb9wfyD9Y0gBX3KnWXsHgqhqb24v8GZOZhhG1AfZKpIuq3
 e3z2f9iCdYomySE8XW3RE4R/aQs/SzVwCGGInCBfibQ+kTwfZ/sEmcpBhVjJpaujlvP3
 nIUpr0s16j6dxriZ4WdCFAK75iJq/DxxcmWb3KEJ/vPgOU3dEXhbBXtdGMY+tEkvRaBp
 f4lIokI7lUMVRpMD8VSwZrAE0fBpYNk7loTawTrztRBUM/WpCtY4c82xwbc5RP7QIqV3
 XBQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=afn3iFnW
Subject: [Buildroot] [PATCH 1/5] package/binutils: disable gprofng support
 for each known unsupported version
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

While adding new binutils version, the gprofng support will
no longer only available with one specific version.

Instead disable gprofng explicitely for each binutils
version that are know too old to support it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/binutils/Config.in.host | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 5dd2af2f9c..6e93b65c3e 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -39,7 +39,9 @@ config BR2_BINUTILS_VERSION
 
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
-	depends on BR2_BINUTILS_VERSION_2_39_X
+	depends on !BR2_BINUTILS_VERSION_ARC
+	depends on !BR2_BINUTILS_VERSION_2_37_X
+	depends on !BR2_BINUTILS_VERSION_2_38_X
 	help
 	  This option enables support for gprofng, a new profiler.
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
