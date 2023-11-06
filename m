Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA87C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 10:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6ADD41193;
	Mon,  6 Nov 2023 10:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6ADD41193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zu8dhf-MAxwT; Mon,  6 Nov 2023 10:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B62741464;
	Mon,  6 Nov 2023 10:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B62741464
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64A2D1BF316
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 10:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DC6B82064
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 10:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DC6B82064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cvj8BKGwvuuy for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 10:40:40 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5B8C8205A
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 10:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B8C8205A
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id BC8884402AC;
 Mon,  6 Nov 2023 12:39:43 +0200 (IST)
References: <20231106102651.2796878-1-jamie.gibbons@microchip.com>
User-agent: mu4e 1.9.21; emacs 29.1
To: Jamie Gibbons <jamie.gibbons@microchip.com>
Date: Mon, 06 Nov 2023 12:39:50 +0200
In-reply-to: <20231106102651.2796878-1-jamie.gibbons@microchip.com>
Message-ID: <87msvrf9lp.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1699267183;
 bh=0Nkcu2FrivkFTs7OU+w7/USvqHwuHgrnmaCbB423ZTI=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=URQXvsSARPu6JS7EJq2HJxNEGGP6RrE6bm6F6burZtJczAFHqvlF0mqACgrEZrvWU
 UzV3h4nlcRXZDXiXcL153hX8ku8KycOU7euhocIPB9VeZhvxjygPKbwaiPJg32PUEi
 d4HWWpQ/ZjEZFd/SiybUxs58A26t4sq6FW8bizE2LraGvzlmn3BqciIcCtlafrl4ys
 mFF3WjatzHmlBdX0MQn7e9UY2670FlU7vqcZFhuGBXCZx9OmZQlfHhFI5E0XKzrPv8
 KrF6q6y5wCUZvG90yLerKVj2gyg05SkJmQGMVj50XA2zFNRELrhg996nG7oBfi/GNy
 yvzvVYkgI9y5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=URQXvsSA
Subject: Re: [Buildroot] [PATCH 1/1]
 package/microchip-hss-payload-generator: bump version
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jamie,

On Mon, Nov 06 2023, Jamie Gibbons via buildroot wrote:

> Bump package version to latest release.
>
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> ---
>  .../microchip-hss-payload-generator.hash                        | 1 +
>  .../microchip-hss-payload-generator.mk                          | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git
> a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
> b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
> index 69e05e18af..f827d2b752 100644
> --- a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
> +++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated
>  sha256  f6f69412caf886e88abbf26de0dee1db790c790b89571f2f0def1e2f3620f057  microchip-hss-payload-generator-2023.06.tar.gz

This stale hash should be removed.

baruch

> +sha256  447771d4219176acc69c6d945ff40a0f3d0c5cbe63619927bc61b9e52ab05136  microchip-hss-payload-generator-2023.09.tar.gz
>  sha256  0b67b1d44bcad078580fc5d8e9580a48a9466b769db58aeb1631d4c5ef97e08a  tools/hss-payload-generator/LICENSE.md
> diff --git
> a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> index 63ae22ed60..4c3ca93dfe 100644
> --- a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> +++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.06
> +HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.09
>  HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call
> github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
>  # Some parts of the repository are under different licenses, but we
>  # are only building/installing the code in


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
