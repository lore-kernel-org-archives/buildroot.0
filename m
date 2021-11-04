Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE87C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 06:47:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E37D260232
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 06:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E37D260232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7CB781028;
	Thu,  4 Nov 2021 06:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id geHfaKvHye7P; Thu,  4 Nov 2021 06:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3C4281024;
	Thu,  4 Nov 2021 06:47:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB2A1BF3F7
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 06:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31A7C404FE
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 06:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNiEenPvotZS for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 06:47:32 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTP id F00B6404FC
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 06:47:31 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id iWQFmF5cVsfk3iWQFm7YoU; Thu, 04 Nov 2021 07:40:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636008028; bh=cr+QUHL2C9MQ8lFlubnmFNi5cc1ymNB9xCElWL0mRak=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=KwqYOSALzcYXKVVnD0u2ONeeKlRnOZw/8Uzz3G56DPvR+6r6UQi5GVIxtoa8+SKcl
 pTaVATvspZPmY7BibDAgOpLY8mslvS2e9eWXD3tdntStaCh+MdphMAIRVLS9EUzcSI
 hTvSKSv597KJ/ROi42wwjD6C/JtK2OevZ47BoLcrlTR3rli32f63LUpmmM4uqjEDDG
 X7OhqlZ8uFQI1S8Q48P76zcyypvWNZRJ2xcIY8BAwk9tqiOyeA7Gv1iSeVRr0rog4r
 iEXPo8Y+5yFUz9qjw36LNBfuSJBh/cu03YRIq8yfFsjuvDS2CgnrLDyBFhFoa02QxV
 5ZZTfGHD3teMQ==
To: buildroot@buildroot.org
References: <20211104063807.139604-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <c6edd889-66d0-6b04-2a54-dccdfcd98dec@benettiengineering.com>
Date: Thu, 4 Nov 2021 07:40:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104063807.139604-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfLLUeNisyMn/UC1v4i+ipjDvC9p2tR2a/LnEniU7rgNcGb1bv3ji8ABZXwCSXTd4keqYJZtnlPL5PFSesnmrKGtejBn4ciIOSXhf98AsfAybfYRK2xc8
 weai+cIxe4fdQgVfHdYZNBZkea5r4i5ZKPBdOA9q+4RFPmKrHjjO0zm4F4wdPtHUVgSnQ43Eu2i1bbzX0UrWlXsZV4JrysVEWQaVY9Tavk95eDpQueKzsSbK
 O8sm14lWzxGxKr7icPaXQpIE0o624QgW4DGlcebr044hykQT7JWptsFT94BnUHr4rRgcp7jNk7s4kQcjWFCnCA6m8+sNvGjvsdd/2MGtHa+rWtM01POupiC1
 s4HrLZ5+kfGkQW4xYLAnAJqnberJhXFmsP+c977THcDCMjbJ7NSkjrvnF0e7kYBFd7CTdhr48P1y7VKqYApQ84ncJ7zoXD+nCHjvRqgA5VkamOE9Zjk=
Subject: Re: [Buildroot] [PATCH 0/2] Rename sunxi-mali-mainline* to
 sunxi-mali-utgard*
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On 11/4/21 7:38 AM, Giulio Benetti wrote:
> With this patchset I re-spin a part of a pending patchset[1] to rename
> sunxi-mali-mainline* packages to sunxi-mali-utgard*. This clarifies which
> kind of Allwinner(sunxi) Mali driver/blob we're dealing with and for the
> future it makes more clear adding Rockchip Mali present in the same [1]
> patchset I will take care of.
> 
> [1]: https://patchwork.ozlabs.org/project/buildroot/list/?series=162754

For patchset[1] I ask to tag as "superseded" patches [1/7] and [2/7].

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Miquel Raynal (2):
>    package/sunxi-mali-utgard: rename from sunxi-mali-mainline
>    package/sunxi-mali-utgard-driver: rename from
>      sunxi-mali-mainline-driver
> 
>   Config.in.legacy                              | 42 ++++++++++++++++
>   DEVELOPERS                                    |  4 +-
>   configs/olimex_a20_olinuxino_lime2_defconfig  |  4 +-
>   configs/olimex_a20_olinuxino_lime_defconfig   |  4 +-
>   docs/manual/adding-packages-virtual.txt       |  2 +-
>   package/Config.in                             |  4 +-
>   package/glslsandbox-player/Config.in          |  4 +-
>   .../glslsandbox-player/glslsandbox-player.mk  |  2 +-
>   package/qt5/qt5base/qt5base.mk                |  2 +-
>   .../sunxi-mali-mainline-driver.mk             | 41 ----------------
>   package/sunxi-mali-mainline/Config.in         | 42 ----------------
>   .../sunxi-mali-mainline.mk                    | 49 -------------------
>   .../Config.in                                 | 20 ++++----
>   .../sunxi-mali-utgard-driver.hash}            |  2 +-
>   .../sunxi-mali-utgard-driver.mk               | 41 ++++++++++++++++
>   package/sunxi-mali-utgard/Config.in           | 43 ++++++++++++++++
>   .../egl.pc                                    |  0
>   .../glesv2.pc                                 |  0
>   .../sunxi-mali-utgard.hash}                   |  2 +-
>   .../sunxi-mali-utgard/sunxi-mali-utgard.mk    | 49 +++++++++++++++++++
>   20 files changed, 200 insertions(+), 157 deletions(-)
>   delete mode 100644 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
>   delete mode 100644 package/sunxi-mali-mainline/Config.in
>   delete mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.mk
>   rename package/{sunxi-mali-mainline-driver => sunxi-mali-utgard-driver}/Config.in (60%)
>   rename package/{sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash => sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash} (66%)
>   create mode 100644 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
>   create mode 100644 package/sunxi-mali-utgard/Config.in
>   rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/egl.pc (100%)
>   rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/glesv2.pc (100%)
>   rename package/{sunxi-mali-mainline/sunxi-mali-mainline.hash => sunxi-mali-utgard/sunxi-mali-utgard.hash} (70%)
>   create mode 100644 package/sunxi-mali-utgard/sunxi-mali-utgard.mk
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
