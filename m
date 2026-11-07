Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B023F606A32C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qWgADS1G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zfDsUVWb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FFD24070F;
	Sat,  7 Nov 2026 16:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67qsr9hm05w4; Sat,  7 Nov 2026 16:34:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4F4F3407CD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069287;
	b=ag4VYJglmH7yFygCEkzP3cRatyCck/1yTCY72rMIY1zXl+QjtNjHgkmzgzbXDMpsagFl
	 zHLT2zzJS3M4W4LZu0mCz2jgW37sSExOIcExfgT4nhhDThM7o4JZXf6DmtgrtXHnXgP21
	 9HVMeydbar4eOo3uCeQxkT8CT02bQoqOBzYZH5SaVG3/aFI1IwstikAQci8wVRtgMWYqu
	 rHM8RDS3N/IahBC4sNuL/IGZGMNyTRNqdsvcFzrWd7Q3v2fEBl2c6C8IJmoCwRES9eKcu
	 1eBYNnAaW4Mm/Iv0TTNPkSvqr2VCPG6jTmz9QB1e2NSKKr1JADko+RIy/9VGpqC5aJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069287;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2AI+BYGflTxUaxjTf1G7TogH6n3WWqL2fsk3RJ/6KQk=;
	b=DVUXQydCu4I9ZpZRrwzXjx1IGd453w06yGlzpduV/1sn2FzxudGTX91te74ldHpcQFHY
	 QDJLkiHgtB2/olo+TPhEoBnD6Og2gHRYV5g/sLm3OgDGqo+XgxJDhwtArgYvwSh3PKGQJ
	 cUAqfIaFpbNL0hQolelzParYxy8eSR6xVucEMaTQAM4unqK2B4owbwRzNRVrehqgHNdr5
	 KTuwK+Nm9xOcEXOKrxTMuuU5XO1CWpNTmuQUkFzd3aXVanTO4L2MJ7Vh6k/ffgeGlh9fA
	 mpw/pL4IY3S/C87EDKfR1H8I9nSXgxK9CjsNGAUXkCzQ7zBWrUCjeIVXog/iatTtWPw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069287;
	bh=2AI+BYGflTxUaxjTf1G7TogH6n3WWqL2fsk3RJ/6KQk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qWgADS1GX6SUeL+ZxfHcsW9xN91CZbVU3p55dMmi349A5qHStKwyKBSZVvMyiduVI
	 IGmlATnX6yhjD3JF51nfaDeK6lslTOd3HbEBiaBK9s811I3izbOn8YZaObFVSBbvZE
	 OZlZQOrtV35EWyxKnDmmWS6jTv0re/WwrBgK+tDapmz5SD9P9TWr7XzZVNViMqqQeA
	 EFArotefN9B+AQQLRYpXTW9l05GGNJ/fImXKvU0uJ0WrzEwXYqXScESxK1bpFQknJt
	 aa4K+Z55jjFpg4Dz5LR7m1P0w6uV2EXupcptPXvA3F2nlnm8AK3tGMKHUQEnO1RZur
	 Eb9q2KFyuOPsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F4F3407CD;
	Sat,  7 Nov 2026 16:34:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26336A64
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23C184009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsNU6ErTGyn1 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 40B8C400A9
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=zfDsUVWb
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40B8C400A9
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:42 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso13343435e9.0
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069280; x=1794674080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y+WSpqJOPkXBLOoV9QEYdgW+9OYV7TTCYGzWwGFaZB4=;
 b=zfDsUVWbuchz8WQXEScuRGXFWrZ0R+DHV8bA7qfcEglixuQD5Y5qm1+AtQeiN5YPIQ
 3g46S7ksMEsDeqe1GpJo4hPjeQmCV8JjXfyEo/Gu+QHoCcRudHgaC61KiTMYG3YD6fz+
 SnvmE9g1LhD99oDiyrNfHq/YHoNX8N1/ZshJYvcUBp7IXmk1pvZsYxHuU/lTKiC+eLMm
 pTzw0oiHlTMKzHlx/Wr8xxjbPEnbptBYWnlfjarHzR/3lEVQnUJ6K/skydHuAekV9UV7
 o/DOWsjBg9GdOZt7fS7+4crnTZh3XLE5lOrCGsJ0mEZAfFjMY4M8Gaw1ZaslEJYw5qCo
 X6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069281; x=1794674081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y+WSpqJOPkXBLOoV9QEYdgW+9OYV7TTCYGzWwGFaZB4=;
 b=txdfuf41JsKzQ24K9vI/dOyfTTIvYHxrgNmmCMNY+7aTfIplt16YjoR9CT0c7IunTi
 kPePJtzACLMOhhD6geuwWb+Guoe5JEpuT9ssLKlYsYpH0B+xR9JyWE6xdf2eNsJsvKuQ
 hRgIoQQCqUBrZoGTmcLjzX2bpufvSFdr+HzkZZitErNj6n/9KpOHb9cWWz90595m09IE
 0djVcsibYe2FqTG9/taP+NrOatIArkT2eEiSz4430x04272wUo0o4dSfgyTfre+6j216
 8VrcczNt8StTCiJjf9fhiP/xMBiRCYJWVgGrnPTbcTnjIeu3O1pRJhnlq0ld9+JUvqYe
 kY2w==
