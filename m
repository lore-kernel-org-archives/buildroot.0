Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F517606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EDUnh8A+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NF5s1zbe
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB3CC4087B;
	Thu,  5 Nov 2026 15:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lU4T2bxgYOG5; Thu,  5 Nov 2026 15:36:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1DDB140770
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793893012;
	b=rtEfWjktpeZglQe+62SOnXrJUhUy7VsVFGd70UKj9CmdRn6kWA2fuCb23zz2Jnz+1Pxs
	 +LHxn8dFC91CU5G/yVjqXp7yG4qmFqcuR69ZoWLQIMzDW4LQIYV4LdBRJywJBRQuNI0VP
	 x89U3YGaPKhCyaZqy8rdAKW72yRGWmfi7AS4hYF6Oz+grsMiVOlj/9El+Q9lsQ3r598jw
	 vFP6uPPZIgDWR9OnBGCm8ONh13FPNAMXnTaVm13bT2snHiFC2+YNs7BldyQa9Nj5vpDIf
	 3/E7PWr5lKejrUYJTL6glrgs3NWwdbQrkFLNIX/0Qr0Tkh2ZZTfi5wbQpjoPlee7sxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793893012;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:Date:To:Cc:Message-ID:
	 References:MIME-Version:Content-Disposition:In-Reply-To:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ag/HBFefpl3EjFk+MWzdz4JCr4UX3+YfqAgmnOhT2gs=;
	b=rNDG9Hwtip9lmud6YjrOPl1eCJ8kcobYERMCC5lB5tiX7XZgDkS99JwTv8NgUigGZgdB
	 lCuWHc99PcYw3eqHxJOx8PInJrcBcD8W1STuclc65uwyjfEBfCAGeD3K83/8jlPXTvj6J
	 fs9Xg7EEGtppz/r4MfrP1yCxAMNXdc8NtgR1G9QQ2MLWAoKJLDcNuwMh0JnFVu/xwc3+V
	 TJm3JkaulFEkjMZQhXBGaKFPgx+uABQipBQbwVPJt4G8afU5Gkh98B6Xt+wFdk+sfnmq3
	 2rGpiuUE8kr9gqUIdDi9sN9nn6yRXvjx83xNfxif9TdhccsiANGSizS+OABaK2w3ugQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NF5s1zbe;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793893012;
	bh=ag/HBFefpl3EjFk+MWzdz4JCr4UX3+YfqAgmnOhT2gs=;
	h=From:Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EDUnh8A+ATHYYFpu+1J75/bsTvSDicJA0MShb1yPa0hloSTwNr6xL8TnWxqQlv571
	 o30YiNo2684feMUyxZaNlHtgfEM7tsex850ugIu05zJX8nvTKdXZ8sQatYHcF+s7QD
	 /+oD0HiR93xcAtT4ycMVGeTsBXLzZs1xnWDdGSr1Pq8DMEf0uqkFpGe/ZK+Tslf6LB
	 bV/GYx6bPqqEMTShFjVIAgT86Hsd4D5I7HmHUhzOXSWynfHMRpKQqkUJk5ifEEGkka
	 ml5BbYjshv7r/0ADNitIt/hwxfgCctewIJS2spaBVF7Buf4Xl2wEtmqDSerdoXzXLd
	 yiNl1b+yQmZEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DDB140770;
	Thu,  5 Nov 2026 15:36:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04A071779
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDF8540770
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UE-z7CtpBnH6 for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 15:36:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B946E403F0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=NF5s1zbe
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B946E403F0
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 15:36:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso15478145e9.1
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 07:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793893006; x=1794497806; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:date:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Q780qBKs9B1JeQpyJQzXdcECCLjcRFVB+Li3+ykxmB0=;
 b=NF5s1zbeOCc/pBDsCyYM3wG/MU/apSuM78FSuWGdISFe4bOm9kKcCJIdhEM6UAVQIf
 KKe0o9eIQzQdGrcQMbL1zQiWr6M6eVloIvgIIAusdittvSDJh6b3FJHgOqE6kBSiGUiW
 XHk7QlP994SxxgBnTBUo7ODlyztmRFy0q89A5YlzsA47C1p2YV0bDAaNOvYEZ6cpsjeq
 lcQK7AMtBGNUmOtLWnnI58zO6k5lH051DhTcGz+HTlGFEISaiwDbwLee1lbfiuBiq8QF
 Xd+qz1DzmSEvTEIwPpPx7op2oQ576dPgbK0WrZHTj7dalY2hsRYtVRIQLQaqxEIXXENh
 zjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793893006; x=1794497806;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Q780qBKs9B1JeQpyJQzXdcECCLjcRFVB+Li3+ykxmB0=;
 b=okv5PdNfxMH8wTfCCiC61KpanaKjU6WCRm6mw2pZJO8nCGX9lGAvoBdtWbzAXhAfMp
 +fukDnkDk4J8Sta5XA15dEGmM06m0x2tKI2zmpQ/GT8+7BQjveb972UspJsnsUxHQaVt
 Kxsp4NUHjvM8ylvjF1G1Aa3pXxO6FqIZEgPlYxT9huiTc5TI0JteJEHQe1rNd1xoG+H8
 soeATV96h3iYduETWl/mmaFCl4oHMx6a0fxn1R56ZnagvSHvAsMN04XZUED1rQDfTZ1F
 Jb3cZ6lMUEmhnnUZHbaVjcOq9uNWqxJpVKing4Ey5Iu6U24YrOrfVbhySuz3n4oSXawU
 C38A==
