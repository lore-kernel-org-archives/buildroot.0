Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6176DEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 13:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10761408BB;
	Thu, 15 Jun 2023 13:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10761408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLhVqSGzBaf8; Thu, 15 Jun 2023 13:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20D4A41925;
	Thu, 15 Jun 2023 13:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20D4A41925
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 452BE1BF30B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BD51405F9
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BD51405F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Ddg1DBj6X2Y for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 13:43:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F797404E9
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F797404E9
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 13:43:59 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f764e9295dso3233325e87.0
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836637; x=1689428637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=heHJdxiUBX0iUvLEKetb7uqXBV8G9V/hn/a9EF4MLIY=;
 b=ZfZmhy/xShtEPkB+ynE4sdyDE/ZMKymXASBAwM4p9vcXKG+oSutpGayPaDXKVIFTr+
 4TSuHi9B+pTL75ih7iX7cFH7zyB81WInGpbDXrGijkFKU85brr40aVHs/5XMKCxB3Pd6
 0mPhZdWPx9WWteDF7k30ClWLIj6w+awikOBRwLeMxBbCJ3mEH2HiTdbCBHUuFnoGRNYs
 dR0HdNEl75KkCd9nXsP537tIJRmDL5ivw8dCjw0lPkjr1a3MPiPRK3CaxHicCpt0ckvC
 xGhOI5jOiwuFWc+h/2zz2dEOvNF3X1EEtHHaBqbkLF0c+xX2NrpTof2IyB5bNg65cSJn
 MAdg==
X-Gm-Message-State: AC+VfDynKgevmUdw9Oy7nTn76jvxsiL9dWxYZVk2LiZV1AH+f2ejMyot
 vkcqZ9CJjA498Va1xZcTWci8Mm2k/HS4gTtfHw4=
X-Google-Smtp-Source: ACHHUZ5pfbhaFhq9BjCk9eFHjI+S9QK6Poy0o7hIkgfM/GCvqcTwu+HaxLsbkZf7mTzUBrpOw69nfw==
X-Received: by 2002:a19:6508:0:b0:4f6:2bff:16b2 with SMTP id
 z8-20020a196508000000b004f62bff16b2mr9546228lfb.66.1686836636836; 
 Thu, 15 Jun 2023 06:43:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:31f3:6562:63d2:17f])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm21129602wru.97.2023.06.15.06.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 06:43:56 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 15:43:14 +0200
Message-Id: <20230615134315.494330-11-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615134315.494330-1-sebastian.weyer@smile.fr>
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686836637; x=1689428637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=heHJdxiUBX0iUvLEKetb7uqXBV8G9V/hn/a9EF4MLIY=;
 b=wRxTxZVafD0vFZ1W1plb/DxBgzhOjGHwP/BboeSEIzeJsOncij+rWIMJwJradJfADh
 k4/EzwLxw1oPx4TYdL/k9tFcdbIp3UHQRqYgBlf6Y72Cpvn9YckBcALAMoVE6WjVM4jf
 0gYoGgw/AQ9C7H17nlyQac/su4m5hi4A2d8F0imJyAn1J5y54IoC9DMJ7nucOxWlf27D
 F9i+iJk6sA1LeA78TZ/HQjYOKsL0UV/rTVmlO++gaHevluvn8zmFABosGU8CuPhS4e7V
 sSuMH/b7m75gzZjY1Vg8Wq7apHJqSoJ5Kqe+vegTDQoYqbq0K8IpCd8MGpm2R92nyv05
 gUHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=wRxTxZVa
Subject: [Buildroot] [PATCH v4 10/10] DEVELOPERS: add Daniel Lang for
 llvm-project
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 48907a5cd8..a9987ce1e6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -654,6 +654,7 @@ F:	package/glibmm2_66/
 F:	package/gtkmm3/
 F:	package/libsigc/
 F:	package/libsigc2/
+F:	package/llvm-project/
 F:	package/paho-mqtt-cpp/
 F:	package/pangomm/
 F:	package/pangomm2_46/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
