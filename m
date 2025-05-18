Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A93C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 16:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 478ED60A73;
	Sun, 18 May 2025 16:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uImTuypo-ZRA; Sun, 18 May 2025 16:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 449EB60AC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 449EB60AC3;
	Sun, 18 May 2025 16:35:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E86CE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FD4D815CE
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6hqya2dZQgx for <buildroot@buildroot.org>;
 Sun, 18 May 2025 16:35:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5775181583
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5775181583
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5775181583
 for <buildroot@busybox.net>; Sun, 18 May 2025 16:35:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0A0361C10ED; Sun, 18 May 2025 18:35:00 +0200 (CEST)
Message-ID: <078b3188-6f5b-4b52-ae5b-66e640895472@rnout.be>
Date: Sun, 18 May 2025 18:34:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20250321062358.3955810-1-francois.perrad@gadz.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250321062358.3955810-1-francois.perrad@gadz.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747586101; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pCe4K9yYY4qfYsnPZgCqTv+jC0ykQm8z6Msu8BeOTe4=;
 b=MIvyi3ct1IoCmvjQVmouzJo9fRNq+yI7zTGCS8yR+ZKKPOHxv4Z/H2MwxaKFRLw9lMWi01
 WS5TLIvzWIOZ5lxkr+5KoSmfL5iMMqSa3U1Zqk8Olov7ln/gJDY2IJLIc8uNmPkHcENHzW
 RXZiQ7ISGaaSaf+Y1wwENP8lkw+RMw/7NT7QMZNVD2ytxJcC0iTxasWDqs0shabAmXZDWx
 8NQWIt++gAC1uJ1ZpvpNsIRuMpopYMy74JNynLwbUOsQM3ZK5G4MCFb8OcEwSW73gASG6x
 V1p2NNWuJk71pLdgtqkgfpyhFFMuqEeyXqFi8NTNd6ylpazW+39Scl27f9nBCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MIvyi3ct
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

  Hi Francois,

  Good idea to add this section!

On 21/03/2025 07:23, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
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

  I've extended the text a bit to explain why you want this.

> +
> +The variable +BOARD+ needs to be adjusted to your project.
> +
> +With the variable +BUILDROOT+, it is easy to upgrade the Buildroot version
> +used by your project.
> +
> +----
> +BOARD?=<boardname>

  I don't think it's very useful to have this if it supports only a single 
defconfig.

> +BUILDROOT:=buildroot-2025.02

  I think we want to motivate people to use a git submodule rather than 
downloading a tarball, because that's a shorter path to contributing upstream.
So I just wrote that _somehow_ you have to make sure the buildroot directory exists.

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

  This is a super specific use case. I instead wrote in the text that you can 
add targets to upload it to a device.


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

  Since this supports only a single defconfig, I've instead added a 
simplification of the rules I use myself to support multiple configs, each in 
their own output directory.

> +
> +.PHONY: $(BOARD)
> +$(BOARD): $(OUTPUT)/.config
> +	$(MAKE) -C $(BUILDROOT) O=$(CURDIR)/$(OUTPUT)
> +
> +# delegate all other targets to the Buildroot makefile
> +%:
> +	$(MAKE) -C $(BUILDROOT) O=$(CURDIR)/$(OUTPUT) $@

  Unfortunately, this bit is not relevant in the multiple-output-directory case, 
so I dropped it.

  Regards,
  Arnout

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