X-Gm-Message-State: APuU4Z/JKiEa300wsbesmCd3UNTEDVst72HfslMsJ75vMl626WONLpBa
 89qH54j70rcL9jYs767+2pt5KDvHf0eOuhx54bsS5SxXPYcXKr9mNi7WYE4gzjBN
X-Gm-Gg: AYBFou2COTymC5ZFVCF0Hy0D7JB54nzwZjL1DB+kPGuaEyd1c3iLUK/VuGr6Dt3h4tu
 9BuYO1SalVAkrY9YgNi/4gHWSAxFCcNDcItKmxoFwsA6GU6EtBb0XUa8OBSHWAuIaODgi5N1stc
 B3JSV6Y+L21sFov0enz4VTkaC0JeLxmuH+gcTcsCmiZyLscCn6qt6hNQeoA/KzNBb+A1tybBLpG
 tZemL4zL4Pxf00j2BeunFd8MetDRVWezBQ5IpwEB9TLInxW48y4aKKLKUw/UktLadVw+POPzF5/
 8ccV5LSTDZE381lD8pZ2AWSYwjaoxq9wIRepvptEzaCeLnnv60jQQLEoXhEeJWEXAzG1eB0T3UX
 t/d+1qmUxXVyAepwpMGpUNercy7/1jmpkTiZfpINHykbNvlAOSAAqvOH5SA2pIsehYDJ1Ne7yXW
 oPGj+6i0NMXGdPwoF0kv+GgsPvz9FTI5iD+TuLsW3vEY2UY49KJIG749CYn4oXlLEtJu23fEBAg
 dMVEZxZNN6/YmQpEhYOlB82Wzc2glNbbr0OxEbEvg8vyFHCofmbSZphv83/xhso/GC74I4BXAlQ
 gXUpT47UGlpKNtfwWnEc2hHznMmliPIYwHddY3jcOuF4gu0IBT5xlegmV8GqsHC0svy9icKjjtz
 hiG865xd95hMJgmCqDeK/oHpVZg==
X-Received: by 2002:a05:600c:4704:b0:4a3:12fb:1ef1 with SMTP id
 5b1f17b1804b1-4ac18992a21mr389765065e9.29.1793893005567; 
 Thu, 05 Nov 2026 07:36:45 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b5725fb0d1sm71297855e9.8.2026.11.05.07.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 07:36:45 -0800 (PST)
