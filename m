Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58D2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D32083F9D;
	Sat, 14 May 2022 09:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhW3W77yuW2u; Sat, 14 May 2022 09:47:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 664E183F99;
	Sat, 14 May 2022 09:47:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB5A61BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8E1B40A62
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y2Y0mi_hJ9CY for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:47:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A1F5400EF
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:47:25 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id k27so12579527edk.4
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=vjyCvBIA7xkTrKz7Ob2VrwXO0yKH4CurR6ZNk2F13Zc=;
 b=fje+lO7spMjXFc3zHew7SAmKfO7+mWTdqWcHsrHeQtIVzmSZaHmz4QeuCHQCR/Imm1
 /jN20oqkErc0Ptpsnaq0doCyjfoxFaLzBZ9aSLeO/Szeflh3N6ecjiVrM2wi1gGUGJ84
 LNwCjEun+CLrcp4Eezcn7Z0GsqP5vtIF8uLEGE99/a5PoVDQxGm5B/8I7mzrhMimXFcj
 nGByd4OrWiWTImAMdjHyQyWMkHrpE1z9SLnwahK0JAuRDWGiVMCop4fPKjVyKNWgQ5V5
 wrJ8q6V0PpszXEOGTetcGwSRiDMY+Lk3/wFVx1j6bBe30j34sTU9UFAKThM/YKqr+3ll
 7kiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vjyCvBIA7xkTrKz7Ob2VrwXO0yKH4CurR6ZNk2F13Zc=;
 b=xg0V4EOaWc/kTnCFUDEwq9CZyj2wLpMMTxqx+OqfVlEid2+h6Q+j7MZGkwpOgZuCa9
 RM9jtpJ4fTuZi1PeCTzKIk9dG8I+gSCFQsBVOmnUt+alDeBqxy+GDbpALGUTqhAOM3mW
 nR4bXtFw6Jn5qehWeAQpcUyf8a65oo8oDpoxSCs0Jm2puMK2wvrNrwC7ij1r2g0VHRSr
 TpX2iNm3mfBHCKyoGtpk8VGbMfn2xTk75c8heuo1dL3dDDHY7+081iO2Bl8zg7T4jr8Q
 udLaZVQ8kGrtEVtc4YqcD8vOfyu7/KwKYKxlUOQfDJBzTkFT6Oj7F8jgN+sa6Jl5qNtL
 1uvg==
X-Gm-Message-State: AOAM5339roSBqCowz3PP58A2leUjNk0ik+Sh+C3EZNUfGKuhqtrf9XpB
 oGBbSVdNrpEAKsuV+D7ZuxKz1sXLbiEyJw==
X-Google-Smtp-Source: ABdhPJxW8BEBL/G78d/u/QKcTRKuGkCLI9mYw8wiRH/uUUf5zSwt+ovAY8ayXFmk5j+PEVYjkqdrCA==
X-Received: by 2002:a05:6402:4392:b0:427:da50:d833 with SMTP id
 o18-20020a056402439200b00427da50d833mr2851167edc.97.1652521643750; 
 Sat, 14 May 2022 02:47:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 jl18-20020a17090775d200b006f3ef214da6sm1608430ejc.12.2022.05.14.02.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:47:23 -0700 (PDT)
Message-ID: <80b14ceb-263c-7492-b324-8783ee49aa90@mind.be>
Date: Sat, 14 May 2022 11:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: yann.morin@orange.com, buildroot@buildroot.org
References: <17102_1652250198_627B5656_17102_437_1_abf36ee4172876cd86eaa1ce6691ddca377f8b0b.1652250196.git.yann.morin@orange.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <17102_1652250198_627B5656_17102_437_1_abf36ee4172876cd86eaa1ce6691ddca377f8b0b.1652250196.git.yann.morin@orange.com>
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: explicitly do not
 download package withtout source
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/05/2022 08:23, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Recent commit f0c7cb01a960 (package/pkg-download: do not try to vendor
> _EXTRA_DOWNLOADS) got last-minute changes when applied, which changed
> the expected behaviour for packages that do not have a main download.
> 
> Before f0c7cb01a960, the dl-wrapper would not even be called for those
> packages, and the original patch that was sent also avoided downloading
> such packages, but f0c7cb01a960 now causes the dl-wrapper to be called.
> 
> It is however an accident that the dl-wrapper does not fail. Indeed, it
> is expected to fail if no download was successful; we pass no URI, so
> the dl-wrapper should have failed, as it basically does:
> 
>      download_and_check=0
>      for uri in "${uris[@]}"; do
>          ...
>      done
>      if [ "${download_and_check}" -eq 0 ]; then
>          exit 1
>      fi
> 
> However, it does not even go that far...
> 
> Even though there is no output file, we still pass the path to the
> package output directory as the output path. So, to avoid downloading
> files already present, the wrapper checks if the output file exists,
> and checks its hash:
> 
>      if [ -e "${output}" ]; then
>          if support/download/check-hash ${quiet} "${hfile}" "${output}" ...
>              exit 0
>          ...
>      fi
> 
> The output path does exist now, because we explicitly create it just
> before calling the wrapper, because that's where we also locate the
> lockfile.
> 
> So it ends up trying to validate the hash of a directory, but it fails
> to, as there is indeed no hash file for that package. And a missing hash
> file is just a warning, not an error, which makes the download actually
> a success...
> 
> So, this is currently working, and this is by pure luck.
> 
> However, there is a potential issue: if a target package is a virtual
> package, but the host package is a real package, e.g. the same foo.mk
> does (or the other way around):
> 
>      HOST_FOO_VERSION = 1.2.3
>      HOST_FOO_SITE = http://example.net/
>      $(eval $(virtual-package))
>      $(eval $(host-generic-package))
> 
> If there is a hash file to validate the host download, then the current
> situation will cause a failure, because there would be a hash file, but
> no hash for the output path of the target variant, which would then be
> a hard-error.
> 
> So, revert to the behaviour from before f0c7cb01a960, where no download
> is attempted for a package without a source (really, without a main
> download, now).
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-generic.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 38219ce088..b233b07548 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -192,7 +192,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
>   			break ; \
>   		fi ; \
>   	done
> -	$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(PKG),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS)))
> +	$(if $($(PKG)_MAIN_DOWNLOAD),$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(PKG),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS))))
>   	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
>   	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>   	$(Q)mkdir -p $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
