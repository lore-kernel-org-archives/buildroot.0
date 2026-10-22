Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A1606ACD9
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UlV8EQLb;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JZAN/EDZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C578D406CF;
	Thu, 22 Oct 2026 15:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yc2MeoRpzQ0l; Thu, 22 Oct 2026 15:14:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2B0924072B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682063;
	b=ej0PfFkuxn1KiAr3kt7+5f+sn54aqVyfft1EzeFED4lF/IMsDmUuWg0MIk/DMG1HxED0
	 AkKz2O4AhTNxE18S3FXeVJE0YLxcWMRx3Wa0bMBPnyGiChBLKvN4Cpf7YUt4BvAW+WmlQ
	 mNEs23535YICsyOMkzJGFAtOZvZd7E2PUseEvnGvtQjDZDXElq5rXPSFdy0hApf3qng9T
	 YlXDpHXxgtYAcyr7bHMtYgUFfEZnE/M0EULdiahr1eTAotiqaxcqf27KBB44VMtRAPRiG
	 Ann3kv4uLaBN1Amc8iJZoG8SPqKOv0fziWOJyNz4zlqct3kpoeBl+P6+aWFTrwh9wHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682063;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=3qrjmMlUzB/RHyCbacY3cXrOdUHrTvI1NwPjG0yA7ss=;
	b=soFC8zwV576uszHrrnFdM1HketQNLWbbY4ovCWXGRD+4FuQVe7VXjKeNckqYbtVuQ5QF
	 7v4HH9MIqr2uPv5eYFsbHz93h8YfBUUj3Z+Eimh7/Lv9bzdAV6ydOq2G+EtvMqQ3gYDH+
	 sZh7lqhPikVl7ypBC6n7O9FGBd69LBarRwcHoyyfssFj64qDjzOX4mIlfXIQRn3NDWrAV
	 XvwxZccc7Jf8TnG85UTgL9SfzG8/tci9RLpLQzX0kW0ksoHC1KSxUYRPHBNnO2IuDcvNG
	 ABSNujWTl4eoRKs7ivvFjKr3UXuMFC1/t2rXgFoAXVvr+qhx1pyEnqlX1ePwX13bmwg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682063;
	bh=3qrjmMlUzB/RHyCbacY3cXrOdUHrTvI1NwPjG0yA7ss=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UlV8EQLbyUzs+2exKm18dTVmvFjEBi9SV+8OTtxDi5H+AoN1bmG1w5WonmK9nEEbi
	 AuYACnnuFl1+FjLNACBIwZqCLCYRSpf/r8uDsy79wJuUkymfwp4hhE8n3oRjlfQYU3
	 DHEFi8QtlFvZAfZDjrXVkDl3vgGhbJn1Lkn9HBhXqHNO+M6/1HK2EiCyymBs3eVGo/
	 2moLTWD9BLfOvzDlfYASaf6CKPw4cvkhqDhdrLk6SkuXaq91kDM/yJCdcw/MyEX4eN
	 6bnjpPaGDYLtOz/0JiTty+eVDTE2qXUPnyYOJFHVuVm00XeMzfhkDrO6nUzTyGqRRp
	 E4xWivnsy04NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B0924072B;
	Thu, 22 Oct 2026 15:14:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B73395C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7199640082
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHOS3wDdGH7U for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:14:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8CDEE40024
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792682055;
 b=U34nt+HOpZPrb0PIXGU8cYM8qZx7/o1g4+DqYPUfCfvVf5oO18OnNMM9+5P5Ud9v+tdZ
 r/89Lkhy4OoHiJoYMFLBE/IZFYW2IObWYaf4UVnXz2lfYHVQuztZudVXMpRrSYyAnqdZM
 rMZsTKGPqAaiaUsLcGdCj/O+E7Hq1rRPtkCZ0o+O0rp/pzelCdV9kpvxMlxAsqp9xzWFE
 6xFdzEu7l/MqWpDAo/GEB+gwR2bs9cG9fgApQGU7rsBu3t+VcWQ0p2i401QYxPzIWKpsk
 7VC0tlUwUPS9qb9KW8CsSErHd8A3cybRBMIQ1oVUQrYia8hsEZGxE/ve4sY9fC+PnIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682055;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=MbKpS3rxCiadnMIEx2I7bMFCm7T1XCMiqI6xe9/pEoc=;
 b=VdgR0VPXRFosCtUJOw+oAW5A9AJJC2YjSq3QGDJ7qrxW5uHUvX81XEnGijLnuaqPw0Fu
 FJIMLZoAFECV5x0wmZ0kAX5hPegSrL6ZuCsQRe/R8ykTGLefwtT1UrPGdRTd6ChF7H2qq
 TPvu9kYKU2esX3h+HRDr1gfFVuyT0NWDPcjV0DN64KilJsK3Rfn90y7U3ETwrPd/HLPEO
 kez7DFZl5sgw5f5XwsjhQD7Nk06+Cf09ilmchtIAcQQpl3TbpGH/EtkgT+74ksrvBsFy5
 TMbh4z+ge86dTZLvRW7nO0Eqy5IQRwpfKnEv2u2Ew2hz2d6cZ6W/ZJKwX+dhw8Et0Aw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b="JZAN/EDZ"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JZAN/EDZ
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CDEE40024
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48e0d1c095dso1350833f8f.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792682052; x=1793286852;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MbKpS3rxCiadnMIEx2I7bMFCm7T1XCMiqI6xe9/pEoc=;
 b=JZAN/EDZknDR6BdZzQ7PCMfB2M37kFHyfPuNbGqBxdIBv2m7PGcA/dfwIjdX+xsAa5
 vhRwqc8NQxe/mS7Jtp90X5WKpIdeDcJ7kiEQFPysuniIpF/LpWv0VuD6TeX+bSsmE52L
 OqSEnK02qjn7Y/tQ9JMAjXembafIUN3x00SYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792682052; x=1793286852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MbKpS3rxCiadnMIEx2I7bMFCm7T1XCMiqI6xe9/pEoc=;
 b=2xSHbZLcuq4w2Xa7N8hlQSu3Hb9HfbUtIiJtNW4BManpdzJb+dCRYc1pvBwvNyoKcM
 khQ6IYAy0MllfJoE/AgtTlTb3Z9cRgVhE5VYQoo0XQutIy3cqL0mARoi2kEO27vMW+oY
 2wq4fqrTMFq2T3WndL3CMR0ODBZGQksgkzYHa2FsBorXFV0QTugMTmlj/wKndc2ZHcDd
 r/+Nop5BJqAQIyXpGrwdayKncY3ujqbWANUs6j/yixuiX371ECTF7XANaEAPA/iHU4x/
 ELtEDkUCmdXTJBZ5fqMCm5ZI1xtzyka8NP5wHpVUAn5SqWXh6SOrYLXLr6OxOtQVj+/M
 FEJQ==