From: Vladimir Oltean <leo.denieul.yoshino@gmail.com>
X-Google-Original-From: Vladimir Oltean <olteanv@gmail.com>
Date: Thu, 5 Nov 2026 16:36:44 +0100
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>
Message-ID: <auyijJkgbV87YT38@leo-ThinkPad-P16s-Gen-4-AMD>
References: <auIW8EW-9Qo0NFXv@skbuf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auIW8EW-9Qo0NFXv@skbuf>
Subject: [Buildroot] [PATCH v8 1/2] board/lx2160ardb: new platform
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add Buildroot support for the NXP LX2160A-RDB (reference design board).
This is configured here to boot from the SD card. To my surprise, NXP
RCWs for LX2160A rev2 silicon don't have a pre-existing example for SD
boot, so until one is available, include the RCW through board files.

The boot uses U-Boot's bootstd framework with extlinux.conf. The DPAA2
Management Complex firmware is loaded from the filesystem during U-Boot
board init. EFI boot support is disabled since we use extlinux.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Tested-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Tested-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Leo DENIEUL <leo.denieul.yoshino@gmail.com>
---
 DEVELOPERS                                    |   5 +
 board/freescale/common/env-dpaa2.txt          |   7 +
 .../udev/rules.d/74-dpaa2-networking.rules    |  29 ++++
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
 15 files changed, 378 insertions(+)
 create mode 100644 board/freescale/common/env-dpaa2.txt
 create mode 100644 board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
 create mode 100644 board/freescale/lx2160ardb/extlinux.conf
 create mode 100644 board/freescale/lx2160ardb/genimage.cfg
 create mode 100644 board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/lx2160ardb/patches/linux/linux.hash
 create mode 100644 board/freescale/lx2160ardb/patches/uboot/uboot.hash
 create mode 100755 board/freescale/lx2160ardb/post-build.sh
 create mode 100644 board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
 create mode 100644 board/freescale/lx2160ardb/readme.txt
 create mode 100644 board/freescale/lx2160ardb/uboot-env.txt
 create mode 100644 board/freescale/lx2160ardb/uboot.config
 create mode 100644 configs/freescale_lx2160ardb_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f86c777c3..659c748db9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2175,6 +2175,9 @@ F:	package/petitboot/
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
 
+N:	Leo Denieul <leo.denieul.yoshino@gmail.com>
+F:	configs/freescale_lx2160ardb_defconfig
+
 N:	Leon Anavi <leon.anavi@konsulko.com>
 F:	board/olimex/a10_olinuxino
 F:	configs/olimex_a10_olinuxino_lime_defconfig
@@ -3499,6 +3502,8 @@ N:	Vinicius Tinti <viniciustinti@gmail.com>
 F:	package/python-thrift/
 
 N:	Vladimir Oltean <olteanv@gmail.com>
+F:	board/freescale/lx2160ardb
+F:	configs/freescale_lx2160ardb_defconfig
 F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-firmware-inphi/
 F:	package/qoriq-mc-binary/
