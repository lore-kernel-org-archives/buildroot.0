Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4CFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0219E60B33;
	Sat, 18 Dec 2021 21:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VI1qy_bfbBEF; Sat, 18 Dec 2021 21:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6148660B2F;
	Sat, 18 Dec 2021 21:04:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01C7D1BF2A7
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E239B84B71
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LfWzY3hsjiHj for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:04:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EDEC84B56
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:04:07 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id b73so4077844wmd.0
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 13:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QoHypxsqVclfPym7OPTumiLrJXS6HdcCAAAaDarDAjQ=;
 b=GfM+fmvllpjxhtX+fcYMf4byG2rhm/wDzxDhswavUHIXQIBQlQc4eQ4EykMSnwEBdM
 Y+kEIF+B9ajaJ7ZuFDyxNfFeufPe9I43QYk5r+Mx5M3qwkD2ANJmW/yROiQa30x0ywws
 TfOSo9TQ042562R27au8WyV2ZnIu8GH8BEq01rXWAkGyvIJhpVfl5UclcurxCFicU2Uu
 BXiFc9L80caWf6iVsTPjAXU/q+OSNPI2+pNGZiZjwkl7VYcexoJDwzf5zN/xJhmEflgi
 D9B6zF6xFPIu3BLTB62QKGD2U5oLvVy+pLQ7HRcFPzoyfEfx3gGgBn1vqbZapKK3D0Y8
 sHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QoHypxsqVclfPym7OPTumiLrJXS6HdcCAAAaDarDAjQ=;
 b=7U9zemrrcRObn7b+ztEXRk6bYYowxuqOmudKc4fBXQWd3Cg1sFn5xbITBTg8jnBwZ/
 zwHRX9grc2B4ibOhyLZi4BffWNTX4F+hNMFE205KNscdztX3hFH8VdgVThGOGUYxe5KP
 Z5DgF+lOVfLGuNaiIvUfjtoI7Yo/F15v+WhpryWbBAuxxNlMXwKGwB8rpM8/B/5dx0wy
 Gzv8+w07+HrNHUyP8YwkmAO7sQKWA+9uogREHjvfecpmg7J+1qU1erxakYIqd4Wp2TDX
 Q1ClVAQfKG2anW7wZ/nycMM60FHAbnSvXlsDxsIMnt6Zp9r+go4Ql5DbgcIYmW/XfS3d
 eApA==
X-Gm-Message-State: AOAM533aPD55rwJRPuAyuv8/lLChHcfd9ynajTIjTUT6+Hx/hcX2fVAh
 Vp926Fwa5ThY6HvamvyFRv7hxyFEu5w=
X-Google-Smtp-Source: ABdhPJxTKSIrwradULvMtxPWqF8Yp2IUpY05fkYQ/+qpXKS2Kg9LMtbBHCNcm2Rq4fFxYQMDA+046w==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr15152859wmg.17.1639861445365; 
 Sat, 18 Dec 2021 13:04:05 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 by smtp.gmail.com with ESMTPSA id l8sm15470986wmc.40.2021.12.18.13.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:04:05 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 22:03:59 +0100
Message-Id: <20211218210359.2092979-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: rename the
 stm32f4?9_disco_defconfig entries
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 494807e28dd4 (configs/stm32f4{2|6}9_*_defconfig: rename
configurations) forgot to also rename the corresponding entries
in the DEVELOPERS file.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Dario Binacchi <dariobin@libero.it>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 61e3ea4381..35f3be81b8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -529,8 +529,8 @@ F:	package/tini/
 N:	Christophe Priouzeau <christophe.priouzeau@foss.st.com>
 F:	board/stmicroelectronics/stm32f429-disco/
 F:	board/stmicroelectronics/stm32f469-disco/
-F:	configs/stm32f429_disco_defconfig
-F:	configs/stm32f469_disco_defconfig
+F:	configs/stm32f429_disco_xip_defconfig
+F:	configs/stm32f469_disco_sd_defconfig
 
 N:	Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 F:	package/drbd-utils/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
