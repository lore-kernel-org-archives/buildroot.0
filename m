Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B402C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 18:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06BA281442;
	Wed, 28 Dec 2022 18:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06BA281442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCuQAUtaItQT; Wed, 28 Dec 2022 18:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58C0780DA6;
	Wed, 28 Dec 2022 18:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58C0780DA6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F86B1BF40A
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 880E2401F1
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 880E2401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Rmn_oPILuNq for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 18:52:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84D5940153
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84D5940153
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 18:52:06 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AbX1pR5UoU5qIAbX1peXUF; Wed, 28 Dec 2022 19:52:03 +0100
Message-ID: <325af504-ce4f-0651-3c92-cda83c982901@benettiengineering.com>
Date: Wed, 28 Dec 2022 19:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20221217230921.1580107-1-christian@paral.in>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221217230921.1580107-1-christian@paral.in>
X-CMAE-Envelope: MS4xfHvHVLOeNqkVEj+EROenujaodD7auLHZ8DzJrCFNXBYStIj0rR9zPHa8m3yDBwl5zlRCQcdaxwE3Drn+Kin1q4jASDMBh9VWpkxVj89zKUeGmU+5/vrK
 bQh2SjeytsYTKUR/sKfELSQ0Q/oR0MrTbtArDF+6BjdqkL/OT3hxgmA8X1bm+6vvpHzskPhIiMREKNJwacMnVqgdEaEm9CNivjnsYR18V3ErcziFY5/XO8Qm
 8LwlPgpCT+LlYWSsq0nZM7mCH+vFqBFWLp2W//gBKKrIUckw0RlhcPZFRSB1TFwQmbdC2jA2aytOGfcraOyHluLCUz8clKhtD9DGEDvH8ipx01YZfmLrr8nv
 W0xt4JXA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672253523; bh=3EJlkSCAHKHF/8xVSiZ8H3m8tR+U7hv7Bus115yJPKY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=H6Gfy/OB3WDrvBDA4tHK53TRvGl8qACnuIzXQYm0vPGi87/0KDi9Qa07Z4uAe0OEg
 NFRYQTAGLmamgHDv9PEyXRGwTTQX4JBVpiXPSqvZ3ncCgQ5FUZxaR2ksexmK6cSrRj
 cVuDv/tR13Nktuavej0BAG9MBnTb/t+XkqLu10cKRBpDSLVTxI8ZCr2akDd4SHrL6q
 xJ7sDPh3T+XMnw9pW2rZnuCWV/naZc4uRnKQFEuhHz5hw0m336aF97lTpMWa4ZRcs2
 kisHK/71gaZtNCyc17jUNuLT42EIfVQ9/FE46siHhD8oBBpf3HaDmykjbHZEDhaokF
 DQN3IO84y3rTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=H6Gfy/OB
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8812au-aircrack-ng: bump to
 latest commit 450db7
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian,

On 18/12/22 00:09, Christian Stewart via buildroot wrote:
> Fixes build against Linux 6.1.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Can you please reword the commit like Arnout suggested here[0]?
Also please add:
```
Fixes: 
http://autobuild.buildroot.net/results/4f6/4f65b521d5c6cffdf5f6294ce0257b9a19e441fc/
```
that is the autobuilder failure.

With those:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

[0]: 
https://github.com/buildroot/buildroot/commit/121184d746bc1a21385e9f20728664b257b52682

Thank you!

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> ---
>   package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
>   package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> index bc3a926314..f6779fa60a 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  eed4888da9cfdc0f83ad3335beaf73af33ce0796b0a2637aeec102d47e1eb8f0  rtl8812au-aircrack-ng-e7a4a390ccbdd768411e1b2a8922c47837f76b47.tar.gz
> +sha256  8db7fc45ea8744a4fd7c1d16fa9486d7646d955e84ed8fd11d93b2293ab5aeff  rtl8812au-aircrack-ng-450db78f7bd23f0c611553eb475fa5b5731d6497.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> index 45a6ce5729..d145208b5f 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8812AU_AIRCRACK_NG_VERSION = e7a4a390ccbdd768411e1b2a8922c47837f76b47
> +RTL8812AU_AIRCRACK_NG_VERSION = 450db78f7bd23f0c611553eb475fa5b5731d6497
>   RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
>   RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
>   RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