diff --git a/board/freescale/common/env-dpaa2.txt b/board/freescale/common/env-dpaa2.txt
new file mode 100644
index 0000000000..e60bcdeac0
--- /dev/null
+++ b/board/freescale/common/env-dpaa2.txt
@@ -0,0 +1,7 @@
+# DPAA2 MC firmware loading (common to all DPAA2 boards)
+dpl_addr_r=0x80d00000
+dpc_addr_r=0x80e00000
+fsl_bootcmd_mcinitcmd_set=y
+mc_fw_addr_r=0x80a00000
+mcinitcmd=mmc dev 0 && load mmc 0:1 $mc_fw_addr_r /boot/mc.itb && load mmc 0:1 $dpc_addr_r /boot/dpc.dtb && load mmc 0:1 $dpl_addr_r /boot/dpl.dtb && fsl_mc start mc $mc_fw_addr_r $dpc_addr_r && fsl_mc lazyapply dpl $dpl_addr_r
+mcmemsize=0x70000000
diff --git a/board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules b/board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
new file mode 100644
index 0000000000..ac55225673
--- /dev/null
+++ b/board/freescale/common/rootfs_overlay/etc/udev/rules.d/74-dpaa2-networking.rules
@@ -0,0 +1,29 @@
+SUBSYSTEM!="net", GOTO="fsl_dpaa2_rules_end"
+ACTION!="add|change|online|offline", GOTO="fsl_dpaa2_rules_end"
+
+# Rules that match on objects connected to DPMACs have priority, and are named
+# after those DPMACs.
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@1", NAME="endpmac1", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@2", NAME="endpmac2", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@3", NAME="endpmac3", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@4", NAME="endpmac4", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@5", NAME="endpmac5", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@6", NAME="endpmac6", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@7", NAME="endpmac7", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@8", NAME="endpmac8", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@9", NAME="endpmac9", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@a", NAME="endpmac10", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@11", NAME="endpmac17", GOTO="fsl_dpaa2_rules_end"
+DRIVERS=="fsl_dpaa2_eth|fsl_dpaa2_switch", ENV{OF_FULLNAME}=="/soc/fsl-mc@80c000000/dpmacs/ethernet@12", NAME="endpmac18", GOTO="fsl_dpaa2_rules_end"
+
+# Rules that match on DPNI objects which are not connected to DPMACs, but to
+# other DPNIs, DPSW ports, DPDMUX etc. Below is an example to set up a
+# persistent MAC address, which can be extended beyond dpni.0.
+# DRIVERS=="fsl_dpaa2_eth", DEVPATH=="/devices/platform/soc/80c000000.fsl-mc/dprc.[0-9]*/dpni.0/net/*", NAME="endpni0", PROGRAM="/sbin/ip link set %k address 00:01:02:03:04:05"
+
+# Rules that match on DPSW ports not connected to a DPMAC.
+# Below is an example to set up a persistent MAC address, which can be extended
+# beyond dpsw.0.
+# DRIVERS=="fsl_dpaa2_switch", DEVPATH=="/devices/platform/soc/80c000000.fsl-mc/dprc.[0-9]*/dpsw.0/net/*", NAME="endpsw0%s{phys_port_name}", PROGRAM="/sbin/ip link set %k address 00:01:02:03:04:05"
+
+LABEL="fsl_dpaa2_rules_end"
diff --git a/board/freescale/lx2160ardb/extlinux.conf b/board/freescale/lx2160ardb/extlinux.conf
new file mode 100644
index 0000000000..58c2720252
--- /dev/null
+++ b/board/freescale/lx2160ardb/extlinux.conf
@@ -0,0 +1,4 @@
+label NXP LX2160A Reference Design Board
+  kernel /boot/Image
+  devicetree /boot/fsl-lx2160a-rdb.dtb
+  append console=ttyAMA0,115200 root=PARTUUID=%PARTUUID% rw rootwait cma=256M
diff --git a/board/freescale/lx2160ardb/genimage.cfg b/board/freescale/lx2160ardb/genimage.cfg
new file mode 100644
index 0000000000..f895a5ab5e
--- /dev/null
+++ b/board/freescale/lx2160ardb/genimage.cfg
@@ -0,0 +1,47 @@
+image sdcard.img {
+	/* Primary GPT table needs to be moved to a region which does
+	 * not collide with the RCW/PBI location
+	 */
+	hdimage {
+		partition-table-type = "gpt"
+		gpt-location = 6M
+	}
+
+	partition rcw {
+		offset = 4K
+		in-partition-table = "no"
+		image = "bl2_sd.pbl"
+	}
+
+	partition u-boot {
+		offset = 1M
+		in-partition-table = "no"
+		image = "fip.bin"
+	}
+
+	partition u-boot-environment {
+		in-partition-table = "no"
+		image = "uboot-env.bin"
+		offset = 5M
+	}
+
+	/* Offset must match PLAT_DDR_FIP_OFFSET from ATF */
+	partition ddr-phy {
+		in-partition-table = "no"
+		image = "fip_ddr.bin"
+		offset = 8M
+	}
+
+	/* Offset must match IN112525_FW_ADDR from U-Boot */
+	partition 25ge-retimer-ucode {
+		in-partition-table = "no"
+		image = "in112525-phy-ucode.txt"
+		offset = 0x980000
+	}
+
+	partition rootfs {
+		bootable = "true"
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..4b761bede3
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  atf-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash b/board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/lx2160ardb/patches/linux/linux.hash b/board/freescale/lx2160ardb/patches/linux/linux.hash
new file mode 100644
index 0000000000..f30030c86a
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  linux-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/lx2160ardb/patches/uboot/uboot.hash b/board/freescale/lx2160ardb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..38d54d9922
--- /dev/null
+++ b/board/freescale/lx2160ardb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  u-boot-lf-6.12.34-2.1.0.tar.gz
diff --git a/board/freescale/lx2160ardb/post-build.sh b/board/freescale/lx2160ardb/post-build.sh
new file mode 100755
index 0000000000..4042bf9c7e
--- /dev/null
+++ b/board/freescale/lx2160ardb/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+PARTUUID="$("$HOST_DIR/bin/uuidgen")"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+# Default DPL and DPC selections for mcinitcmd
+ln -sf dpc-usxgmii.dtb "$TARGET_DIR/boot/dpc.dtb"
+ln -sf dpl-eth.19.dtb "$TARGET_DIR/boot/dpl.dtb"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw b/board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
new file mode 100644
index 0000000000..4c4b7d9c79
--- /dev/null
+++ b/board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw
@@ -0,0 +1,67 @@
+/*
+ * SerDes Protocol 1 -  19
+ * SerDes Protocol 2 -  5
+ * SerDes Protocol 3 -  2
+ *
+ * Frequencies:
+ * Core     -- 2200 MHz
+ * Platform -- 750  MHz
+ * DDR      -- 3200 MT/s
+ */
+
+#include <../lx2160asi/lx2160a.rcwi>
+
+SYS_PLL_RAT=15
+MEM_PLL_CFG=3
+MEM_PLL_RAT=32
+MEM2_PLL_CFG=3
+MEM2_PLL_RAT=32
+CGA_PLL1_RAT=22
+CGA_PLL2_RAT=22
+CGB_PLL1_RAT=22
+CGB_PLL2_RAT=9
+HWA_CGA_M1_CLK_SEL=1
+HWA_CGB_M1_CLK_SEL=6
+BOOT_LOC=8
+SYSCLK_FREQ=600
+IIC2_PMUX=6
+IIC3_PMUX=2
+IIC4_PMUX=2
+USB3_CLK_FSEL=39
+SRDS_PLL_PD_PLL5=1
+SRDS_PRTCL_S1=19
+SRDS_PRTCL_S2=5
+SRDS_PRTCL_S3=2
+SRDS_PLL_REF_CLK_SEL_S1=2
+SRDS_DIV_PEX_S1=1
+SRDS_DIV_PEX_S2=1
+SRDS_DIV_PEX_S3=1
+
+/* Errata to write on scratch reg for validation */
+#include <../lx2160asi/scratchrw1.rcw>
+
+/* Boot Location Pointer */
+#include <../lx2160asi/bootlocptr_sd.rcw>
+
+/* Errata for SATA controller */
+#include <../lx2160asi/a010554.rcw>
+
+/* common PBI commands */
+#include <../lx2160asi/common.rcw>
+
+/* Modify FlexSPI Clock Divisor value */
+#include <../lx2160asi/flexspi_divisor_32.rcw>
+
+/*PCIe Errata A-009531*/
+#include <../lx2160asi/a009531_PEX3.rcw>
+#include <../lx2160asi/a009531_PEX5.rcw>
+
+/*PCIe Errata A-008851*/
+#include <../lx2160asi/a008851_PEX3.rcw>
+#include <../lx2160asi/a008851_PEX5.rcw>
+
+/*SerDes Errata A-050479*/
+#include <../lx2160asi/a050479.rcw>
+
+/* Errata A-050426 */
+#include <../lx2160asi/a050426.rcw>
diff --git a/board/freescale/lx2160ardb/readme.txt b/board/freescale/lx2160ardb/readme.txt
new file mode 100644
index 0000000000..6dfc3f592b
--- /dev/null
+++ b/board/freescale/lx2160ardb/readme.txt
@@ -0,0 +1,129 @@
+**************
+NXP LX2160ARDB
+**************
+
+This file documents the Buildroot support for the LX2160A Reference Design Board.
+
+For more details about the board and the QorIQ Layerscape SoC, see the
+following pages (notably the "LX2160A Reference Design Board Getting Started
+Guide", for which this guide serves as an addition, not a replacement):
+  - https://www.nxp.com/design/design-center/software/qoriq-developer-resources/layerscape-lx2160a-reference-design-board:LX2160A-RDB
+  - https://www.nxp.com/LX2160A
+
+Layerscape platforms are officially supported by NXP under the Layerscape
+Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
+common with i.MX), but has a slower release cadence than LF. The currently used
+tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generally, in
+Buildroot, the latest Linux Factory release tag is always used, which may be
+considered pre-release software, as it may contain features which are not yet
+documented, and it generally undergoes less testing.
+
+For the software Layerscape Debian Linux SDK User Guide, see:
+  - https://docs.nxp.com/bundle/UG10143/page/topics/about_this_document.html
+  - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
+
+The components from NXP are:
+  - atf (fork), lf-6.12.34-2.1.0
+  - linux (fork), lf-6.12.34-2.1.0
+  - qoriq-ddr-phy-binary (blob), lf-6.12.34-2.1.0
+  - qoriq-firmware-inphi (blob), static commit
+  - qoriq-mc-binary (blob), mc_release_10.39.0
+  - qoriq-mc-utils, mc_release_10.39.0
+  - qoriq-rcw, lf-6.12.34-2.1.0
+  - qoriq-restool, lf-6.12.34-2.1.0
+  - uboot (fork), lf-6.12.34-2.1.0
+
+Build
+=====
+
+First, configure Buildroot for the LX2160ARDB board:
+
+  make freescale_lx2160ardb_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl2_sd.pbl - RCW + ATF BL2 stage
+  - dpc-usxgmii.dtb - the default DPC file
+  - dpc-warn.dtb
+  - dpl-2dpni.dtb
+  - dpl-eth.19.dtb - the default DPL file
+  - fip_ddr.bin - DDR PHY firmware
+  - fip.bin - U-Boot packaged as ATF payload
+  - fsl-lx2160a-rdb.dtb
+  - Image
+  - in112525-phy-ucode.txt - Firmware file for 25GbE SFP+ retimer
+  - mc.itb - MC firmware
+  - PBL.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - sdcard.img
+  - u-boot.bin
+  - uboot-env.bin
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/sdX
+
+The SD card image can also be programmed from a live system running U-Boot:
+
+  => setenv autoload off && tftp $load_addr sdcard.img && mmc dev 0 && mmc write $load_addr 0 0x80000
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/lx2160ardb/genimage.cfg.
+
+Boot the LX2160ARDB board
+=========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the switches SW1[1:4] = 0b1000 (select SD Card boot option),
+  or alternatively, run "qixis_reset sd" from a U-Boot booted from a different
+  boot source (NOR, eMMC etc).
+- put a DB9F cable into the UART1 Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+The DPL and DPC files provided by NXP are not maximal configurations.
+They only contain a static description for:
+- the 40GbE QSFP+ MAC2 (which implicitly has MAC_LINK_TYPE_FIXED, because its
+  entry is missing from the DPC, and this means that the link state is provided
+  by the MC firmware)
+- the 1GbE RGMII MAC17 (specified as MAC_LINK_TYPE_PHY in the DPC, which means
+  that the link state is provided by phylink).
+
+The extra interfaces routed to front panel ports are endpmac3, endpmac4,
+endpmac5, endpmac6 and endpmac18. Among the more usual networking choices, one
+could create individual DPNIs for each MAC:
+
+$ ls-addni dpmac.3 && ls-addni dpmac.4 && ls-addni dpmac.5 && ls-addni dpmac.6 && ls-addni dpmac.18
+
+or a DPSW object to accelerate L2 forwarding between them:
+
+$ ls-addsw --num-ifs=4 --max-fdbs=4 --flooding-cfg=DPSW_FLOODING_PER_FDB \
+       --broadcast-cfg=DPSW_BROADCAST_PER_FDB dpmac.3 dpmac.4 dpmac.5 dpmac.6
+$ ip link add br0 type bridge vlan_filtering 1 && ip link set br0 up
+$ for eth in endpmac3 endpmac4 endpmac5 endpmac6; do \
+       ip link set $eth master br0 && ip link set $eth up; done
+
+Once the runtime configuration is satisfactory, it can be converted back into a
+permanent DPL file which can be plugged back into the build system:
+
+$ restool dprc generate-dpl > dpl-new.dts
+
+Using the device tree compiler (dtc), the new DPL can be transformed into a
+.dtb file and deployed as a custom networking configuration upon the next boot.
diff --git a/board/freescale/lx2160ardb/uboot-env.txt b/board/freescale/lx2160ardb/uboot-env.txt
new file mode 100644
index 0000000000..89090edb32
--- /dev/null
+++ b/board/freescale/lx2160ardb/uboot-env.txt
@@ -0,0 +1,11 @@
+# Memory addresses for bootstd
+fdt_addr_r=0x90000000
+kernel_addr_r=0x81000000
+scriptaddr=0x80000000
+
+# Boot order and network
+boot_targets=usb0 mmc0 mmc1 scsi0 dhcp
+ethprime=DPMAC1@xgmii
+
+# Boot command (MC already loaded via fsl_bootcmd_mcinitcmd_set)
+bootcmd=bootflow scan
diff --git a/board/freescale/lx2160ardb/uboot.config b/board/freescale/lx2160ardb/uboot.config
new file mode 100644
index 0000000000..e31254d62e
--- /dev/null
+++ b/board/freescale/lx2160ardb/uboot.config
@@ -0,0 +1,2 @@
+# Disable EFI boot support - we use extlinux.conf via bootstd instead
+# CONFIG_EFI_LOADER is not set
diff --git a/configs/freescale_lx2160ardb_defconfig b/configs/freescale_lx2160ardb_defconfig
new file mode 100644
index 0000000000..8678bb2df4
--- /dev/null
+++ b/configs/freescale_lx2160ardb_defconfig
@@ -0,0 +1,59 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/lx2160ardb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="lx2160ardb"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_ROOTFS_OVERLAY="board/freescale/common/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/lx2160ardb/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.34-2.1.0)/linux-lf-6.12.34-2.1.0.tar.gz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-lx2160a-rdb"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.34-2.1.0)/atf-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="lx2160ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lx2160ardb_tfa"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/lx2160ardb/uboot.config"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_QORIQ_RCW=y
+BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH="board/freescale/lx2160ardb/rcw_2200_750_3200_19_5_2_sd.rcw"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+# Minimal U-Boot environment for bootstd with DPAA2 MC firmware init
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/freescale/lx2160ardb/uboot-env.txt board/freescale/common/env-dpaa2.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x2000"
+BR2_PACKAGE_QORIQ_DDR_PHY_BINARY=y
+BR2_PACKAGE_QORIQ_MC_BINARY=y
+BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A=y
+BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH="boot"
+BR2_PACKAGE_QORIQ_MC_UTILS=y
+BR2_PACKAGE_QORIQ_MC_UTILS_DPC_INTREE="lx2160a/LX2160A-RDB/dpc-usxgmii lx2160a/LX2160A-RDB/dpc-warn"
+BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE="lx2160a/LX2160A-RDB/dpl-2dpni lx2160a/LX2160A-RDB/dpl-eth.19"
+BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH="boot"
+BR2_PACKAGE_QORIQ_RESTOOL=y
+BR2_PACKAGE_QORIQ_FIRMWARE_INPHI=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
