Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A11606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QdUHKGg3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GfBPMmjK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF21C81155;
	Thu,  5 Nov 2026 15:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jpwOW_NgzmG; Thu,  5 Nov 2026 15:36:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D3DA38115D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793892995;
	b=OOR4Po9D+BbdSCNisWA7EHIFm2medvJ4bYg29sQfxhTZgHmMDW4MKLQCY9URo6qog3J+
	 G4Yj9xO6x3UklrdXZCkJx3aKKpz6Et1R0jnLt9jhdMCwfIyi4qE9QJOZvzy3lckDH7OhH
	 QlIIzwyeexLAf7WfSKUhG7OgCtZ58fTkiVnvLF2zj3xTOg65gvslPmb0e16V6KS7B/YMp
	 sXHTADEBG6oG/Y17DtiEwpJcxqWbcPd3EQrQDqRbCM9d/swA/6zkA6JEVrH/MXce++ngA
	 HAHN3+SNeEoyEfgMiNL7WxR+3soTj9TD5+ejKv8hFaRO55mCnIWu6qiYc2UV4YrlW9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793892995;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hn2FohyzpzM9I6IYRA9lAse+XDLEJEgZA611Mz+2wT4=;
	b=EShCQyEWI6xExQ/XqDgqG8XQTIDntrYV9fFOeagypcdTTZN71oyR14vpZdZn//aLtpmL
	 hgBHXfQ7nMMK53zuZb3Gl6nKcWYXQxT5lk8D231BNpnO19ChX1rE+cRd2Tqd6PXQlS04T
	 eKARopq3fhDNOXsuWaD7jX4PTRhfAwdfcvCGhsCxl9wcB7zX8TMN5bUPrS2Mz4/r5cYe9
	 /nBC6fkMf/6muo4z2rvF0+ChFPZDM6bQtPnQjtazeKboGREc+lSow0Eqsm+RQ+WWVtoEc
	 EexDQh4CVJVE9unvVzM7DJU9HRgJKw+4bbqXykTZNCMxHkVUy6xQhOMFs1kkUH3HTyw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793892994;
	bh=hn2FohyzpzM9I6IYRA9lAse+XDLEJEgZA611Mz+2wT4=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QdUHKGg3omwelX0nFzjfaXLeFTTE7xg204vrCx70VrX0ZTCm27PNAlVrUlEhe5P+4
	 zo6kv4CY4PXpaljWLYh9PCxQ2akwNDoqHl3ST5cdJpPNLlTRmGzyrEbUoZStqeoc3C
	 KSxDP5vfj1cdTyfRso8lfF1zh6BP93CVbTfcMNhCNOig1EKijYfWmnqVY0NwCDqkT5
	 OHjbpVLQwVWaGNZ9BO4353Rb+UAh5qksHzw8GD3DCGBx5D18XtiUytBhl8hgSsN0Xi
	 vrWRAED3DLCT4+zGZe4nPZL2m6hRx7WLc34fJV49l7uKk9oNxGw8q6DNRZ7rf2oJgm
	 EW2e4owjGmbog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3DA38115D;
	Thu,  5 Nov 2026 15:36:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 933E6B00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8478540188
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHNGUDEyMLjd for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 15:36:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 94C8A4007E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=GfBPMmjK
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94C8A4007E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:36:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so18703355e9.3
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 07:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793892990; x=1794497790; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ftlhrPceYd71gVh6OfD7d359sIjsviv00ODvt0W12PM=;
 b=GfBPMmjKQy0wXnFaS39G0/gHlJKWrWz3mWtV2LKQvDQfCq5375ofNzGREZV2sLwNoI
 /Upn8GsxxcpLVRff1xy0XRQPEMxgbnnZjlR0TO0q6665zxqOFpe1t8OxpK5m76eO5U17
 wI9pnFXJyVQD7YWuTFmg6A2LtXaSxTPkQ515Yy7fBZZsb0XHZJK83NaLK9K4T6UhucgD
 pS+IirPKTdQQ1JfoqhRxaJWs48hGKlQBCtVfmvJV/Fitsj3Iq9/xIEgb+QtJ6RizGW9M
 ejMnH5sDJ6RM30UUgvVj19mGMcgBciRMTaLS+og9WB69aNytJPOqcmNQOlQp8zIYAA00
 Wjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793892990; x=1794497790;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ftlhrPceYd71gVh6OfD7d359sIjsviv00ODvt0W12PM=;
 b=gDO7Ox5LJC4jVx4C0xqD+nEBvH3walFgIbIl3OX1JDzX/G7YafIdZi1O7lLzsREBcI
 1Ba1Vs0vrVm2y6jpme/fmndsYlWFYPNK8admvEz77Cb05E5h/jq2viOkWTfcpTm4AwMa
 1WoYjMohwwmvSNFp70YI9rLEETPwT+7BMLDU7TJCPCSwx7eCjtWOTG50TvDbQ+NIHpKq
 svmM2SNNCyqRPgC5n0Y/h0rr3JtoOUCJ0M9fIFDaK2Zn+gSWa5v4B6AqMsrVDrANF6kn
 qLm5psK8yXA7UVC/6mHGOqNeJ4D/vMntEHJHDPdnEL8yhdoQiUVeQ6mghv0PnTDhal72
 6mBw==
