Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F03BC5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 101CA60E51;
	Wed,  4 Jun 2025 18:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W02BJj2KacJx; Wed,  4 Jun 2025 18:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F93560E4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F93560E4F;
	Wed,  4 Jun 2025 18:23:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF54FDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC83280DB8
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e19TgF4SR2s3 for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:23:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCD3780E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCD3780E18
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCD3780E18
 for <buildroot@busybox.net>; Wed,  4 Jun 2025 18:23:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DA76C1C0D5B; Wed,  4 Jun 2025 20:22:50 +0200 (CEST)
Message-ID: <451686ff-1683-4b64-93b1-37dc50804bc4@rnout.be>
Date: Wed, 4 Jun 2025 20:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20250321062358.3955810-1-francois.perrad@gadz.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250321062358.3955810-1-francois.perrad@gadz.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061371; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yYFaEa09tE0UnhEUrFPk8xZ9jyS1+LTiAjdADL6J1l4=;
 b=RRp8K6QbN9+ULXP4pElot2qeBpcCnq/+4AkX1AlrxPXOFDxLGTFUgfDbbAsse8MOeFH79P
 NkHJs4dFv2FU780eSlub8D1vWLnWrTuPzAe0BXY5wjAu3CtOk3tBAiOduUzDAI6gONYaKX
 u6PSvYvk35wwMQBHOG9ZJGbyb4iCze4RYeLtgVNxdAcGP8VqJqTkHbRokb4Mxse0LjZzHe
 qDO9O+dTUpSlI0aD1nFKRUhjgWrQaQTuZ0X/MlE8wsALGromWgav/NYiBNuOpeahFird6o
 ulLt+qgaMNgo+lw/SSunF1z2nEE+jKAAxCrpFK5skqz/uaZw2DoM+6NDLgCmkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=RRp8K6Qb
Subject: Re: [Buildroot] [RFC PATCH]
 docs/manual/customize-directory-structure: add a custom top Makefile
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



On 21/03/2025 07:23, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   .../manual/customize-directory-structure.adoc | 84 +++++++++++++++++++
>   1 file changed, 84 insertions(+)
> 
> diff --git a/docs/manual/customize-directory-structure.adoc b/docs/manual/customize-directory-structure.adoc
> index e0eecb564..b0beebb40 100644
> --- a/docs/manual/customize-directory-structure.adoc
> +++ b/docs/manual/customize-directory-structure.adoc
> @@ -49,6 +49,7 @@ to you.
>   |           +-- package2.mk
>   |
>   +-- Config.in (if using a br2-external tree)
> ++-- Makefile (if using a custom top makefile)
>   +-- external.mk (if using a br2-external tree)
>   +-- external.desc (if using a br2-external tree)
>   ----
> @@ -109,3 +110,86 @@ BR2_GLOBAL_PATCH_DIR="board/<company>/common/patches board/<company>/fooboard/pa
>   
>   then first the patches from the 'common' layer would be applied,
>   followed by the patches from the 'fooboard' layer.
> +
> +==== Custom top Makefile
> +
> +Here, a custom Makefile for your project which adds some new targets,
> +on the top of all Buildroot targets.
> +
> +The variable +BOARD+ needs to be adjusted to your project.
> +
> +With the variable +BUILDROOT+, it is easy to upgrade the Buildroot version
> +used by your project.
> +
> +----
> +BOARD?=<boardname>
> +BUILDROOT:=buildroot-2025.02
> +OUTPUT:=output_$(BOARD)
> +SD?=/dev/sdX
> +
> +export BR2_DL_DIR=$(CURDIR)/download
> +
> +all: $(BOARD)
> +
> +.PHONY: buildroot
> +buildroot: $(BUILDROOT)
> +
> +.PHONY: buildroot-clean
> +buildroot-clean:
> +	rm -rf $(BUILDROOT)
> +
> +.PHONY: conf
> +conf: $(OUTPUT)/.config
> +
> +.PHONY: conf-clean
> +conf-clean:
> +	rm -f $(OUTPUT)/.config
> +
> +.PHONY: board
> +board: $(BOARD)
> +
> +.PHONY: board-clean
> +board-clean:
> +	rm -rf $(OUTPUT)
> +
> +.PHONY: dd
> +dd:
> +	@mount | grep $(SD)
> +	sudo dd status=progress if=$(OUTPUT)/images/sdcard.img of=$(SD)
> +	sync
> +	sync
> +
> +$(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.xz:
> +	mkdir -p $(BR2_DL_DIR)/buildroot
> +	cd $(BR2_DL_DIR)/buildroot && wget https://buildroot.org/downloads/$(BUILDROOT).tar.xz
> +
> +$(BUILDROOT): $(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.xz
> +	tar xfJ $(BR2_DL_DIR)/buildroot/$(BUILDROOT).tar.xz
> +	touch $(BUILDROOT)
> +	# here, apply patches against the Buildroot official tarball
> +
> +$(OUTPUT)/.config: $(BUILDROOT)
> +	$(MAKE) -C $(BUILDROOT) O=$(CURDIR)/$(OUTPUT) defconfig BR2_DEFCONFIG=../configs/$(BOARD)_defconfig BR2_EXTERNAL=..
> +
> +.PHONY: $(BOARD)
> +$(BOARD): $(OUTPUT)/.config
> +	$(MAKE) -C $(BUILDROOT) O=$(CURDIR)/$(OUTPUT)
> +
> +# delegate all other targets to the Buildroot makefile
> +%:
> +	$(MAKE) -C $(BUILDROOT) O=$(CURDIR)/$(OUTPUT) $@
> +----
> +
> +Now, an example of work session.
> +
> +----
> + $ make buildroot       # custom
> + $ make conf            # custom
> + $ make nconfig         # Buildroot
> + $ make savedefconfig   # Buildroot
> + $ make source          # Buildroot
> + $ make board           # custom
> + $ make dd              # custom
> +
> + $ make help            # Buildroot
> +----

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
