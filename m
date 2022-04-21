Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E97C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BBB140C66;
	Thu, 21 Apr 2022 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_Qz0Rv29HGW; Thu, 21 Apr 2022 20:52:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 917F54106E;
	Thu, 21 Apr 2022 20:52:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C73801BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C27F060B2F
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BJwN725AD1F for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:52:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9926760A74
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:52:21 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id x3so3900519wmj.5
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FT4UNwwkkaXxRqTOpGjWceqRMZh1o4pnNECp5vj+Zrs=;
 b=RdpEpjm71/uUurZr4VbezzrsuLOO7nk/woXO+QBkC6gxoK7cC+GmOvlEfUes2AW3vF
 9FAg7I/E7NPy55NVhihniDXLD3Y/pe+a2nU9M8vjQ7c6G4eNGho7UIEFKnQ14p1hNaM1
 LxPK0C9nfHalSQrU5lBo4bF5D8pNHA2/gIU+t4SlXZK4pUTkty0CEdk+B/2QKgiwpQC8
 zNAlBZkq/W9bPr3vlqvwGYNkPj+cr3x/SwNXbntZjiNtAnm8CnpMqHqyynE0Q6riCFDr
 yzcGCgNoXi7m5K5/jjgOk4BMQ+Y1He3vz/Mbvlp4Y6J7XEDm+/XeLLLgGV2ivpjzx7in
 J51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FT4UNwwkkaXxRqTOpGjWceqRMZh1o4pnNECp5vj+Zrs=;
 b=HqkKygWajs6X2sF29oBItsLQh3wy1OyQrsaQ5BZnqc2qlwxc7MFekoomKFr77ARuYW
 yDT3VB/xlk4zcZcK7AKy58Ac0Q8VcUFBOI1C7dU77qQQEDLeHfJqFUykuMW23PwZq1K8
 l1qv7vILRAd+FnYC+jw5MtdVHS14F5Lp2H9Be9QaNpd+gJApFa7BU23FI05rvRMOmHgX
 hkVPSv4NxMbp8dZR8CfW0xbdTI4ozQDU+IAfcnax6PDl8/z9/5drRV1BSLNcGcGR90x7
 2UaRt1ez9vbtTOkwpxOu/hk9jiuVbp1ztJx4uSnbDgG4pLXuqnSlRagIMkpaTHzRxVJk
 3oyA==
X-Gm-Message-State: AOAM532mO6d/+9zLjNKs8yU5+ozl6Uo6b+LkoWxewRaPZbVlKf4yh7Yd
 y6bmCebjWjZ69bVJZ8kqEOAVwQ==
X-Google-Smtp-Source: ABdhPJxkbmrRTfNepPvAWqrCPAx2L3iN1nrdns8W/kQSu1FbFizyjUcy4HwoAo4GNrzy6BB8mzM1+w==
X-Received: by 2002:a1c:2b86:0:b0:392:ae97:2fec with SMTP id
 r128-20020a1c2b86000000b00392ae972fecmr978787wmr.165.1650574339730; 
 Thu, 21 Apr 2022 13:52:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfa506000000b0020ac34ec647sm66529wrb.110.2022.04.21.13.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:52:19 -0700 (PDT)
Message-ID: <73382900-8d51-e3ef-483a-7d4390c950b7@mind.be>
Date: Thu, 21 Apr 2022 22:52:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220416150604.1965916-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220416150604.1965916-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libsigsegv: bump to version 2.14
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/04/2022 17:06, Fabrice Fontaine wrote:
> This bump will fix the following build failure on or1k and microblazeel:
> 
> In file included from handler.c:20:
> handler-unix.c: In function 'sigsegv_handler':
> handler-unix.c:194:28: error: 'struct vma_struct' has no member named 'is_near_this'
>    194 |                       : vma.is_near_this (addr, &vma))
>        |                            ^
> 
> https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=blob;f=NEWS;h=4d012f8b6cd9b2c1eccbf266a10aae56b0e79978;hb=9ad117adabd223b79e037575e071855c2b8b35c0
> https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=blob;f=ChangeLog;h=c52b227aae190ba9b161282efaa5f33cb4a127f9;hb=9ad117adabd223b79e037575e071855c2b8b35c0
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c693fafb8f1f68be30a281313fb1f0890cc08b1e
>   - http://autobuild.buildroot.org/results/ecde11129d102e3321b2aaef407697c29311c705
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libsigsegv/libsigsegv.hash | 4 ++--
>   package/libsigsegv/libsigsegv.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libsigsegv/libsigsegv.hash b/package/libsigsegv/libsigsegv.hash
> index c827e6b866..13978da398 100644
> --- a/package/libsigsegv/libsigsegv.hash
> +++ b/package/libsigsegv/libsigsegv.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.13.tar.gz.sig
> -sha256  be78ee4176b05f7c75ff03298d84874db90f4b6c9d5503f0da1226b3a3c48119  libsigsegv-2.13.tar.gz
> +# https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.14.tar.gz.sig
> +sha256  cdac3941803364cf81a908499beb79c200ead60b6b5b40cad124fd1e06caa295  libsigsegv-2.14.tar.gz
>   # Locally calculated
>   sha256  8f2983e9a940367f48999881c14775db725ee643bce1e2f1ba195eb629a33cde  COPYING
> diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
> index 87a5d7a124..98bcd55c8c 100644
> --- a/package/libsigsegv/libsigsegv.mk
> +++ b/package/libsigsegv/libsigsegv.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBSIGSEGV_VERSION = 2.13
> +LIBSIGSEGV_VERSION = 2.14
>   LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
>   LIBSIGSEGV_INSTALL_STAGING = YES
>   LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