X-Gm-Message-State: APuU4Z8V+/BGBzaePfoaL1FYHQUOFpsVRlSTmYkKfIcsvMfcjbqbE/D4
 r9sOPi16ZcdKIxrPyfdmhJ9bDKoUNi3VcVR4O8gWecZWTjttp5Y2K6y1P1oWrky5
X-Gm-Gg: AYBFou1DyTN4LvZii+xnDrnAWTvWFXrOSdwl+zGyMPoWpry8CAVZYelysVP1vGN0nH5
 vT+Ii9aaHsc03xBXl+hCi1WY4Th0ivKJuzP9z9oOAgpbPG+BkRV8/kXDtzM4QMGzhq3uiLEiKzM
 SuCD8mgBd/YKR7rPGaCtNYv6vC/QOHFMgTSrHReBpZMPC1MP4mzNxNI4f7iKbvDT7437cuawnQe
 C3cR1Zko9Wo5RP8OXYaUv5oiWuNDEpgaP279n4PJiEqjAVQkce7IMcGqRjqnoyr+44kLfcKfYUp
 mil9KXiesFKxW0ppCaa7yjX+204t0fg22jBYZBGCjBlAJRjx3d/93qM1w6MAwXZuJkkZJfu7j6N
 usthd3OGy4/N78lJmOogTKGoRHv+OicpxrAb70vzm61mZgo7ocUtKU0ItwF/VA0HpuOHNaxS2E3
 8nGda75CJzXPnh263c8PQUkvGq+m2/WW1NURR5aeYKT2rDLcLPVv2AbG/WDcUEKBEMHYNv9+VJ7
 Wv85dvkOfJucoIojtKDC5f+JkzNqSRrojLcrQAeVi1+PG7usO8gbZVnnUIc2b7dFBCzWbcaokmx
 9QQ7LqfgX3k8LLpRv8drKKq5flLRcV6cvio1Hs3iYpff0544Qm1+
X-Received: by 2002:a05:600c:c87:b0:4a1:dadf:9876 with SMTP id
 5b1f17b1804b1-4b6dff87615mr102075975e9.23.1794069280535; 
 Sat, 07 Nov 2026 08:34:40 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:40 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:10 +0100
Message-ID: <20261107163414.560896-12-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 11/15] package/nxp-mwifiex: drop the unused
 make options
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

NXP_MWIFIEX_MAKE_OPTS, set since the package was added in 1c38699601
("package/nxp-mwifiex: new package"), is not used: the kernel-module
infra only passes NXP_MWIFIEX_MODULE_MAKE_OPTS to the kernel build
system, and the generic infra does not use it either. The module has
always been built without it. Drop it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - new patch: fix a file warned about by the package infra checks
    added at the end of the series.

 package/nxp-mwifiex/nxp-mwifiex.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/nxp-mwifiex/nxp-mwifiex.mk b/package/nxp-mwifiex/nxp-mwifiex.mk
index 019939d93a..c49fd0965a 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.mk
+++ b/package/nxp-mwifiex/nxp-mwifiex.mk
@@ -9,8 +9,6 @@ NXP_MWIFIEX_SITE = $(call github,nxp-imx,mwifiex,$(NXP_MWIFIEX_VERSION))
 NXP_MWIFIEX_LICENSE = GPL-2.0
 NXP_MWIFIEX_LICENSE_FILES = LICENSE
 
-NXP_MWIFIEX_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
-
 define NXP_MWIFIEX_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
