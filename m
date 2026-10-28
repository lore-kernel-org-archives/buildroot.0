Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D68606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OHZQSHSm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D34409BA;
	Wed, 28 Oct 2026 21:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02_8o2Vi2qrK; Wed, 28 Oct 2026 21:38:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03223409D4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223530;
	b=VIUBsmi44LzFEn4MzrnMA0nZqlx4zlzALa+0nqDG3f5HGvbTCVikNtUsJ2RTWk87YUoD
	 IA+i0G0azEfdHZ6Ff9SG/RovkC15kcKcHzfR9eQdaDSKgElpQCvldSetxbWB1HFljS3ul
	 48GtDLui7XgnDgWBpk34JT4RA72wmadhUBDQGqoJtV0aV4hfpbRzHLfhwiCzlf1svNdmc
	 esimoDkH8auJ8cg6rcDUYNxfTjqqJRv1Oj4mIp87FlU1KrgDHsCzK06ExPn/dJYuNQZQL
	 qH1vHC/uf9rTBxzHhbzgg8BXAQbpUjxOJ5RotsFGbUzUZ9TWCMhVjvdh8T7w7lmKKRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223530;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=456WSVR1oOtPpT3ll9t4WcTVXFzOvEZ36XjhK6yQWSU=;
	b=qR7jxd+i2QrwEayOVJJZvXEVcK2vOmkRIFNRgDyYCyrGzCbsX8oMUE920N34ZCBX2kA9
	 SzZA0z1FKbdKI6okSioSNPA4v/wCPsHZk2qDj1/3IC4TurCy8OtZc8g1ukN/+A+2KHP7U
	 AqINLkoJMV+NeHrqjPO/IvVHN7EilV0FdpKjX4AjGDS1qITgIwVTy0PT0ikSdOAIlxgnI
	 t7eLveVF1t6Zg0DqWpekIlQM1EdhKVTbAVJ5zb3S+fwvhDqWeFAu96ntS8daD5RatWw0b
	 fPaKGjHAIPjZwbPU/r7D4nelQZDaPQlJ2Py64bEXfhIqUY/vpN164XWMUHvYREjs/dg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223530;
	bh=456WSVR1oOtPpT3ll9t4WcTVXFzOvEZ36XjhK6yQWSU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=OHZQSHSmqJTfbMT3mTmFOHplgFAPVqEPz0LVNyE4ZUNai5K7txoPrXpqVIJyhQSGr
	 ++5LioVXdbq2SBJFp2nHq0AL4rkMN9js7YyP3LTu35bOrLHReMZ7gfkbDWvWHAN/k5
	 ghaPxyRBrvx4obQmF/aop7ESBi2mQ9ea4EVd7B/99XYJ4W9A1Jj/8u/YOxXASU96+7
	 Yq4JACi3+ZYyNiSQElBEUjlskhr20R0Dz2dDwCvpoLzJ6h9AtgUDlrMNWmUOJq+tCo
	 XrxCdiT8Y0Rb/5PWr26frbNe7UF4f8sUoEF2CJqJwf5VFpZ7d7H1aLFyuButjLmorw
	 tPXHs69Byh1RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03223409D4;
	Wed, 28 Oct 2026 21:38:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A61B235
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF756405E6
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDGU7Msgq0oU for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:38:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B16E94043A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223526;
 b=mGs8VXt1z65x0fhB6TKoy1it4IKrrt1C/wjmowL3WC18ErlYTWs0FJBPkAL7eJZmTEWG
 iSwDnrlqwRUwbNS5UCIXWTnS2dYpdnEkYcuFu2Xw7blLQpbcvAucBSOBjufq/2ixgDI3U
 mYwVS8w/pRa1sWJb2MaRul1iGcEbMNxaA7skegNuwMCzpnY/hXHmoMjSytu3eLFUl0Mv8
 iEzvt8fxKQp2COyTgFEXhSAPXB/cAylSJnAyUdiKgpgUDHWHgA4y7OvfVlXUIoqeCoAS7
 y0M4QVxux2yvF8pQ55eVhZlIGjID8oJe4vJOoEPKeWAhS/h1EtgqsqQy7StbdPvxSkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223526;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=GaVzaajZX8D36kryFeRRQoMUOjMo5kxgQhj8Z8UT0l8=;
 b=VRDyJLQkxudmKcs+T7R50lUodLTHlpR87l2PnTxtltLavtvf3eBN370eDnlDHPrUbGjS
 bH2vUevWQCFuIzNTgfYDvJCgW60E+7gusApBc2s4zmHo1JA0D73xpKW5pfDTD3ejspX40
 TADvX1XF1kswHvc7muE5bwQy4LUbmxuf9G0apS8VeH28SxInzz8dtojjEg4Ah2XzLZOEG
 23UQ1zia2AnRrUuWTx0Dun9j0/rRIZanoUofCM9Xejne2rh6LuVWjBeAbNi6VKR/ILweB
 FvljDnnBeXnK0xM5263hyGhqvukvLYFLEStWyaccCcq0Yj8Pca+yIRNnAFgJi1MDJDw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=FSWgvQ7N; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1064"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1064; helo=mail-pj1-x1064.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1064.google.com (mail-pj1-x1064.google.com
 [IPv6:2607:f8b0:4864:20::1064])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B16E94043A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:46 +0000 (UTC)
