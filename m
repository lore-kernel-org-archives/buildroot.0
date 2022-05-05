Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A739C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D1C8404B4;
	Thu,  5 May 2022 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0dr16G-fr0z; Thu,  5 May 2022 20:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17BF040383;
	Thu,  5 May 2022 20:37:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DCDB1BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AB618406C
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id viqMn7l53SLE for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:37:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44E6F84063
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:37:32 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id g6so10885944ejw.1
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TxN0KDc6u46FqnkPj8zpR5UaJoYQL1fAWYZovwjqVoc=;
 b=AlcFpzoqtIcSoL5Qjena7QYsyH3BSn35GTVJOYNpYdXtWbR2V7o8tuUOJUBrtDl7YY
 ST7nZOmTmRgAFspHYQ4DwNfVpZEHQwYu17Srg47d1mhAEAkxJB4d8N11bSg9rQpEnN4P
 +lNh2L/OP3rguNuikNXdEen6PwZcsucPI0mww+UkqSSRXexEqRkxUv3Sa1qr7CBpQsjr
 bzpX8MFWICQ7mCTxOtySeiZoIh0mHIrKRPelcu6uYhcMxgQbRP8mzJ3aUO78YYFY0mE5
 G1HRGyFZO7v40caxsWvEJuE958UrJ0tMS2LlvWFnWdzwnrW8pjKLfnFF3H6I2uLIRfu1
 NVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TxN0KDc6u46FqnkPj8zpR5UaJoYQL1fAWYZovwjqVoc=;
 b=HdHtrsS3dQjM2jLoil+NCw6gHj1gpj5hyJsbQXzO+C5uNWxOC2fWA535Nr6+hSNfMQ
 MvCQSjGI2F812/5UDdNHLgJOSEiIFVSCYKmX/BbGt5wReYqliTpg0mfhmstaN4EL1KTW
 V7cpkNf4eqwOatmgQSa9roS2xYVKucjY+XSBb8rpZ4xwwLBxUZg5xBQCEySJsZZNyrmW
 pLHMe0FARe42WmpQiXLQGvGPsRk9bSPtOCP6AA2C2/zjV3HdSwQ0ly+hGFE5e575fiS+
 8/KPQZBBXGKHAr3XqFQXlX5UBnJHpMSfDCyI9OPk2ofMcGbPKS/ta3IjmZ4rmwQHymUh
 dF4A==
X-Gm-Message-State: AOAM530ft2CPDQ/JC2BZBVTiBkgNlqICQd088dCpx9TuIvDqL3pgIN+H
 vIKyZNWxSD1EwIqN7R9OygKTVw==
X-Google-Smtp-Source: ABdhPJxBCOJ5BlgaNTBUukoygfqty65IRL8YgHRMEaw09VLD2T5M54BVjYYnK7oEwRkdtAKepo6YTA==
X-Received: by 2002:a17:907:9626:b0:6f4:2d7e:6430 with SMTP id
 gb38-20020a170907962600b006f42d7e6430mr24527912ejc.113.1651783050481; 
 Thu, 05 May 2022 13:37:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a1709064e0c00b006f3ef214e03sm1125922eju.105.2022.05.05.13.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 13:37:29 -0700 (PDT)
Message-ID: <c8c34832-4993-4779-e125-4beea032836b@mind.be>
Date: Thu, 5 May 2022 22:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: yann.morin@orange.com, buildroot@buildroot.org
References: <24588_1651771186_62740732_24588_360_1_2d4cd3ac6995d7b5119ef4dfdc22b975992b8a73.1651770627.git.yann.morin@orange.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <24588_1651771186_62740732_24588_360_1_2d4cd3ac6995d7b5119ef4dfdc22b975992b8a73.1651770627.git.yann.morin@orange.com>
Subject: Re: [Buildroot] [PATCH] package/pkg-download: do not try to vendor
 _EXTRA_DOWNLOADS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/05/2022 19:19, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> For golang- or cargo-based packages, we apply a vendoring pass after the
> package's "main" download is done. Whether to vendor or not is based on
> the heuristic that a specific directory exists or not; for golang
> packages, we look for '/vendor', while for cargo, we look for '/VENDOR'.
> 
> This is fine for the "main" (by lack of a better term) download, but
> this falls flat on its face for extra downloads. Indeed, so packages may
> need to download data sets, or assets, as _EXTRA_DOWNLOADS. Those are
> usually just data blobs, and are not actual golang or cargo packages; as
> such they do not need to be vendored, but worse, if we try to actually
> vendor them, this fails because the required files for vendoring are
> missing from the archives in such data sets.
> 
> We fix that by decoupling the download for the extra download, from the
> download for the main archive. We pass the post-processing option only
> to the main download.
> 
> This makes the hard assumption that extra downloads will never need to
> be post-processed for vendoring, of course; we hope this will always be
> correct in practice.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>


  Applied to master, thanks, with a few changes:

      - no loop needed for MAIN_DOWNLOAD, it can have only one;
      - remove superfluous backslash in the definition of MAIN_DOWNLOAD;
      - introduce _ADDITIONAL_DOWNLOADS to avoid filter-out.


  Regards,
  Arnout

> ---
>   package/pkg-download.mk | 3 ++-
>   package/pkg-generic.mk  | 8 ++++++--
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index a15e21e110..28b31ca30e 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -103,6 +103,7 @@ endif
>   #
>   # Argument 1 is the source location
>   # Argument 2 is the upper-case package name
> +# Argument 3 is a sapce-separated list of optional arguments
>   #
>   ################################################################################
>   
> @@ -118,10 +119,10 @@ define DOWNLOAD
>   		-n '$($(2)_BASENAME_RAW)' \
>   		-N '$($(2)_RAWNAME)' \
>   		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
> -		$(if $($(2)_DOWNLOAD_POST_PROCESS),-p '$($(2)_DOWNLOAD_POST_PROCESS)') \
>   		$(if $($(2)_GIT_SUBMODULES),-r) \
>   		$(if $($(2)_GIT_LFS),-l) \
>   		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
> +		$(3) \
>   		$(QUIET) \
>   		-- \
>   		$($(2)_DL_OPTS)
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1222526ba1..3a3af44fc4 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -192,7 +192,8 @@ $(BUILD_DIR)/%/.stamp_downloaded:
>   			break ; \
>   		fi ; \
>   	done
> -	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
> +	$(foreach p,$($(PKG)_MAIN_DOWNLOAD),$(call DOWNLOAD,$(p),$(PKG),$(if $($(PKG)_DOWNLOAD_POST_PROCESS),-p '$($(PKG)_DOWNLOAD_POST_PROCESS)'))$(sep))
> +	$(foreach p,$(filter-out $($(PKG)_MAIN_DOWNLOAD),$($(PKG)_ALL_DOWNLOADS)),$(call DOWNLOAD,$(p),$(PKG))$(sep))
>   	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>   	$(Q)mkdir -p $(@D)
>   	@$(call step_end,download)
> @@ -601,8 +602,11 @@ ifndef $(2)_PATCH
>    endif
>   endif
>   
> -$(2)_ALL_DOWNLOADS = \
> +$(2)_MAIN_DOWNLOAD = \
>   	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
> +
> +$(2)_ALL_DOWNLOADS = \
> +	$$($(2)_MAIN_DOWNLOAD) \
>   	$$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
>   		$$(if $$(findstring ://,$$(p)),$$(p),\
>   			$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$(p)))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