X-Gm-Message-State: AFq9FYLi7VPlk7wz162QUrRzpdaPbrmQCrxkd0O0HHXS8uOL3odB8K4T
 b1HPnQnTdtyA8mu6stc8mqbaysdwSHrybsRDv052ySl3E+my83l0RRa5vR+PRnQtDF29p6UvCX8
 t+g/W
X-Gm-Gg: AYBFou0QoLsd3GQBzoUu99ruIOOz5KLUx0CPxXRMjKWpFW6l5WhqdTzJWz5x0/XhBfx
 TYv898QzEXiOL3Siwm3PkmmnE6nowXZ+sMwJ51JjezzXj3CGxaHCzgGr7LQEAC+PkdsWXWj6ltO
 L6ZoQlwsCXd60kKOn9aPwcXVPthmHk8Z61+ivLfKTSOdfrQ1aiBwkDNLD6UNrpa/F1pF+orEUTx
 e8HKc6HpyCKGkoIQde7cXX12azWeRVtpS8yj5GKsmObyk0qMbK6lh9klHgAo4I44FWNAjaF8xi1
 xb+Vkr5CpgLE8KuD+aSq/JR/7dzVwfTMmmp17TRbVfIM33pyBbyFQ37zFecp+6hNd/efQvr1enQ
 rlGZgdwxiHkTdjT3gnHTDQiHkIoMBUWNLiZe642mnV6rkwi63y7Lzt6ZNdCEzqDTAG6qC/pQX9t
 6HcP5mRsNTvxz9m6UvX+vppn/aSRFEviSFjCmp+w4Sg8d53AHi8rpsTz4t7eBNH2fhw9DfOcY2j
 x5qT2bFZ54Y8Bub34FdpNNjSrl6aE6C1rtdmANR42s5Bmq8FEVZwgTMFlgvAeHD04XyOGBzs8xg
 snHCZwdXmJuDTYp6EJsNTCW8B/VpGquDDw5EN2iiqbHVcCBsu8EX0kB8lWotE4aV3yt8CNweV+p
 f5KRg5bwbZMOJ3sK0E18IuH4UFCSaThuE/eyLo5n/wTJsigQLbr9z
