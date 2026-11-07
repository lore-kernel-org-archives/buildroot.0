Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CDD606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FQsuCmSM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iScrm75H
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A3078112C;
	Sat,  7 Nov 2026 16:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcyV0QFWrCDv; Sat,  7 Nov 2026 16:34:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B3EF811AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069285;
	b=ofKO7ciszHSmUJdaumagDstsoyjmhIknpqR0mACN7mXvFfih5+CCUroCfGXjpWwfTxqm
	 GyWqCStssBGjlzi9Q9a1HGeoO42NivX2OphTGOXGFyGoCnVCyH62EAPJAGs4E5iHVFcD0
	 yJwdiaIVbczc40pBFh2UEOHrWl2HMZ4MPnHCpK8usk2cg7ZPIRxvvBmryiQzkHdi9CS0F
	 d2M7h8Ya2fftdfjkhJtqA5qrTHvhAo5n/wpBjfRIqW8q4pWpop3JX41t5dSZhP/u5daBw
	 JW8QkexpQvIzU3VD46w7XWdJtSIlLFESIOv7Hf9iofTeiKc2b5TR5RylzBxm22AjaFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069285;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=gvU9vEPdqYdCsHIYLcl5sH/6LFywDCSwc0QrRT3osvQ=;
	b=qfDJhkdmeT2GumjwnICenFZLfU6sLnocfvlCx6iPo8mjGXFN1Kq+AQEMqfgpEUiMpGgi
	 rGavQRZif0JVTxozfXOr04D3V3hlbtF25O1edADzKgejDATbv+XvVppH84XsyYWQ7aiH4
	 OtJlWoAtEW8/LlCgPmaYc1WVxjbClvMi4X7nkn/8APRMJE/VuvlZl6tmBYW3IUoP884Lb
	 e6h5hr6CORGlKKOjo3UTORhTp2VQTE1ee060a6hDVJln+8V5nzI2iKDaH8Io5D9D7HFmj
	 IaC2wqdUlaueabpQSaCexhNsrJzU6hWcGQFsVMDc+ZdQ+CDupsXO2FybT0wexSvRH1w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069285;
	bh=gvU9vEPdqYdCsHIYLcl5sH/6LFywDCSwc0QrRT3osvQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FQsuCmSM2YcSRpj1ZkHWcP3hVCMyOcIZjHMqJWdRtRQWDbOvTw3bmcB6jaf2YjtAt
	 WbBohO/BFufTY2XBda+ieR2wtLx8IR47MWJPMMzfevnfnJD+lqhS6VXpDK7472qr5Q
	 ZzKNu2FhWK+ku9I9e/82Z8tiNyqgwR+MYAAsVNudQ+bue8QmjKHx9azlmi9cZ0Wvt7
	 A37XdAwaoHaw7u8+VZCuCw/KPuuTjFiaD6U6bgYTDNX41PoiUNzNI+Q75VghE+K1yn
	 1zGmuSFjLzgJSArWfOWSiZE+NJrnjGOfR5JwE5E4xen69Gznss6KEt4Tn6f4RI8ipM
	 n5Axvisb3bIjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B3EF811AA;
	Sat,  7 Nov 2026 16:34:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2513934D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15FB44076B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ry0dSng13wl for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2AD954075F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=iScrm75H
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AD954075F
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:40 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so14800255e9.3
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069279; x=1794674079; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qJ98kR5v9QIwM3K529B4SI75Wm7pVZYPBKPSygLCgIk=;
 b=iScrm75H9HCn/fHOQTLNDz4YRZNWS2pWz8nhHj+apR+wWMR4iVIGu4b+l0MKRRciIS
 N186InekpMDmRDSwf9W+3ZJrqDiQjIardWcwDbY+wKDFSViVZhJf+Ki11kGOuOY09fon
 jtUExHKw4xzxcKSKHCswv1BnEv9VbDM2f566zY/eGFPMswZ0cnwRdDDClbIAxy/X0aZ2
 L2tJIP3uHpzwu71R0m4/XopLa8FdUObqIrSPiBO2ugdTYrxzgNW9YnmbmlkNS8l21pkZ
 0JBxRQOD4K8qkF5HOdLrmxstZA2zpbHzzRXZz1qld1jM7MXN1ngcRDVOtbyDgVspSlLf
 JZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069279; x=1794674079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qJ98kR5v9QIwM3K529B4SI75Wm7pVZYPBKPSygLCgIk=;
 b=VAgUdWvW6cVQQE/3Ep2RcRLffgUjj5x+4typcIOwN3GgGrDnGMGhKAN/jN6hr45Jsl
 thSWf/mGbhPkDLBL7frQhsLzAi9b+J45Gux5YpCxizbU7LuYvWTvVgmflD4WkcT9XNH3
 MFdbYqtGOOU/VQeeO7JdPfTEyKdmZJAz3hBZ8Ff4ySOBw+hR1sQo0PdFxEXa/j3kF4dj
 cK0nC+y7+qXdT+8r4HRq2kby1L1CB0FCiBGaYVVPscwrcgjfxp0rIBjH0uGzyiJyfg6y
 SLIs+x4fFax9EB7UOPmjZGJoyUqdnj2uKX6ERA+obxllSB/nR1v2NmNgB6ANxSdSWggR
 b5wg==