Received: by mail-pj1-x1064.google.com with SMTP id
 98e67ed59e1d1-3ae1b34e0d2so52523a91.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223525; x=1793828325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GaVzaajZX8D36kryFeRRQoMUOjMo5kxgQhj8Z8UT0l8=;
 b=m6jdzf6uoBj95MFpfipojcxRl6btTFYGioLMcELEfjYXyO7Gc2XKYCQN3YYT5Wz2Nt
 NCg0DkwL4D8brNmtNMGy3oL/GOdu14B0eEOgPMdiP+6AwXequwYsums2BXalzAtaj9OM
 +St7P3Sx+8WLXoI9JsOaFBlsOxttemb+w+ajcjvttajj+/O79PKjgAQc5abAuv5JMDrc
 XZi2NfBliVe7iBbQYEkkjdfhcf9z3WIAJo+HxoRdS+0L6C3BnKXRhGERMazlRzd3XIKx
 eXQ/jle8Uez62wF3Rg6DbbS60RXcylcVSzeciuWiqNg6oiPYH3XHxro3AeyABYwYip2i
 rtIA==
X-Gm-Message-State: AFq9FYKhH0bCMtJIYMMZZZH9AMMnpRvl8mDwGvWTBUOv0teGWacQxDrz
 7+j5BQDAHAoVR/JbSmT2gA0AB5TZUMqsBaXR4/KENuVGLvqxAqp+UUGnEEByflhCp8Bu1jVdOTW
 OL7J0sc5GCO/nNh59/g9EbFXHEPIdailh+zIOGvtSm2dTSDnwHa2e9dICz9L1BCzjao2HF9LUiE
 O+iPEm6rvDKQtDlTgofk4LWIB9yhTL38I+xNkX+JJEjATEACl6HlCibGg9nxTtyv5sgAYoSKbck
 v7tENky4rJNMnPMeg==
X-Gm-Gg: AYBFou2xlz9xdoC4DAzlNfgJpQWffcHBbeUuq/oahPHc8ht4qoKnMo7gAeLa/hY2DvJ
 Rgtoybya46grMhBYlz0vZExBy/+A8sD4lqHEoq1XZL3y2vYFFGeohmaxzRfWrscFR9x8tc4S0FT
 OcMdpOme3nPa/WdciriZdYoyWhHwfkaRhx/AM9g6JshU4pygl0hg61n5YTdrt5vdwhVqD9rrQSI
 qkYTBon2f3W3PGX87dZjrEnPv1uqYgwWunv8sW+33/MYuVfNRTdTXBVYgkmK9hQD3zCwxkHdgLE
 I1VeWMjyroID72ByLfy7Ha2//keZDaxbuQJAhIshVxKVi1BBqNxrKJey/ahurV6tqB7PtT8jYYH
 BBTOyN37n1t81dp0wniERCX/AlM3HHNQcA6y48Hj6IiDYsbY3WMlTiGI+Ymo7PaG50HqZNgwEtR
 GhBRPFvLlhrcA6JYQNii6iyEeh/7xobBVxEQkHlKCB
X-Received: by 2002:a17:90b:57e6:b0:3a8:786a:cfed with SMTP id
 98e67ed59e1d1-3ae6ed88ed6mr401360a91.37.1793223525299; 
 Wed, 28 Oct 2026 14:38:45 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae55d5f391sm1125219a91.1.2026.10.28.14.38.44
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:38:45 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-9179a2035a4so2249236d6.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4cce:b0:535:ba01:d95 with SMTP id
 d75a77b69052e-54120727195mr12223211cf.19.1793223524097; 
 Wed, 28 Oct 2026 14:38:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4cce:b0:535:ba01:d95 with SMTP id
 d75a77b69052e-54120727195mr12222651cf.19.1793223523344; 
 Wed, 28 Oct 2026 14:38:43 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-538394c38easm114397821cf.7.2026.10.28.14.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:38:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:28 -0700
Message-Id: <20261028213744.511429-8-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 07/23] linux/linux: LINUX_VERSION_PROBED
 should run from build directory
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

LINUX_VERSION_PROBED would be constructed from some configuration
options, like CONFIG_LOCALVERSION, so it needs to run from the build
directory, where Linux' .config is.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0323ef5ceb5b5968eb9f6f00cbe26cf089a4d252)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 75294cff1842..a90e09afe906 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -197,7 +197,7 @@ endif
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 # Filter out 'w' from MAKEFLAGS, to workaround a bug in make 4.1 (#13141)
-LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
+LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_BUILDDIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 LINUX_DTSO_NAMES += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
