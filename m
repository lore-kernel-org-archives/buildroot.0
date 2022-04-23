Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F957C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3F27405D8;
	Sat, 23 Apr 2022 15:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVNqzs-rp8vb; Sat, 23 Apr 2022 15:07:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82FBF400F8;
	Sat, 23 Apr 2022 15:07:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71E9D1BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F5A08336D
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORUWllpwlvt8 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:07:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A22B8832EB
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:07:32 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id y10so21543861ejw.8
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=XqDZ/xPoskEzA6J3dNZCpQWLmhbjkHRdPb+81+GLGJw=;
 b=DsVHP1IUYYnzdDxpHvv3BSiIvbM2DvuP9nCU2Vpa0MXHaEWBDT0jH05TVwUDGj4XiI
 IkE+2IJ7fOOIH621IMOtgTtb0lcH/7O8MmsLrAfnpnYolSYPEDuLa5JxwS789MSMO+7n
 g6dTSqp/UIhFt5wxdG9U+uU2BHdajVUs+FqQHQsOUFCy+Ca5yg0G8p8BiPQVGCZwaqxC
 CTe5ekNT2eJnLxh/IRbPdXVfJa5GSsVHeI6NJPs6Fs3phEWaAG+xobsz7w514RWrTefA
 6OzV5r1xWfPIZ9YB0rOuFNJ9KMzmTBx+symF6ohjYqXMrwfg62+y4Px/76JRait4QVJm
 grNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XqDZ/xPoskEzA6J3dNZCpQWLmhbjkHRdPb+81+GLGJw=;
 b=6DUg4kgYGzbyd0lkoncnCYrDxsVGuQdFYHHRQinFwCKaFczs0J+Jd/tZyFyh8dRAbq
 l4oNrcu2k4EoKWjkfSchEOoKtRoSEKv/fasDoAUeDugywusggd2I6fulwS4fFmrlg9+N
 lxQJzKQ1OALPOUt8VkcCAbOvFRnxIyJ200vachcAeEIRIg1KrVSW3anvT3fp1A0JfWPU
 tD2QYkGztcDQR8Tq0gU/oRlAHi6HqLnQjFE9d2Nf6t7xiGA8IObU+qYXySWq06EXiOoN
 7/cApyDliYsiNgX5zFeBZmOqVSHjO3qejYnK9dLX3v9IHXjYbPy4Rhlyu84mDdPLEtQD
 0h1g==
X-Gm-Message-State: AOAM531nx9/8ASejWF/+ZSxHM7UEHD47L2tHj6PsN2QHANGTstD/YJc0
 74Wwrl+i7l7DDm7JX2jyjsLQlQ==
X-Google-Smtp-Source: ABdhPJy2+mOpXvQIN2rt8C6eZcawDb3UU7zTyP2HRJg2NLGKWRDdy6dVBQJ8hAzzJ60sbZWgp7Hr9w==
X-Received: by 2002:a17:906:846b:b0:6ef:af54:f2cc with SMTP id
 hx11-20020a170906846b00b006efaf54f2ccmr8520337ejc.662.1650726450808; 
 Sat, 23 Apr 2022 08:07:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ot2-20020a170906ccc200b006ef9bb0d19bsm1765928ejb.71.2022.04.23.08.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:07:30 -0700 (PDT)
Message-ID: <eedde80e-83a6-10e4-f6ad-90fd4a50ef69@mind.be>
Date: Sat, 23 Apr 2022 17:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
References: <20220419104013.23735-1-egorenar-dev@posteo.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419104013.23735-1-egorenar-dev@posteo.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to
 version 0.8.9
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



On 19/04/2022 12:40, Alexander Egorenkov wrote:
> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
> ---
>   ...ath-use-pkg-config-to-get-path-to-he.patch | 69 -------------------
>   package/multipath-tools/multipath-tools.hash  |  2 +-
>   package/multipath-tools/multipath-tools.mk    |  2 +-
>   3 files changed, 2 insertions(+), 71 deletions(-)
>   delete mode 100644 package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
> 

[snip]
> diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
> index f063848681ea..38558a9633d1 100644
> --- a/package/multipath-tools/multipath-tools.hash
> +++ b/package/multipath-tools/multipath-tools.hash
> @@ -1,5 +1,5 @@
>   # Locally computed:
> -sha256  ff45ddb18a1effbfbe5712f513dd3b7146c68141091fc1c2489af8d6197026ef  multipath-tools-0.8.8.tar.gz
> +sha256  27a426facea0474e6dc48e026a94f7c86890d3f27b439b07ec26b0b9887b0cc4  multipath-tools-0.8.9.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0

  Hash of README.md changed as well. In the future, please run make legal-info 
to verify that the license files haven't change. And if they do change, please 
make sure to comment on it in the commit message (the important thing is to be 
sure that the license hasn't changed).

  Regards,
  Arnout

> diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
> index eecfe3900233..c0b7c5721ebe 100644
> --- a/package/multipath-tools/multipath-tools.mk
> +++ b/package/multipath-tools/multipath-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MULTIPATH_TOOLS_VERSION = 0.8.8
> +MULTIPATH_TOOLS_VERSION = 0.8.9
>   MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
>   
>   MULTIPATH_TOOLS_LICENSE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
