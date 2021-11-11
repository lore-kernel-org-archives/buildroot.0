Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA260C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 18:45:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2707C61381
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 18:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2707C61381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBA7C40373;
	Thu, 11 Nov 2021 18:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETyN5n-yq2Gb; Thu, 11 Nov 2021 18:45:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 264EF402F1;
	Thu, 11 Nov 2021 18:45:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E2411BF45A
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 18:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DEB4402F1
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 18:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKhs947lj9QC for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 18:45:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DF1E4021D
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 18:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636656298;
 bh=cnVTCtO8t0u++Ln7W2PhPGyS0EiJctOyg+sN1kq/eQU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=TVUQfwSaoFARAYdn09971hHp+EMY5nCWOG4SqAih7veC0oi/kRmTeOPX+xz2JE5pe
 MhkcDYbZLQdFlsyvAsn85rmOBqwLPxWBGHO+4dOrYI4WlDlbY1zn+iJbivpx8mPSlh
 IJph+pXi2P0c3qRITrnVHcLOBZZxeSeDYhTZG/H0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.16]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KPg-1md1q42w8Q-010ICd; Thu, 11
 Nov 2021 19:44:58 +0100
Date: Thu, 11 Nov 2021 19:44:57 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211111194457.11f20259@gmx.net>
In-Reply-To: <20211111174457.4012093-1-james.hilliard1@gmail.com>
References: <20211111174457.4012093-1-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:iAdnuIb/Kq4JhdKAjdkKsK0ce8rbXpfbYZxEItkGbDnkMKVp/6P
 N3zV1teaoGO7fRGQWRGwQ6DGSSjTjJUwOog5CjTtHQWhvhgZUCRepeHIFqNqIQJ1dYrH2OB
 IVlD4HLe5sr5MNkJwEAgIod5A/VrCbomBK0NHhRN1aXQkWRhYkrX1LG3hMiG+PlSoIgyxik
 MfdCseUa1fSnndNM7CXUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cgSuIobA1Q4=:Qujta1TwFaJ4jd8mV+s4hj
 9Ai5/lBEe0S0cIS7z0ukUbDqtXqppNY8/o8K6pg5x+O0td6UX9IN2FaoNc2PcTv8Hv6EwU1xp
 7e6Zl79x5FMnGL84D2cDu0I4Tc0JuEEY1dWEiPLRm2pG2rsMEhpQUMgsmyvk0lPJOKEcZoU+s
 6X19+nUE7ZsztkJ/2nXMOWh3fdXsfAH0gluqRJW4qZ35T3kEbzgzwKTnzR+UdhGLhOG8UtEV4
 qaySsJLS/pRv+JKPCU0LaiLJyePzq3RncxbVCvNVocme2UDDHdSheDJ3KA5VRRgiCSqbAQKB/
 jxMH8z/wZ+XHFYZkFWzWdfmVlHTVx1xBM5atOV7OvW9ijKFJtwUXi9OCuitS10yB2b8wAdUcq
 3N3IEONfC9QYUX1q+Nn10A/pfcwxH4Wev1VJTY4rS4XgxwEaynWAYaWkEMcVSdDlDPSq0f0na
 TEbJcwTxJVUcg/yzWESR4GFD0gdtWqrsbwkhucvSabqoxdjO4ixZUp4KeCJzt6fg12ldKrB1q
 8OPWzRXkq5eydvQ2Bn77Vt287Fe1jps8WB3NN+Q4NK8IiRw9cfR13lZ5NXQeZ83jsXCPjonIj
 22kZxiLiaGRhC4W3WsJDtAJulCWjWHzpp7d4qBgEPbGNy/uEAwN6VUGhrIFi1JPUm1MWdmJEB
 O7igVwVWgKhqsMCBh3ODoYK0Y+sycZRdjywCCwREogDBxJlrJeMxcfvt7wJh7hcfZgyTkI7m1
 vzrK30xJIeM13pUwhLiHZFQde4R7tpJass++QNxYgbxHaZg1gJlmmlCqD25hZR/h83bdWeaQv
 Pm/2KtxgGYXDKXWOhVznnjcZnHP4IRYdefMOqgTHxuXdZv6bhwOsHAdec300tVi5kq0Ok/7hg
 uxyn1BA9rtb44qzH7v4YNMv2/6zPhcSzxgWsCjmKhgp1kmaP7x8MUioKqNUaXGvkdAbtAeAND
 z+DNthkvMIWAMDLH6VeR/0xB3BAJDGuZP+yCSMGAV2vvvMqxlvMexYcyI+Ut3BFODbuEAq4eM
 7DS+2yO1rVyobfB4hC6Tz3Fwz2JwvQn4shNCcs4s3TFzMIQUmgNv17GxHlN1CeELxZ96/0Ywe
 MNhWym4JpDJGh0=
Subject: Re: [Buildroot] [PATCH 1/1] package/libv4l: bump to version 1.22.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Thu, 11 Nov 2021 10:44:57 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/libv4l/libv4l.hash | 4 ++--
>  package/libv4l/libv4l.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
> index e45dd576bd..d473c0eac0 100644
> --- a/package/libv4l/libv4l.hash
> +++ b/package/libv4l/libv4l.hash
> @@ -1,7 +1,7 @@
>  # Locally calculated after checking signature
> -# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.20.0.tar.bz2.asc
> +# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.22.1.tar.bz2.asc
>  # with key 05D0169C26E41593418129DF199A64FADFB500FF
> -sha256 956118713f7ccb405c55c7088a6a2490c32d54300dd9a30d8d5008c28d3726f7  v4l-utils-1.20.0.tar.bz2
> +sha256  65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31  v4l-utils-1.22.1.tar.bz2
>
>  # Locally calculated
>  sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index 7b61823cec..1863b8cb97 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -LIBV4L_VERSION = 1.20.0
> +LIBV4L_VERSION = 1.22.1
>  LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
>  LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
>  LIBV4L_INSTALL_STAGING = YES

Sorry, duplicated patch, earlier version already submitted, see:

	https://patchwork.ozlabs.org/project/buildroot/patch/20211108231852.15687-1-ps.report@gmx.net/

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