X-Gm-Message-State: APuU4Z8ErNg3kQBaaRJXsvIp/wLoWP1bte7FNtznEQH02ZJJy4YKKv2E
 hI/R8t71XPj7umTwbJgvXk3D+bFSoada8ZMbSrurpLwGysfDucsW/xnPIQMYmtEb
X-Gm-Gg: AYBFou3pPadYjI7st4QOg7otWUXrVPOs9oi5oeGTWaoiyrNBAeQRBLY5vODcqSIOvHm
 4DvaWkgk4CdQ4BvCtEfa0AoyHtq8hTBkLCNIAcXH4eyWWNPy5vuu0Dhn3yOXEi/CA8y55pH3Fcj
 z4lSO//JtzgcljX6cLGE/5TcrH982B8pkKYghvJ6VgCKSm8dAIX3qoShFoH4ekm5nEWKesI5bSP
 jRQUwiIzX/+mcwraVOxUomVuBbSgTxamBsBEJ3jM3U4bGhuHafv9ysCHUAiJJC40d/P4aW+N4MC
 jUmUrXpB0oYlJP8NOKhpToqJ2Upt+pl4xhK3l30xrLn/Lfp2lYDfRyAChxYHPRP0zfhb7gv+8JR
 jXqB54MMjFGzGzxevzMoeCnhgL2127ezAkWG5ohvGhgyQFUXYvAKAe20i/+1ksvtgA1T1xZO/ND
 w+aAKGfALmAZorS5gYlM6VdmCMLTDAVAWl1ywD6nSo3Wm0QyDbqn88S9Clqi7ifYCN/zG11YDrm
 pz/yQvCqKYzszBipqVTVQUjhDvGh0xSkymfkEFcCht+B574cRhgooV597CDvOxfG2Fm2gajcHzk
 rhvhTn+otpeMhZaQy+2WY6MyfOHGAW2LVGl6jlH6GcZfcwFW8LuWNExmeQG8ceA8l+FC7ViKrmJ
 y2wMaYa15Cgwkt2le9UewTGderwRTt6Epg11/rvlsGaNsYmtxRljpjf29cv+bc2dD
X-Received: by 2002:a05:600c:6211:b0:4a1:80d8:aed5 with SMTP id
 5b1f17b1804b1-4ac17191046mr440791815e9.6.1793892989113; 
 Thu, 05 Nov 2026 07:36:29 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56e2ae73csm74719165e9.1.2026.11.05.07.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 07:36:28 -0800 (PST)
Date: Thu, 5 Nov 2026 16:36:27 +0100
From: =?iso-8859-1?B?TOlv?= DENIEUL <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>
Message-ID: <auyie4Vfeb0nzi5l@leo-ThinkPad-P16s-Gen-4-AMD>
References: <auIW8EW-9Qo0NFXv@skbuf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auIW8EW-9Qo0NFXv@skbuf>
Subject: [Buildroot] [PATCH v8 0/2] board/lx2160ardb board/lx2160a-rdb new
 platform and newconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

This v8 replaces v7, following Thomas' review:

- patch 1/2 is v7 3/3 with the DEVELOPERS entries Thomas asked for
  (Vladimir Oltean and myself). The defconfig is renamed
  freescale_lx2160ardb_defconfig, as it uses the NXP BSP forks.

- patch 2/2 adds lx2160a-rdb_defconfig, a variant of the same board
  using upstream TF-A v2.15.0, U-Boot 2026.10 and Linux 6.18.60. It
  reuses the board files from board/freescale/lx2160ardb/ and carries
  its own hashes and genimage.cfg in board/freescale/lx2160a-rdb/.