X-Received: by 2002:a05:6000:161b:b0:48c:7caa:12cd with SMTP id
 ffacd0b85a97d-48e264b1606mr7881355f8f.22.1792682052154; 
 Thu, 22 Oct 2026 08:14:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25827087sm12732367f8f.21.2026.10.22.08.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 08:14:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 22 Oct 2026 17:13:58 +0200
Message-ID: <20261022151358.2260712-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/6] configs/stm32mp257f_ev1_defconfig: new
 defconfig
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the STM32MP257F Evaluation board (EV1) [1].

The goal is an image built from upstream components:

- TF-A v2.15.0
- U-Boot 2026.10
- Linux 7.3

configured, where possible, with the same build options used by the
official STMicroelectronics OpenSTLinux Yocto layers [2].

This was not possible for OP-TEE OS. Indeed upstream OP-TEE OS does not
support yet, on STM32MP25, the STPMIC2 PMIC and the SCMI voltage
domains, which the mainline Linux device tree requires for the microSD
card supplies [3]. Until this is resolved, the STMicroelectronics
downstream version (4.0.0-stm32mp-r3) has to be used.

Host bmap-tools is enabled to speed up the flashing of the microSD
card, which is much faster than with dd.

[1] https://www.st.com/en/evaluation-tools/stm32mp257f-ev1.html
[2] https://github.com/STMicroelectronics/meta-st-stm32mp/tree/openstlinux-6.6-yocto-scarthgap-mpu-v26.02.18
[3] https://github.com/OP-TEE/optee_os/issues/8027

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                    |  2 +
 .../stm32mp257f-ev1/genimage.cfg              | 52 ++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf       |  4 ++
 .../overlay/etc/fwumdata.config               |  4 ++
 .../arm-trusted-firmware.hash                 |  2 +
 ...-arm-smc-id-of-the-SMC-watchdog-on-s.patch | 53 ++++++++++++++
 .../stm32mp257f-ev1/patches/linux/linux.hash  |  2 +
 ...2mp25-rename-the-PCIe-bus-SCMI-clock.patch | 44 ++++++++++++
 .../patches/optee-os/optee-os.hash            |  2 +
 .../stm32mp257f-ev1/patches/uboot/uboot.hash  |  2 +
 .../stm32mp257f-ev1/post-image.sh             | 18 +++++
 .../stm32mp257f-ev1/readme.txt                | 72 +++++++++++++++++++
 configs/stm32mp257f_ev1_defconfig             | 66 +++++++++++++++++
 13 files changed, 323 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/overlay/etc/fwumdata.config
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/linux/0001-arm64-dts-st-fix-arm-smc-id-of-the-SMC-watchdog-on-s.patch
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/0001-dts-stm32mp25-rename-the-PCIe-bus-SCMI-clock.patch
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/optee-os.hash
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/patches/uboot/uboot.hash
 create mode 100755 board/stmicroelectronics/stm32mp257f-ev1/post-image.sh
 create mode 100644 board/stmicroelectronics/stm32mp257f-ev1/readme.txt
 create mode 100644 configs/stm32mp257f_ev1_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index c188cd301f2c..24ea83e428ec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -811,6 +811,7 @@ F:	board/bsh/
 F:	board/stmicroelectronics/stm32f746-disco/
 F:	board/stmicroelectronics/stm32f769-disco/
 F:	board/stmicroelectronics/stm32h747-disco/
