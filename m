Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE87CC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8ACC60714;
	Tue,  4 Feb 2025 14:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rh8FWaWDakxy; Tue,  4 Feb 2025 14:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C20DC60FD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C20DC60FD9;
	Tue,  4 Feb 2025 14:33:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15E5D185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 058A081467
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sx3248LscQTd for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:33:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFBA380D9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFBA380D9F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFBA380D9F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:33:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.123]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KPq-1tEY1r1yjK-00suN7; Tue, 04
 Feb 2025 15:33:29 +0100
Message-ID: <24162cf1-5dc9-4c0a-af9c-2da46d6798e3@gmx.de>
Date: Tue, 4 Feb 2025 15:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Nathaniel Roach <nroach44@nroach44.id.au>
References: <cover.1699547993.git.yann.morin@orange.com>
 <876f3a7bb6a2375193fc8f06ab856d2449f83727.1699547993.git.yann.morin@orange.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <876f3a7bb6a2375193fc8f06ab856d2449f83727.1699547993.git.yann.morin@orange.com>
X-Provags-ID: V03:K1:lU1cIishDQll08uF/2KQKjjdZxjjAqA0v0EVpaq4JC2LjwZUJFl
 Kd0FmCpZ3q0plk3ouyijOs/bf1z8gg1pWI/4o/YchO7FCivV2I6axnuzGqpudI6oAtZATL5
 1WI2agaXbGHAPtJ6yosX0oJcN3oLn9xIwSgGDWdSV9o3xVQSojJTvSxO3MN3Gvn1xWuzqU9
 o9UMoREHbAjRpet5duUKA==
UI-OutboundReport: notjunk:1;M01:P0:5IzVeyaDXtU=;pNHsthyC8nxh9uFwsuyhp7gj+X7
 Da5Jz9mNOs9uySWJhUBN+P/zrsVudQ7HZOJm+AjafrvPUI+8rt1MiOSLUAUwjEmNjGDhFFWRc
 D3A4p2Khgxxtwkfmy7GKAt4Jm2JG8YA2ejhH2baS/eIveUj67ZrmlsnPlwo1BHC7Ty9wBMfsR
 loUnjcjUTNwDOq5o2sLv23koJayVQJ/ZcrREXVhp9rJU1FowJeQ5U0xDg0+aBXzfLAj1uqBZV
 XwFZBe6wl2I206yn6facFsFlsF7z1uXdA2HXI0CRIEBhf9hfEgS5V94Ft0lV3iQjmcjRxtz5x
 JM6JH9qBPq0ybE5oBoalV5R07wzzdf4p7EzYP/LgwZon09JUyjzGauZ45Ac57OMivgGt7mljY
 5ZAFr7bWuE6AbQfmkrko4YHtif8Nmyl0+gKQ26F6K8CTS0beTuaKIVKB+ZIVqv+Gk1fgRwIVl
 E4zJ6VZU5ggj7WX0VF9q5Pf6U7KTC1wT5yTh/UfulZClPs3ZyFzlHrpiXQh3U0OpJXnhUhIt+
 svvzTaVi65yK+B+lPhof0ORBjTBV+LaD5zZakxBv27VqqgW0+Q7rwEFh+PFlNhb0SiHO23oXr
 S8Xu7IipgGkP2U+V7OgsTAi8uZbGD/1bPxlPMkQYeKyLZx2Lb+5TS2UPTegleXtczdYlKNjWh
 tg3kSwi7pbIkwh+gg39kxswSIEflM9dN+/TqRhR5lnO9lyGWOy6PC3Hww01lWWnzGK7D2na6f
 aUDGp2h+d7JmCjj3fp78UOzWao2gSOeXwL3qUJ6EQc/H2yUFQLiONRfs99PYFaaVyqMLEE3Cg
 gdq0Xu7kCM1fbBkzgbOzVND3exxOP/NFEPSWsZhGS8noH1s7CUvEEV9NfR2lhRrFbrYykMWsA
 D6B6qfdzshwazYUaP8uQdJwwjSbyV6GrYR7VCw0TpgvZdMt2h/rv1XK7d8pjLfBY54KKCZ9Qn
 xOXTUcIguT8kQfblTlrtg3N2bhvA7rbWIAW8C80Ef2BYK5LFefmKVrhgwj9bipTXCTNunEh3t
 alDI0dz0UZnAVbnVIwNnM0BLHhcJLTo3PcTqwLZG6du7DE+f8OHzlRZ+Vnvbgyh3YXFaN94ST
 2Q6CJiaEzwK2j7lN4D/YTM0YYMmjqwSVOo6CSPocGz4ETbiYtE1k7SV0GQru+9s2oQg1moZ8D
 /h2xM2+2iwOQdQIMlEUYVWP9M6GyRBzMiCSTrfmvGw6RSf6y0yt1Ro3Ej0ACnDqc0V+QIMAF0
 MFq9AibcGaw6XmB7UQbPuHzhm4LqbY8sW6frWivwxOiBJuUP5C1Hl/I1DGc7CkaKSHKYGLj12
 LF5jAphRO9ruOvly/YPMtKCsuwfh77GNKWXqE0QaARF3zI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738679609; x=1739284409; i=fiona.klute@gmx.de;
 bh=ccvTO8TghdNdaQNnMmaVmFzCdTzciGycF6mYb30S3o0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=D2QH8ScmArAgdR7mwapJ+U0IHxykqRuhhlQVKa1GHwfo/kzuIi5rONcoPOyT5cmX
 5HLSFUh8U4VgesMZDon0IKK6ZChhE0nwched5B0QKUmMXCHvZejpk7E9PBTbWEx6y
 OZ20HwKuDxkLgrARzyGmu/zE1Blphg7OGmFKGiEECPSMiiKDHwAPvQZLMvRNQKHxp
 W3Zmb/qZa45AXnvklXHq+VfflAQ+20mhEL0+sG1cf9lb8ndWx5H8fl0tjq970PgfI
 REBjoBg/AQu9QwAMbrJ5GxvVzv0NtEmGI1KqvYb+QZejDctgjBBUdDNohE6aWRo3F
 /8FlVnz9qkNpqjVPAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=D2QH8Scm
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-golang: allow packages to
 provide extldflags
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 09.11.23 um 17:39 schrieb yann.morin@orange.com:
> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> For some packages, it may be necessary to pass extra extldflags. For
> example, some packages will need to be able to specify what ld to use,
> and so will need to pass -fuse-ld={bfd,gold} as extldflags.
>
> Introduce FOO_EXTLDFLAGS, that packages can set to pass such flags.
>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Tested-by: Nathaniel Roach <nroach44@nroach44.id.au>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Thanks,
Fiona

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
> index 8e27602d41..206688fa7b 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -114,10 +114,14 @@ ifndef $(2)_BUILD_CMDS
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


--
Dipl.-Ing. Fiona Klute
Mollwitzer Str. 2
44141 Dortmund
Germany

USt.-ID/VAT number: DE363488944
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
