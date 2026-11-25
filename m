Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B51F606A321
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Gv8qvgxr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MNfsFyPp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4272E40879;
	Wed, 25 Nov 2026 16:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgQ2GmOT-o0C; Wed, 25 Nov 2026 16:41:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4138640847
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795624910;
	b=E5+eKgUbM745xl8+zG82TYhNkW/tnCXcEZTkoEcoboui5vmmTkXeUOt4ZMWlFQ4dO4OT
	 WzvKKzisN2KK2/PC5OMKAC42nL39FngzChVKQ5kaGuWtVBY08wNMwYZqUU89Wgxf178Dy
	 NfP0v5h/qghOApn+GNu+vhqPFnDhHtrSmGdbb6DYeCGnNy3oLcxrgo4nXkh5hicbgYoZB
	 skgBuVG277N+esPM2XVdZuT0ZnL9D11dKYWX36r9H3vnvbIquO5JZLDlt7a802pLHmd2T
	 tWt54q07RkwNcQlIvDYptgIcOs0uQ0DLAfVvi/Ol2xdTvTD5GI1vSky6D+rq8aJQKyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795624910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=eimGOtelt8YXOZyIpiqKdg51RgOybDytAGxoR4246/A=;
	b=eTykSWzPdYxnXDFmRvKSbcy82Yyyscm55lwV8wuWDfxmK+Xb4n/99k6VDD0uBi4ve+pp
	 XSBb1S0yHjP2aXO6tu5KSN0QZIitR41ikrV2rSG1QpTjyBuktfHrvez9ZPOkWBl7/9y6V
	 38MRaPP1J0ppQLf9ajx9ym02L4iX178CuB8UJoUwlh+gc429UGx2DqyPbzyYfsqJoyIem
	 k9uUFi7AgTt02nD8c4MpwGFEQH3fVmNVle/hXT+0CzzDFHyQk1Z8xwAu2AFkAsDsv4riE
	 diQY5fT1wqrH7ulnoB/MNeDgRTbGM9K5jT5wsi9pGkKnz+Smqf9WbUOtMwatCsN5aGg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795624910;
	bh=eimGOtelt8YXOZyIpiqKdg51RgOybDytAGxoR4246/A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gv8qvgxrfeA5L5JwHLnTRb631yzFNXGhDCkXWvkJtoYHMzl8ZOZf87tZVSfog0rYA
	 E+X+ETSggwYB/aZhH7vqj2PMMkRCxWynZnE0JUZjt0QVwD80uL8rrvBt+pCPwpcZbn
	 YptIWs/WubEIdyhRosB6fA2ffsoqGlGHxrI6barX9KrN9v2Dx9yHVWU26JJQi+vTSh
	 F9QO2p3oLiV9hHX5l6VmRmm244imiX8PuIzx8+x/6Eo4SBHNGwwVuUjFXPWUxtSiwC
	 qXEyTZwHg+9XE4/UHPprDM6ZoT+8IWStJN69gxRdpHEL4B9QSNf8ff8Bsa/apDsBQd
	 2XpMvmJhuuKQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4138640847;
	Wed, 25 Nov 2026 16:41:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E330B32D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C997D80E0A
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZbXboHqSwOb for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:41:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E59B480CB8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MNfsFyPp
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E59B480CB8
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:47 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so48567775e9.3
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795624906; x=1796229706;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+cy/GvpVzNOjQFuR/ve+K8w0DORWuU8U0pu3xMR/P50=;
 b=MNfsFyPpRnKktoPI1P2GaYhFZ+w4D/dz0mFkOREFqDQe3dQOIZpfsYtYKjOILTTacc
 iQqr8bcuF1MOpJdcdg7aaxKLTeHq17f6FmGa2EmpNI78FKm4AImpgW5tG2BHI2SbBWMD
 cDQuhLRp/N02iknnVfrAPIX3ioB8F2ZPxWozE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795624906; x=1796229706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+cy/GvpVzNOjQFuR/ve+K8w0DORWuU8U0pu3xMR/P50=;
 b=ffTd4AP6lxczaQOflOUHsKzwNz14M6Fxbbgj41c1iUzE20fr2WxIWW1D9LlP3+s0tk
 J6dyhMPlUY+vYdLxIb/afu2yCtgHPi6y3jOfNk0UUBDMccnG9ptthTMiJKpxohngjkdY
 dlFZ7Ckiqq4K0srdNE3U6LE+Tmk1w4FTlfpeCQ7CW3yY9NX5f3gDpQ5pWfYULKIQypMx
 nUnWRKvywlA00e6yOIlHs+ej7Ksl0qewaNQX78kOuHqtxBcG/Wfi1GIBBAN5McRr0j6k
 7xNZDttwjh/BXdaCKxp9PEKCi3K9MlNbLtbwB4sZmzenjHDdCfKAnxKag+FRzTtBOJVD
 rvpQ==