+F:	board/stmicroelectronics/stm32mp257f-ev1/
 F:	boot/stm32-ddr-phy-binary/
 F:	boot/ti-k3-boot-firmware/
 F:	configs/imx6ulz_bsh_smm_m2_defconfig
@@ -819,6 +820,7 @@ F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f746_disco_sd_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
 F:	configs/stm32h747_disco_sd_defconfig
+F:	configs/stm32mp257f_ev1_defconfig
 F:	package/aespipe/
 F:	package/armadillo/
 F:	package/atf/
diff --git a/board/stmicroelectronics/stm32mp257f-ev1/genimage.cfg b/board/stmicroelectronics/stm32mp257f-ev1/genimage.cfg
new file mode 100644
index 000000000000..aec66cc7c490
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp257f-ev1/genimage.cfg
@@ -0,0 +1,52 @@
+image sdcard.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition fsbla1 {
+		image = "tf-a-stm32mp257f-ev1.stm32"
+		size = 256K
+	}
+
+	partition fsbla2 {
+		image = "tf-a-stm32mp257f-ev1.stm32"
+		size = 256K
+	}
+
+	partition metadata1 {
+		image = "fwu-mdata.bin"
+		partition-type-uuid = "${FWU_MDATA_TYPE_UUID}"
+		size = 256K
+	}
+
+	partition metadata2 {
+		image = "fwu-mdata.bin"
+		partition-type-uuid = "${FWU_MDATA_TYPE_UUID}"
+		size = 256K
+	}
+
+	partition fip-a {
+		image = "fip.bin"
+		partition-type-uuid = "${FIP_TYPE_UUID}"
+		partition-uuid = "${FIP_A_UUID}"
+		size = 4M
+	}
+
+	partition fip-b {
+		image = "fip.bin"
+		partition-type-uuid = "${FIP_TYPE_UUID}"
+		partition-uuid = "${FIP_B_UUID}"
+		size = 4M
+	}
+
+	partition u-boot-env {
+		partition-type-uuid = "3de21764-95bd-54bd-a5c3-4abe786f38a8"
+		size = 512K
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		partition-uuid = "e91c4e10-16e6-4c0e-bd0e-77becf4a3582"
+		bootable = "yes"
+	}
+}
diff --git a/board/stmicroelectronics/stm32mp257f-ev1/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp257f-ev1/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 000000000000..7871513cba0c
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp257f-ev1/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp257f-ev1-buildroot
+  kernel /boot/Image.gz
+  devicetree /boot/stm32mp257f-ev1.dtb
+  append root=PARTUUID=e91c4e10-16e6-4c0e-bd0e-77becf4a3582 rootwait console=ttySTM0,115200 earlycon
diff --git a/board/stmicroelectronics/stm32mp257f-ev1/overlay/etc/fwumdata.config b/board/stmicroelectronics/stm32mp257f-ev1/overlay/etc/fwumdata.config
new file mode 100644
index 000000000000..c172b26cb284
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp257f-ev1/overlay/etc/fwumdata.config
@@ -0,0 +1,4 @@
+# FWU metadata location: <device> <offset> <metadata_size>
+# metadata1 and metadata2 partitions of the SD card (see genimage.cfg)
+/dev/mmcblk0p3	0x0	0x78
+/dev/mmcblk0p4	0x0	0x78
diff --git a/board/stmicroelectronics/stm32mp257f-ev1/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/stm32mp257f-ev1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 000000000000..2e24bcd0de5b
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp257f-ev1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b807d8bf190b7c46b4260729b4bbe2f7df83cd1086edcb181d66595ae6598d23  arm-trusted-firmware-v2.15.0-git4.tar.gz
diff --git a/board/stmicroelectronics/stm32mp257f-ev1/patches/linux/0001-arm64-dts-st-fix-arm-smc-id-of-the-SMC-watchdog-on-s.patch b/board/stmicroelectronics/stm32mp257f-ev1/patches/linux/0001-arm64-dts-st-fix-arm-smc-id-of-the-SMC-watchdog-on-s.patch
new file mode 100644
index 000000000000..ba1324dc13e3
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp257f-ev1/patches/linux/0001-arm64-dts-st-fix-arm-smc-id-of-the-SMC-watchdog-on-s.patch
@@ -0,0 +1,53 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
+Date: Mon, 7 Sep 2026 09:14:11 +0000
+Subject: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on
+ stm32mp2
+
+OP-TEE implements the STM32MP2 watchdog SMC service with function ID
+0xbc000000 (CFG_WDT_SM_HANDLER_ID), not 0xb200005a. With the current
+value the arm_smc_wdt probe fails with -EIO and the IWDG started by the
+bootloader is never refreshed.
+
+Fixes: 89fca38168c9 ("arm64: dts: st: add arm-wdt node for watchdog support on stm32mp251")
+Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
+Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
+Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>
+Link: https://lore.kernel.org/r/20260907091400.55954-1-mateusz.nowicki@posteo.net
+Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ae4d08bbe3f4f5ec920dbdba26091adf0ae6ba71
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
+ arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
+index 0feb8943efae..1f297163fae2 100644
+--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
++++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
+@@ -35,7 +35,7 @@ arm-pmu {
+ 
+ 	arm_wdt: watchdog {
+ 		compatible = "arm,smc-wdt";
+-		arm,smc-id = <0xb200005a>;
++		arm,smc-id = <0xbc000000>;
+ 		status = "disabled";
+ 	};
+ 
+diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
+index 44938c036e30..ea1b04002b28 100644
+--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
++++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
+@@ -36,7 +36,7 @@ arm-pmu {
+ 
+ 	arm_wdt: watchdog {
+ 		compatible = "arm,smc-wdt";
+-		arm,smc-id = <0xb200005a>;
++		arm,smc-id = <0xbc000000>;
+ 		status = "disabled";
+ 	};
+ 
+-- 
+2.43.0
+
diff --git a/board/stmicroelectronics/stm32mp257f-ev1/patches/linux/linux.hash b/board/stmicroelectronics/stm32mp257f-ev1/patches/linux/linux.hash
new file mode 100644
index 000000000000..a28e591f3694
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp257f-ev1/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953  linux-7.3.tar.xz
diff --git a/board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/0001-dts-stm32mp25-rename-the-PCIe-bus-SCMI-clock.patch b/board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/0001-dts-stm32mp25-rename-the-PCIe-bus-SCMI-clock.patch
new file mode 100644
index 000000000000..3320ba0ba236
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/0001-dts-stm32mp25-rename-the-PCIe-bus-SCMI-clock.patch
@@ -0,0 +1,44 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 20 Oct 2026 12:26:20 +0200
+Subject: [PATCH] dts: stm32mp25: rename the PCIe bus SCMI clock
+
+The PCIe bus clock is exposed to the Cortex-A35 agent through SCMI with
+the ck_icn_p_pcie domain name, which is also the name of the same clock
+in the mainline Linux stm32mp25 RCC driver. When the mainline kernel
+is used, the SCMI clock driver registers ck_icn_p_pcie first and the
+RCC driver fails to probe, leaving the system without clock tree,
+console and SD card:
+
+  stm32mp25_rcc 44200000.clock-controller: error -EEXIST: failed to register clk 'ck_icn_p_pcie' (ck_icn_p_pcie+0x8/0x38)
+  stm32mp25_rcc 44200000.clock-controller: probe with driver stm32mp25_rcc failed with error -17
+
+Mainline Linux does not use this SCMI clock: the PCIe nodes reference
+the RCC clock directly (<&rcc CK_BUS_PCIE>).
+
+Rename the SCMI clock domain to ck_scmi_icn_pcie. Only the name exposed
+through SCMI changes: the SCMI clock ID (CK_SCMI_ICN_PCIE) is unchanged,
+so device trees referencing this clock by its ID are not affected.
+
+Upstream: https://github.com/STMicroelectronics/optee_os/pull/5
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ core/arch/arm/dts/stm32mp25-st-scmi-cfg.dtsi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/dts/stm32mp25-st-scmi-cfg.dtsi b/core/arch/arm/dts/stm32mp25-st-scmi-cfg.dtsi
+index f0c164ffdcf1..284e8208a8a8 100644
+--- a/core/arch/arm/dts/stm32mp25-st-scmi-cfg.dtsi
++++ b/core/arch/arm/dts/stm32mp25-st-scmi-cfg.dtsi
+@@ -857,7 +857,7 @@
+ 
+ 					clock@84 {
+ 						reg = <CK_SCMI_ICN_PCIE>;
+-						domain-name = "ck_icn_p_pcie";
++						domain-name = "ck_scmi_icn_pcie";
+ 						clocks = <&rcc CK_BUS_PCIE>;
+ 						flags = <SCMI_CLOCK_DEFAULT_ENABLED>;
+ 					};
+-- 
+2.43.0
+
diff --git a/board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/optee-os.hash b/board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/optee-os.hash
new file mode 100644
index 000000000000..2003fe484ae0
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp257f-ev1/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0fb0ef4c2d303bea8c2c7e2dfbab6e04bc92da631b778b1ba834ee320f869f03  optee-os-4.0.0-stm32mp-r3.tar.gz
diff --git a/board/stmicroelectronics/stm32mp257f-ev1/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32mp257f-ev1/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..66c72d3afd51
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp257f-ev1/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/board/stmicroelectronics/stm32mp257f-ev1/post-image.sh b/board/stmicroelectronics/stm32mp257f-ev1/post-image.sh
new file mode 100755
index 000000000000..c68774cdb814
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp257f-ev1/post-image.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+set -e
+
+BOARD_DIR="$(dirname "$0")"
+
+# GPT partition type and partition UUIDs, also used by genimage.cfg
+export FWU_MDATA_TYPE_UUID="8a7a84a0-8387-40f6-ab41-a8b9a5a60d23"
+export FIP_TYPE_UUID="19d5df83-11b0-457b-be2c-7559c13142a5"
+export FIP_A_UUID="4fd84c93-54ef-463f-a7ef-ae25ff887087"
+export FIP_B_UUID="09c54952-d5bf-45af-acee-335303766fb3"
+
+# FWU metadata (v2): 1 image (the FIP) per bank, 2 banks (fip-a, fip-b)
+"${HOST_DIR}/bin/mkfwumdata" -g -i 1 -b 2 -v 2 \
+	"${FWU_MDATA_TYPE_UUID},${FIP_TYPE_UUID},${FIP_A_UUID},${FIP_B_UUID}" \
+	"${BINARIES_DIR}/fwu-mdata.bin"
+
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/board/stmicroelectronics/stm32mp257f-ev1/readme.txt b/board/stmicroelectronics/stm32mp257f-ev1/readme.txt
new file mode 100644
index 000000000000..9c253c24be2d
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp257f-ev1/readme.txt
@@ -0,0 +1,72 @@
+STM32MP257F Evaluation board
+
+Intro
+=====
+
+This configuration supports the STM32MP257F Evaluation board (EV1)
+platform:
+
+  https://www.st.com/en/evaluation-tools/stm32mp257f-ev1.html
+
+It uses mainline Linux, U-Boot and TF-A, the STMicroelectronics
+downstream version of OP-TEE OS, and boots from the microSD card using
+the FWU (Firmware Update) multi bank layout of the TF-A FIP: two FIP
+banks (fip-a and fip-b) and two redundant copies of the FWU metadata
+(metadata1 and metadata2) selecting the active bank.
+
+The STMicroelectronics downstream OP-TEE OS is used because upstream
+OP-TEE OS does not support yet, on STM32MP25, the STPMIC2 PMIC, the PWR
+regulators and their exposure through the SCMI voltage domain protocol,
+which the mainline Linux device tree requires for the microSD card
+supplies. See the related upstream discussion:
+
+  https://github.com/OP-TEE/optee_os/issues/8027
+
+How to build
+============
+
+ $ make stm32mp257f_ev1_defconfig
+ $ make
+
+How to write the microSD card
+=============================
+
+Once the build process is finished you will have an image called
+"sdcard.img" in the output/images/ directory, together with its block
+map "sdcard.img.bmap".
+
+Copy the bootable "sdcard.img" onto a microSD card with "bmaptool",
+which only writes the blocks actually used by the image:
+
+  $ sudo bmaptool copy output/images/sdcard.img /dev/sdX
+
+Alternatively, with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Boot the board
+==============
+
+ (1) Set the boot switches to boot from the microSD card and insert
+     the microSD card.
+
+ (2) Plug a USB cable in the ST-LINK connector and run your serial
+     communication program on /dev/ttyACM0 (115200 8N1).
+
+ (3) Power-up the board.
+
+ (4) The system will start, with the console on UART.
+
+FWU metadata
+============
+
+The FWU metadata is generated at build time by the host mkfwumdata
+tool, with fip-a as active bank. It can be inspected and modified
+from Linux with the fwumdata tool, configured by /etc/fwumdata.config:
+
+  # fwumdata -l
+
+For example, to boot the FIP from the fip-b partition:
+
+  # fwumdata -a 1 -p 0
+  # reboot
diff --git a/configs/stm32mp257f_ev1_defconfig b/configs/stm32mp257f_ev1_defconfig
new file mode 100644
index 000000000000..ca434ee5dd6c
--- /dev/null
+++ b/configs/stm32mp257f_ev1_defconfig
@@ -0,0 +1,66 @@
+BR2_aarch64=y
+BR2_cortex_a35=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp257f-ev1/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp257f-ev1/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/stm32mp257f-ev1/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.3"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_IMAGEGZ=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp257f-ev1"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_UBOOT_TOOLS=y
+BR2_PACKAGE_UBOOT_TOOLS_FWUMDATA=y
+BR2_PACKAGE_OPTEE_CLIENT=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.15.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP25=1 STM32MP_SDMMC=1 STM32MP_DDR4_TYPE=1 PSA_FWU_SUPPORT=1 STM32MP_BL33_EL1=0 PSCI_OS_INIT_MODE=1 DTB_FILE_NAME=stm32mp257f-ev1.dtb BL32_EXTRA2= BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,STMicroelectronics,optee_os,4.0.0-stm32mp-r3)/optee-os-4.0.0-stm32mp-r3.tar.gz"
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
+BR2_TARGET_OPTEE_OS_NEEDS_CMAKE=y
+# BR2_TARGET_OPTEE_OS_SDK is not set
+# BR2_TARGET_OPTEE_OS_SERVICES is not set
+BR2_TARGET_OPTEE_OS_PLATFORM="stm32mp2"
+BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="257F_EV1"
+BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_WITH_TUI=n"
+BR2_TARGET_STM32_DDR_PHY_BINARY=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp25"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin u-boot.dtb"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=st/stm32mp257f-ev1"
+BR2_PACKAGE_HOST_BMAP_TOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_MKFWUMDATA=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
