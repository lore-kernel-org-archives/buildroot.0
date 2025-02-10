Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574E2C02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 19:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8B2141301;
	Mon, 10 Feb 2025 19:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAdGFtte7jcL; Mon, 10 Feb 2025 19:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41F0B41303
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41F0B41303;
	Mon, 10 Feb 2025 19:34:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 349246C
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 19:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 245C060B4B
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 19:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWIc5nzPKn8i for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 19:34:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DECDC60B4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DECDC60B4A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DECDC60B4A
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 19:34:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AAE2E780316;
 Mon, 10 Feb 2025 20:33:55 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Feb 2025 20:33:55 +0100
MIME-Version: 1.0
Date: Mon, 10 Feb 2025 20:33:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20250207231203.3952765-1-dario.binacchi@amarulasolutions.com>
References: <20250207231203.3952765-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <96b69abb843dc7292777c64f6787f134@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739216039;
 bh=v4UmDTI1ezIVacOO6DN2mReEedrYwDjMWHm4QD5OX2M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hhet1WzwRFc/B22JboY6GvcVmLgiuLY80uwkccDPXAWWTFTSQPr5fyA0SN8j4eb/f
 atBMYnxYAxyVQXBAV8U42MCTs/rpwtmK8UIpMCTbhTnZQwWV/MHJQcVGLUCqZeT7Tr
 AtBbmudFkmJ4K9udJbQdVwdYBGixw7hsBCr/ixa/ol6rq+cmfWj2RJ59no1othf86L
 kFLD6R+/fhlyFnrClx9ThipQGBPcjB4lRadlFCTJZL30Y3i8/hbavg8DqRe8JSUIWT
 voAXUIxf7Yacu0Jmvlukv8FwBQaN91tbOrQer570m8lJ52L2OjW8C+b5v9NmkhId9r
 iiqnHsQJRPhuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hhet1Wzw
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: fix binman failure
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

Thanks for the patch.

On 08/02/2025 00:12, Dario Binacchi wrote:
> The commit 4bce3270d680 ("Config.in: timeout earlier when connecting to
> download servers"), among other things, adds the connection timeout
> parameter to the default scp command:
> 
> config BR2_SCP
>        string "Secure copy (scp) command"
>        default "scp -o ConnectTimeout=10"
> 
> Since the package/pkg-download.mk file exports this command using the
> SCP variable:
> 
> export SCP := $(call qstrip,$(BR2_SCP))
> 
> and the U-Boot Makefile uses this variable as the path for the scp
> command (rather than the command itself):
> 
> cmd_binman = $(srctree)/tools/binman/binman $(if $(BINMAN_DEBUG),-D) \
> 		$(foreach f,$(BINMAN_TOOLPATHS),--toolpath $(f)) \
>                 --toolpath $(objtree)/tools \
> 		$(if $(BINMAN_VERBOSE),-v$(BINMAN_VERBOSE)) \
> 		build -u -d $(binman_dtb) -O . -m \
> 		--allow-missing --fake-ext-blobs \
> 		$(if $(BINMAN_ALLOW_MISSING),--ignore-missing) \
> 		-I . -I $(srctree) -I $(srctree)/board/$(BOARDDIR) \
> 		$(foreach f,$(of_list_dirs),-I $(f)) -a of-list=$(of_list) \
> 		$(foreach f,$(BINMAN_INDIRS),-I $(f)) \
> 		-a atf-bl31-path=${BL31} \
> 		-a tee-os-path=${TEE} \
> 		-a ti-dm-path=${TI_DM} \
> 		-a opensbi-path=${OPENSBI} \
> 		-a default-dt=$(default_dt) \
> 		-a scp-path=$(SCP) \
> 
> the following error occurs:
> 
>   BINMAN  .binman_stamp
> usage: binman [-h] [-B BUILD_DIR] [-D] [-H] [--tooldir TOOLDIR] 
> [--toolpath TOOLPATH] [-T THREADS] [--test-section-timeout] [-v 
> VERBOSITY] [-V]
>               
> {build,bintool-docs,entry-docs,ls,extract,replace,sign,test,tool} ...
> binman: error: unrecognized arguments: -o ConnectTimeout=10
> make[2]: *** [Makefile:1126: .binman_stamp] Error 2
> 
> The patch fixes the SCP setting passed to U-Boot to ensure that its
> parameters are not included.
> 
> Fixes: 4bce3270d680 ("Config.in: timeout earlier when connecting to 
> download servers")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/uboot/uboot.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2796b0a31010..6bbdc4151fac 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -176,7 +176,8 @@ UBOOT_MAKE_OPTS += \
>  	ARCH=$(UBOOT_ARCH) \
>  	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem 
> /,$(HOST_CFLAGS)))" \
>  	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
> -	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
> +	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS)) \
> +	SCP=$(word 1, $(SCP))

I don't think this is the right fix for this issue.

U-Boot Makefile is using the "SCP" variable here:
https://source.denx.de/u-boot/u-boot/-/blob/v2025.01/Makefile#L1411

According the the "binman" documentation:
https://source.denx.de/u-boot/u-boot/-/blob/v2025.01/tools/binman/entries.rst#L1727

This SCP is the "System Control Processor firmware blob".

Buildroot exports a SCP variable here:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/package/pkg-download.mk#L18

The value is set here:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/Config.in#L134

BR2_SCP corresponds to the SSH Secure File Copy command:
https://man.openbsd.org/scp

which has nothing to do with the System Control Processor firmware
binman is expecting. So this is an unfortunate name clash.

There is few defconfigs using BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS to
workaround this. See for example:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11.1/configs/orangepi_zero_plus2_defconfig#L45

There is no defconfig in Buildroot setting an actual file for u-boot 
SCP.

Maybe we could introduce a new u-boot Kconfig option string such as:
BR2_TARGET_UBOOT_SCP_FIRMWARE and properly set the u-boot SCP
variable to this value (and set it to /dev/null if empty).

What do you think?

>  # Disable FDPIC if enabled by default in toolchain
>  ifeq ($(BR2_BINFMT_FDPIC),y)
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