X-Gm-Message-State: APuU4Z98+X6eCHU23jRUh/A/6m7iNbCb25MCbdmxZmJdmBP0txpG2USy
 tHZf+5enEnxgQyNDjO+sa4dSxCxXRS/ycWBIIW1686/d/EYaeNST/M28NvcnjOK4U5y9ex5TvFS
 AoPl9
X-Gm-Gg: AZFdTZct+bwOVoMC+0w5ZzGoZJhBvxWioMCzHeGEcf4bEAZb56tjzvMqoeVWgx/onXk
 BYIY819vpaJ/2aGS0HUXjQD2eKCw1QFv/l4yWZFYUhujjRXZoO6dLNArLUbu7GpadMouvEInPIz
 e5MOTd/vSBrD/6ZoXlsOoWl8RPAgb5G6BizIa5vbN6lKltvuvTdKzC3BiW8xQN+ZtCRem+I76Jd
 Slq3zrJ15oeAjXu0/+5aR71iI9MXqD7r6n0bGxUQ8KLsO9kCw9ngpobxrJU3gxaK+TdXRk8rb2r
 4io5YpACSSODrY6RsAcQIMPu9KPwO41ZELnhNTYvO5bjk949gcId+v7EZa2nAcEHLfSkWtUYTNM
 Ik9706L1mv3CPfqhdIusqE3w5AAA2emSq8w5s9p0P9904KFnpJv7w9iYtKgc0b8sFKjMOklbfbZ
 DPvxpqEi3qxUCZpuP1ev61woRt4LhmQjIZM/xBZWSfL4j5c9i1NmoMTNtJiBofiMJy3DCCrp0Ym
 Vc2WSkcOFMNnyOcjbtzYU9EY8aUkvcvdanFjGzLsC3g6mfWvzv42eoPSd6xjRJ++4i499j+vNLu
 lLpQFZcK8qFe99B97RwmgnYJHfwrebDqOnZo2ySEUhtHkihBpzmv/k6u0oPncND7Zn3ZNGZKqzX
 qjJZ+SYDvz1teKTr15Egli3h8y9ZVegzV7JXFZOUCikWbUPPWEVrmtwQ+c7533edu0TMAcB3x1h
 CP8ZRPt+vCmn1GvJbp/2ZD
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id
 5b1f17b1804b1-4bb8880ac02mr352878445e9.6.1795624905825; 
 Wed, 25 Nov 2026 08:41:45 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067a0e6sm247988765e9.4.2026.11.25.08.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 08:41:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:41:26 +0100
Message-ID: <20261125164127.863713-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125164127.863713-1-dario.binacchi@amarulasolutions.com>
References: <20261125164127.863713-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/5] boot/arm-trusted-firmware: add
 stm32-ddr-phy-binary support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the stm32-ddr-phy-binary package is enabled, build TF-A after it
and point STM32MP_DDR_FW_PATH to its stm32mp2 firmware directory.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 2aaa7e3d19ad..f0de941f0a81 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -158,6 +158,11 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
 endif
 
+ifeq ($(BR2_TARGET_STM32_DDR_PHY_BINARY),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += STM32MP_DDR_FW_PATH=$(STM32_DDR_PHY_BINARY_DIR)/stm32mp2
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += stm32-ddr-phy-binary
+endif
+
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