X-Gm-Message-State: APuU4Z8s0fu+4lSf9s2zlU7yzqiAEMEv4ftsN1pyv+mXoaFj2gzo/0r2
 kSbygD1Clw1y+aPPJYWi7MSJPWbXFDI6U6itow8G71R0MHCStKDRoPGghfHB3YVc
X-Gm-Gg: AYBFou2D8Qy8YxjiveMthcxTKWInaSgleI9dIceHtoRXztA+VYa4NvQ/2fv7Iog6HVT
 oxzmcMvZuhcGKKqoFvXre6ndROaVs8sDHbm7DXbj7UGlbK6r+TwVXmkVD2+yXzJN+QaHbAkWAZf
 1fESkfBchf8CAEnY5X8rZRolbfTY379U7giZK0AaW/AUh0Pv1P1kB4vkxiFG4rqyYStnFLNHmYh
 9J+EmWzisMd5FTu/epAZrw1TgJxNbmxbZMJGw4pYDyohIDNwJdRrWJkrhxwLiQ1AO6vwKH1HcWx
 VAhit3ZgMb48XI8ppbzKbXqQ0LjzSs4MbRKJzFP1yBYalJxzuZmPnCZtal6I5a/M3yJFYSSPxiU
 Q1eYYeLIeEBVs1pWFpIKlkNuB2NpyBorFvbogrNiQyj2Ii7i2vLDMUBEdiMspoh7kBl5JYTnePy
 CZgWzoY8DOBeOQA7lwIw4cuszUbmbhPU4rFrighoTM4yktHTT4rVKaAm9/AnJXO7KkF9EX0v8rr
 pZb1gCYzKmSWYEtUlxQh++36FiMv1A0g9f19i78QfmDKwAU3OAbfxq6btC9Mj0kU54QVe8uXRwb
 vhvgIyTwZJp3GotxSKDZeJH7vcnWFPJckBevGe2sJtrf103DoF0h
X-Received: by 2002:a05:600c:4747:b0:4b3:6900:280c with SMTP id
 5b1f17b1804b1-4b6de3b17f2mr114434325e9.19.1794069278784; 
 Sat, 07 Nov 2026 08:34:38 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:38 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:09 +0100
Message-ID: <20261107163414.560896-11-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 10/15] package/mesa3d: drop the unused host
 Vulkan drivers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

HOST_MESA3D_VULKAN_DRIVERS-y, added in 250a4cd4cf ("package/mesa3d: add
panfrost vulkan driver config"), is not used: host-mesa3d is configured
with -Dvulkan-drivers="", since it only builds tools.

It does not need the Vulkan driver either: the panfrost compiler
installed for the target build is built with -Dtools=panfrost, which
already enables src/panfrost/clc (src/panfrost/meson.build). Drop it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - new patch: fix a file warned about by the package infra checks
    added at the end of the series.

 package/mesa3d/mesa3d.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f20f02190a..329d5c3702 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -138,7 +138,6 @@ MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO) += freedreno
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST) += panfrost
-HOST_MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST) += panfrost
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST) += swrast
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO) += virtio
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
