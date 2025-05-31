Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55402C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0052083B67;
	Sat, 31 May 2025 16:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agAITwahjhXJ; Sat, 31 May 2025 16:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30E3183B5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E3183B5D;
	Sat, 31 May 2025 16:50:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB488127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1814401CB
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSK_cYphJaWm for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:50:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D003440068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D003440068
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D003440068
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:50:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D9301C00D6; Sat, 31 May 2025 18:50:38 +0200 (CEST)
Message-ID: <b61bc59c-9791-4d74-9ac2-fcf963a3ab89@rnout.be>
Date: Sat, 31 May 2025 18:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juan Pablo Montero Castro <juanpablo.monterocastro@nxp.com>,
 buildroot@buildroot.org
References: <20250516142827.3211350-1-juanpablo.monterocastro@nxp.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516142827.3211350-1-juanpablo.monterocastro@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710238; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=og3jxV90bmJ3jMNGkv1NKiOOCM9JQsXJOhgvsF2pOh4=;
 b=jblxSPtEdifL3Rygzenam08tlja1etJsFJFueNqVG6JN1b3cGVB+hScuO7nFt66+ITBrpY
 TMetax6ruZCe+9Cj7GNoUjCUnG/aKC47E50J7FyOf8j2jH+04GgzzxcZqgyKhRG/CMQUOt
 l+d0wMzrbw49hE3siE5ZABcrgyQHoFFX3cI9PZUGYC0tkkJL8fufxM4rAR21bYpn3twlG3
 fUTuWmyE39hd2ZaR/8yz0CaS7vVZfhG8KDsoB/8zUy2TY/bVSPickdt8YAH/LuXzSU11ji
 DY+5m5eZNGUgOj0cG98/KayBXXiWgs4ksy0FqueOD6w1oYnTuo348mMh/jFrQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=jblxSPtE
Subject: Re: [Buildroot] [PATCH 1/1] fix imx9 bootloader preparation script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/05/2025 16:28, Juan Pablo Montero Castro wrote:
> From: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
> 
> This commit replaces A35 with A55 in imx9 bootloader preparation script.
> i.MX9 families have CortexA55, see link below:
> https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-9-processors:IMX9-PROCESSORS
> 
> Signed-off-by: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   .../freescale/common/imx/imx9-bootloader-prepare.sh  | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh b/board/freescale/common/imx/imx9-bootloader-prepare.sh
> index 8ab5a241b0..2db887a785 100755
> --- a/board/freescale/common/imx/imx9-bootloader-prepare.sh
> +++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
> @@ -18,19 +18,19 @@ main ()
>   
>   	if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" "${BR2_CONFIG}"; then
>   		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
> -			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
> -			-ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 \
> -			-ap "${BINARIES_DIR}/tee.bin" a35 0x96000000 \
> +			-ap "${BINARIES_DIR}/bl31.bin" a55 ${ATF_LOAD_ADDR} \
> +			-ap "${BINARIES_DIR}/u-boot-hash.bin" a55 0x80200000 \
> +			-ap "${BINARIES_DIR}/tee.bin" a55 0x96000000 \
>   			-out "${BINARIES_DIR}/u-boot-atf-container.img"
>   	else
>   		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
> -			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
> -			-ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 \
> +			-ap "${BINARIES_DIR}/bl31.bin" a55 ${ATF_LOAD_ADDR} \
> +			-ap "${BINARIES_DIR}/u-boot-hash.bin" a55 0x80200000 \
>   			-out "${BINARIES_DIR}/u-boot-atf-container.img"
>   	fi
>   
>   	"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -append "${BINARIES_DIR}/ahab-container.img" -c \
> -		-ap "${BINARIES_DIR}/u-boot-spl-ddr.bin" a35 ${SPL_LOAD_ADDR} \
> +		-ap "${BINARIES_DIR}/u-boot-spl-ddr.bin" a55 ${SPL_LOAD_ADDR} \
>   		-out "${BINARIES_DIR}/imx9-boot-sd.bin"
>   
>   	flashbin_size="$(wc -c "${BINARIES_DIR}/imx9-boot-sd.bin" | awk '{print $1}')"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
