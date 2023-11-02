Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97B6C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 08:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0049840A47;
	Thu,  2 Nov 2023 08:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0049840A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o3va92bSNUDo; Thu,  2 Nov 2023 08:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B66340A92;
	Thu,  2 Nov 2023 08:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B66340A92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 262211BF287
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 08:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E964970600
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 08:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E964970600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SaUX5lpyXC-V for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 08:56:19 +0000 (UTC)
X-Greylist: delayed 301 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 02 Nov 2023 08:56:18 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B266705FF
Received: from arcturus.nroach44.id.au (arcturus.nroach44.id.au [45.32.188.33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B266705FF
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 08:56:18 +0000 (UTC)
Received: from arcturus.nroach44.id.au (localhost [127.0.0.1])
 by arcturus.nroach44.id.au (Postfix) with ESMTP id B86752F774
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 16:51:10 +0800 (AWST)
Received: by arcturus.nroach44.id.au (Postfix, from userid 5555)
 id 9A2992F7F0; Thu,  2 Nov 2023 16:51:10 +0800 (AWST)
Received: from [IPV6:2403:580e:1433:10:a51e:b200:ca4c:d29b]
 (2403-580e-1433-10-a51e-b200-ca4c-d29b.ip6.aussiebb.net
 [IPv6:2403:580e:1433:10:a51e:b200:ca4c:d29b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by arcturus.nroach44.id.au (Postfix) with ESMTPSA id 971FA2F10C;
 Thu,  2 Nov 2023 16:51:04 +0800 (AWST)
Message-ID: <4a6af05a-31e9-41a6-a1a5-44d470713613@nroach44.id.au>
Date: Thu, 2 Nov 2023 16:51:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-AU
To: buildroot@buildroot.org
References: <cover.1698657764.git.yann.morin@orange.com>
 <d8f84ccfa3285d30e3b4195b7ea0ddffb18c6512.1698657764.git.yann.morin@orange.com>
Autocrypt: addr=nroach44@nroach44.id.au; keydata=
 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
 DMZE7Ck=
In-Reply-To: <d8f84ccfa3285d30e3b4195b7ea0ddffb18c6512.1698657764.git.yann.morin@orange.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; s=mail; t=1698915070;
 bh=Mg6AheCVspI+NBq14Zbi1SUy2LaC4gKGn9M+vi2ltEA=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=xRw4Fagks1gybcrSHhwujCvsL1u/JO9Nhprw9Y7wM/rdRMSn4QQaXbza4gMIvy4jT
 /ZdNf/KYYsLxTL2hD3S+8s7ow4rbAWe+MujECQcmikz8gxVkKryBLDEHpprtr4N9OT
 4jdwVUznCMBiVuiLDANRUvJSwFq35YWCC6Odq/RHjsUEm1i5RLlDmsHzzD6Vk2Xt+C
 rUS5R66XTYcpyuAwqqOgHQCeAhtSgnfHtsVJg8y9OydEpF/xdoJaCIa9N/bBGKcqKY
 tdIlIVd6TgtOHRatlcGPOD+l9oDVtrl7UPS3F5T55U96oROd6GQeD5iE3mAoBsNSs9
 kRjudmP5Gn4Lw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; s=mail; t=1698915070;
 bh=Mg6AheCVspI+NBq14Zbi1SUy2LaC4gKGn9M+vi2ltEA=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=xRw4Fagks1gybcrSHhwujCvsL1u/JO9Nhprw9Y7wM/rdRMSn4QQaXbza4gMIvy4jT
 /ZdNf/KYYsLxTL2hD3S+8s7ow4rbAWe+MujECQcmikz8gxVkKryBLDEHpprtr4N9OT
 4jdwVUznCMBiVuiLDANRUvJSwFq35YWCC6Odq/RHjsUEm1i5RLlDmsHzzD6Vk2Xt+C
 rUS5R66XTYcpyuAwqqOgHQCeAhtSgnfHtsVJg8y9OydEpF/xdoJaCIa9N/bBGKcqKY
 tdIlIVd6TgtOHRatlcGPOD+l9oDVtrl7UPS3F5T55U96oROd6GQeD5iE3mAoBsNSs9
 kRjudmP5Gn4Lw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; s=mail; t=1698915064;
 bh=Mg6AheCVspI+NBq14Zbi1SUy2LaC4gKGn9M+vi2ltEA=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=vXqP6hC7+mNRdZTuEmoRD8/aJK+/LDt6iiGO+qUCo2XHWeOMFyYSuzb0nsyFLL2NT
 VHfowMtb5o33ab3It68NR4fS/ZGUFSOx63G8AtQAYUX8EwTQJgmjJ8eUySUmOOW5Dl
 9MLgPDQ4OlDkyVUrHOE598szDFfpjhmURRS+TeAZ94W25Vr43ZphLL+0TVtrk2q39B
 sjNw7qicHvL/NZqUfDc1cUj8ErYZw7jW4F7cPn+k43MDy0pBhXSaj0kGsxpx+9kFe+
 MkobrQgu/zAdJeUYnMUoFS+TYvDAGdtexwCLbXm9l70Sjwrh37nnb1y5toCApCaUZi
 IzLqLb4DO1DrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au
 header.a=rsa-sha256 header.s=mail header.b=xRw4Fagk; 
 dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au
 header.a=rsa-sha256 header.s=mail header.b=xRw4Fagk; 
 dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au
 header.a=rsa-sha256 header.s=mail header.b=vXqP6hC7
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-golang: allow packages to
 provide extldflags
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
From: Nathaniel Roach via buildroot <buildroot@buildroot.org>
Reply-To: Nathaniel Roach <nroach44@nroach44.id.au>
Cc: yann.morin@orange.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/10/23 17:22, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> For some packages, it may be necessary to pass extra extldflags. For
> example, some packages will need to be able to specify what ld to use,
> and so will need to pass -fuse-ld={bfd,gold} as extldflags.
>
> Introduce FOO_EXTLDFLAGS, that packages can set to pass such flags.
>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>   docs/manual/adding-packages-golang.adoc | 6 ++++--
>   package/pkg-golang.mk                   | 6 +++++-
>   2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/docs/manual/adding-packages-golang.adoc b/docs/manual/adding-packages-golang.adoc
> index c952cde577..c238050096 100644
> --- a/docs/manual/adding-packages-golang.adoc
> +++ b/docs/manual/adding-packages-golang.adoc
> @@ -84,8 +84,10 @@ therefore only use a few of them, or none.
>     infrastructure will automatically generate a minimal +go.mod+ file
>     in the package source tree if it doesn't exist.
>   
> -* +FOO_LDFLAGS+ and +FOO_TAGS+ can be used to pass respectively the
> -  +LDFLAGS+ or the +TAGS+ to the +go+ build command.
> +* +FOO_LDFLAGS+, +FOO_EXTLDFLAGS+, and +FOO_TAGS+ can be used to pass
> +  respectively the go +LDFLAGS+ (via the `-ldflags` command line flag),
> +  the external linker flags +EXTLDFLAGS+ (via the `-extldflags`
> +  command line flag), or the +TAGS+ to the +go+ build command.
>   
>   * +FOO_BUILD_TARGETS+ can be used to pass the list of targets that
>     should be built. If +FOO_BUILD_TARGETS+ is not specified, it
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 7ba82284f3..ba49ce153e 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -101,10 +101,14 @@ ifndef $(2)_BUILD_CMDS
>   ifeq ($(4),target)
>   
>   ifeq ($(BR2_STATIC_LIBS),y)
> -$(2)_LDFLAGS += -extldflags '-static'
> +$(2)_EXTLDFLAGS += -static
>   $(2)_TAGS += osusergo netgo
>   endif
>   
> +ifneq ($$($(2)_EXTLDFLAGS),)
> +$(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
> +endif
> +
>   # Build package for target
>   define $(2)_BUILD_CMDS
>   	$$(foreach d,$$($(2)_BUILD_TARGETS),\
Tested-by: Nathaniel Roach <nroach44@nroach44.id.au>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
