Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5323AC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 20:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 067B4410A4;
	Wed, 21 Feb 2024 20:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVwe5A_gusbP; Wed, 21 Feb 2024 20:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C15741552
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C15741552;
	Wed, 21 Feb 2024 20:43:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2CEE1BF41B
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF50D41552
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzmV62qT_L68 for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 20:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27C5B410A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27C5B410A4
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27C5B410A4
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 20:43:27 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ctR6rqVFPMMFBctR7rh0Fq; Wed, 21 Feb 2024 21:43:25 +0100
Message-ID: <befc5419-5d4f-49ff-ab3d-b12cecab40d0@benettiengineering.com>
Date: Wed, 21 Feb 2024 21:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240221182304.647302-1-james.hilliard1@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240221182304.647302-1-james.hilliard1@gmail.com>
X-CMAE-Envelope: MS4xfGDIIoYJqlk3N4fKHgISOs6D52v4bJQJGigYBssNrutcIjHOtXJkC6GpkYg4rNSK5/wX3+spyvh8aHKN/mez4aLTQ6plvff3fro6Z43qxVy/Wq/0XKBj
 PgHsKnJAjs7HSj3TbazYbBXulrlT3qqtL2pazdX9aOuYFXG2WiMKoVkFURQZB61gpGmaxA0xVc15DMhlcG/nLE39LEz9YH8bnn2UZMG2puJaJDRAt0oRfAcs
 RIT8HCc1EPRmdr1uvRvj3A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708548205; bh=vO+/oImV4Yfy47p0wh1IXmliz4xduAfYWdHTlawNTIg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=FzWCcfx9d2HgHExkLf+kkf2Hqqn5CLVk7M5aabV4ivDQ5Kok3OWiJNZS86wsbvdBT
 stY/4B5A0QTdp3V1a0QY+PEgcQN2TzuUjmSfzbsXllhVmJaMm2+CeQwzXcmhGunkgG
 E80trDKWAf8ZToVALxbRVR3ZSsqKyLWSuoFddrTR1KJT/ct+0LJH+0CZbnU3DJglwb
 7ktRKt9Csr4z4Clt13j2my/d8BcSDd+3q7sg8JZUfa2+7kdrQMhxNBAdCq5+UBcbBG
 FNA0omrPFTfyW3ipNi8GwUb6bf8kDPQkHa5JkLDxG0dHCFeX/+eJvP4yHJZNdTUU4z
 xQDuaD0SMMQaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FzWCcfx9
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2023.12.1
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

Hi James,

On 21/02/24 19:23, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

thank you,

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
>   package/swupdate/swupdate.hash | 2 +-
>   package/swupdate/swupdate.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
> index c19a82304f..19ef3a2724 100644
> --- a/package/swupdate/swupdate.hash
> +++ b/package/swupdate/swupdate.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  ce24032300e2b6a6faa3d22e49f981fd90f04ac6f5d7e802166824b0cd5ca669  swupdate-2023.12.tar.gz
> +sha256  89ec8926d66627255fe689ed96ad8d30f5c539315956dacf9890e308095dee3b  swupdate-2023.12.1.tar.gz
>   sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
>   sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
>   sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index ca8c140886..3b78c160f8 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SWUPDATE_VERSION = 2023.12
> +SWUPDATE_VERSION = 2023.12.1
>   SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
>   SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
>   SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
