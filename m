Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AA1C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 22:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342D440606;
	Sun, 23 Feb 2025 22:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSeZynGMKMRm; Sun, 23 Feb 2025 22:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12B4340694
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12B4340694;
	Sun, 23 Feb 2025 22:58:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8CB9943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 22:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF6984076E
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 22:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89JWnj2D-aSB for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 22:58:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D43840606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D43840606
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D43840606
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 22:58:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B4E205FF88;
 Sun, 23 Feb 2025 23:58:40 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 23:58:40 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 23:58:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <5e819993550219b8f32aed81a29672d4ed355aef.1740345268.git.yann.morin.1998@free.fr>
References: <cover.1740345268.git.yann.morin.1998@free.fr>
 <5e819993550219b8f32aed81a29672d4ed355aef.1740345268.git.yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <61f07a625659aa0d6dd855355361f1af@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740351521;
 bh=l80HHTjt1HyMNFT0KsizpUmOQSYOsZZMCYygaJ3P6Io=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YQ3u+EmI1MsJOJw8zEuNJRhkAdJ96ZzJ5zwgUf9wIoAZA4x6AaUJ4i88FyQJihh3D
 k4Jwq/Z6uKs5cfOtNUAJQFm8LeLYaMyqyCFPBYrxe7aoxkeXpBn29iSkkpJRsbjI0L
 YdjPngkghuC5HYUZ40BTERpmfVg/+EN19wyBbvhhImcTiKQ2x9pIG7IVHrgOx9sa9O
 7LI7d6bZE8GD6D/ZcjlAMlcZ2JJK44GRiNrFTS/gSGZ0UuAoLP04suqS/1yaEeK4AL
 fBtG0RjBC/s32kh+Dm2VFc1a275beX8Gr6ixp4Kw0sqshtg72W1irkxoncR5wKIRfM
 Fuc+0jmsm78GQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YQ3u+EmI
Subject: Re: [Buildroot] [PATCH 7/8] package/netavark: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Nice patch series!

On 23/02/2025 22:14, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

[...]

> diff --git a/package/netavark/netavark.mk 
> b/package/netavark/netavark.mk
> new file mode 100644
> index 0000000000..e674da7e5e
> --- /dev/null
> +++ b/package/netavark/netavark.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# netavark
> +#
> +################################################################################
> +
> +NETAVARK_VERSION = v1.14.0
> +NETAVARK_SITE = https://github.com/containers/netavark
> +NETAVARK_SITE_METHOD = git

After a very quick review, I noticed the license information
are missing for this package. I'm thinking to _LICENSE,
_LICENSE_FILES and license hash.

See:
https://github.com/containers/netavark/blob/v1.14.0/LICENSE

Could you add those info please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
