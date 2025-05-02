Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D16C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8AB781882;
	Fri,  2 May 2025 10:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLpBlx4JupbK; Fri,  2 May 2025 10:52:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC79B81DE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC79B81DE6;
	Fri,  2 May 2025 10:52:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54F8C229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4623640DC6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cph-IDAnr5u5 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:52:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 746284090B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 746284090B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 746284090B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 82B061C0D8C; Fri,  2 May 2025 12:52:33 +0200 (CEST)
Message-ID: <c50e2b03-e247-46af-9e2f-24b442d757d8@rnout.be>
Date: Fri, 2 May 2025 12:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20250418144104.24180-2-dalang@gmx.at>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250418144104.24180-2-dalang@gmx.at>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183153; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WdJtg+deBxsvt32jJ9qy5zB9EunGJ+13Y5ved/VIPTs=;
 b=MPTMbaanldWlyTmezD+HGnbVNKx49TUrDda+ENFYUVPgVaI/5QBX2fexc7lT4378cfL+Cu
 ZW24SWhZC1H3fOXpSxhk/tJD6H4gEWYDfkAgXxS6/hVo7YBGWIUUJodANw9Fw3m4aG4fj+
 sJnvImk8oWmFnvoe2DHs30tEKacr2H8DgO7qkm7O3qNrwJXUb90OMB0EpovJgFzxDQptmq
 2VlvTN5+vsZcLZ+p9wLNJ7I1jJ0QTaq1cnUbuh74O3S4vrIzraMx29YGwFbD/gqqLYRgOC
 dI52TSUrnnfYzCqWfc31DdC+ffH6DjsBAfJXoxA+UfzkSpI3mx6ch0d1ylo8iA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MPTMbaan
Subject: Re: [Buildroot] [PATCH] package/pangomm2_46: bump to version 2.46.4
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



On 18/04/2025 16:41, Daniel Lang via buildroot wrote:
> https://gitlab.gnome.org/GNOME/pangomm/-/blob/2.46.4/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/pangomm2_46/pangomm2_46.hash | 4 ++--
>   package/pangomm2_46/pangomm2_46.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pangomm2_46/pangomm2_46.hash b/package/pangomm2_46/pangomm2_46.hash
> index 8d05dbc2ff..eb4e1c58e9 100644
> --- a/package/pangomm2_46/pangomm2_46.hash
> +++ b/package/pangomm2_46/pangomm2_46.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/pangomm/2.46/pangomm-2.46.3.sha256sum
> -sha256  410fe04d471a608f3f0273d3a17d840241d911ed0ff2c758a9859c66c6f24379  pangomm-2.46.3.tar.xz
> +# From https://download.gnome.org/sources/pangomm/2.46/pangomm-2.46.4.sha256sum
> +sha256  b92016661526424de4b9377f1512f59781f41fb16c9c0267d6133ba1cd68db22  pangomm-2.46.4.tar.xz
>   # Locally computed
>   sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
> diff --git a/package/pangomm2_46/pangomm2_46.mk b/package/pangomm2_46/pangomm2_46.mk
> index 1725158491..3640641af1 100644
> --- a/package/pangomm2_46/pangomm2_46.mk
> +++ b/package/pangomm2_46/pangomm2_46.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   PANGOMM2_46_VERSION_MAJOR = 2.46
> -PANGOMM2_46_VERSION = $(PANGOMM2_46_VERSION_MAJOR).3
> +PANGOMM2_46_VERSION = $(PANGOMM2_46_VERSION_MAJOR).4
>   PANGOMM2_46_SOURCE = pangomm-$(PANGOMM2_46_VERSION).tar.xz
>   PANGOMM2_46_SITE = https://download.gnome.org/sources/pangomm/$(PANGOMM2_46_VERSION_MAJOR)
>   PANGOMM2_46_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