The naming follows the existing freescale_imx8mpevk (NXP BSP) /
imx8mp-evk (upstream) pair.

Vladimir, I listed you for the NXP BSP variant as agreed.

Changes v7 -> v8:
  - add DEVELOPERS entries
  - rename lx2160ardb_defconfig to freescale_lx2160ardb_defconfig
  - new patch 2/2: upstream variant lx2160a-rdb

Best regards,
L=E9o

L=E9o DENIEUL (1):
  configs/lx2160a-rdb: new defconfig

Vladimir Oltean (1):
  board/lx2160ardb: new platform

 DEVELOPERS                                    |   7 +
 board/freescale/common/env-dpaa2.txt          |   7 +
 .../udev/rules.d/74-dpaa2-networking.rules    |  29 ++++
 board/freescale/lx2160a-rdb/extlinux.conf     |   1 +
 board/freescale/lx2160a-rdb/genimage.cfg      |  40 ++++++
 .../arm-trusted-firmware.hash                 |   2 +
 .../patches/linux-headers/linux-headers.hash  |   2 +
 .../lx2160a-rdb/patches/linux/linux.hash      |   2 +
 .../lx2160a-rdb/patches/uboot/uboot.hash      |   2 +
 board/freescale/lx2160a-rdb/post-build.sh     |  11 ++
 board/freescale/lx2160a-rdb/readme.txt        |  46 +++++++
 board/freescale/lx2160ardb/extlinux.conf      |   4 +
 board/freescale/lx2160ardb/genimage.cfg       |  47 +++++++
 .../arm-trusted-firmware.hash                 |   2 +
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../lx2160ardb/patches/linux/linux.hash       |   2 +
 .../lx2160ardb/patches/uboot/uboot.hash       |   2 +
 board/freescale/lx2160ardb/post-build.sh      |  11 ++
 .../rcw_2200_750_3200_19_5_2_sd.rcw           |  67 +++++++++
 board/freescale/lx2160ardb/readme.txt         | 129 ++++++++++++++++++
 board/freescale/lx2160ardb/uboot-env.txt      |  11 ++
 board/freescale/lx2160ardb/uboot.config       |   2 +
 configs/freescale_lx2160ardb_defconfig        |  59 ++++++++
 configs/lx2160a-rdb_defconfig                 |  56 ++++++++
 24 files changed, 542 insertions(+)
 create mode 100644 board/freescale/common/env-dpaa2.txt
 create mode 100644 board/freescale/common/rootfs_overlay/etc/udev/rules.d/=
74-dpaa2-networking.rules
 create mode 120000 board/freescale/lx2160a-rdb/extlinux.conf
 create mode 100644 board/freescale/lx2160a-rdb/genimage.cfg
 create mode 100644 board/freescale/lx2160a-rdb/patches/arm-trusted-firmwar=
e/arm-trusted-firmware.hash
 create mode 100644 board/freescale/lx2160a-rdb/patches/linux-headers/linux=
-headers.hash
 create mode 100644 board/freescale/lx2160a-rdb/patches/linux/linux.hash
 create mode 100644 board/freescale/lx2160a-rdb/patches/uboot/uboot.hash
 create mode 100755 board/freescale/lx2160a-rdb/post-build.sh
 create mode 100644 board/freescale/lx2160a-rdb/readme.txt
 create mode 100644 board/freescale/lx2160ardb/extlinux.conf
 create mode 100644 board/freescale/lx2160ardb/genimage.cfg
 create mode 100644 board/freescale/lx2160ardb/patches/arm-trusted-firmware=
/arm-trusted-firmware.hash
 create mode 120000 board/freescale/lx2160ardb/patches/linux-headers/linux-=
headers.hash
 create mode 100644 board/freescale/lx2160ardb/patches/linux/linux.hash
 create mode 100644 board/freescale/lx2160ardb/patches/uboot/uboot.hash
 create mode 100755 board/freescale/lx2160ardb/post-build.sh
 create mode 100644 board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.=
rcw
 create mode 100644 board/freescale/lx2160ardb/readme.txt
 create mode 100644 board/freescale/lx2160ardb/uboot-env.txt
 create mode 100644 board/freescale/lx2160ardb/uboot.config
 create mode 100644 configs/freescale_lx2160ardb_defconfig
 create mode 100644 configs/lx2160a-rdb_defconfig


base-commit: d1fad27e965805c0e4e201994021cd9acf48b0a5
-- =

2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
