Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA28C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:20:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050386120D
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 050386120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDDD181B8A;
	Fri,  5 Nov 2021 22:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xf1_EfUklhLS; Fri,  5 Nov 2021 22:20:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2865F81B23;
	Fri,  5 Nov 2021 22:20:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF5081BF386
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEE1C6F933
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCr65Ma_nlk7 for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 22:20:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABC36605AE
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 22:20:24 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id j7ZPmLnwKueW5j7ZPmdHPH; Fri, 05 Nov 2021 23:20:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636150823; bh=a+I48AyrNLHwCHTC6BGhJK5SGSYLJn76PwqDuaSuuu4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=cDG303hHc+LHRTnjdZF9bsaIQFTJVUMVpEIFvZtYTOkIeHJx7TTpMMTSPOUyufNU5
 0cZk4CTltEtuVnziN7KhJW80Sl2H3WTjZf74mYI9zSZuyOW+1YRBe+TmiAnPNXd5L7
 6cYgRed3ShKWVYQORwgUSLqCUFT4f/ZditPAtdIflpCa1OkXRSyGlB/nGt+neBTyWk
 nKPoa+yGVB/t0avoVnriBQUTWeGokpwkTTEzFlorcGZ2lgCWoPRLf9MPT0b4ho2ML2
 m9GHROWBWA31S8Aqgkpt6OnrygYclZz5ul4zF5PMXfO+iZTotIvcYQBJYm5afYI91z
 /aTDRavrV0LBA==
To: buildroot@buildroot.org
References: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
 <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <227bb640-7ee0-9dea-6dd3-1e6fe10d45e3@benettiengineering.com>
Date: Fri, 5 Nov 2021 23:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfB2diJHRUlWNs9a8r4tDL81aOU70LEXKdp24a+74CgTSZwm6y3AyvxFE3tMhm90YgVMIgPIMVNldC4Pq5hlx3NrMNs06ymggrnBzrEAbAxJFGVoCyKE8
 FzE6sBsu70en96EUXcMnN4eFPkcJn31cCqxWw8SITth5PKTCBscRVhhfabB8sBveHmvsuLbD84bwuoKnGoBo0VWgNzF3Hn9qKVUMhiAIP0dGK8ggIMN7ZGGY
 B5imzWxqkv+xox8gM/JJp6yckav/k45PmI2C2adnFZsRW5WEH6I1HxMBWHyntg2cOr7WME1PZekzGXHrewFZ3OJ4Ar52+JJ0HYN/jitSHp16uNK/A86G1Q7C
 v5AHbGZdL96xtZErM7BqSJMmrIem4YxspsQYMGVF4jqYbyuZtX5PLJhZet7BIYCd/cilhTLZs0sOdG5+mcCRFYUGaiQ6qO14SpEJSoqTWjpaD5/p3h4=
Subject: Re: [Buildroot] [PATCH v2 0/5] Rename sunxi-mali-mainline* to
 sunxi-mali-utgard* and fix Mali loading
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

I've realized only now that this patchset had to be v3, sorry for the noise!

Do I keep v2 as it is or do I resend?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 11/5/21 11:17 PM, Giulio Benetti wrote:
> With this patchset I respin the first 2 patches. While testing on hardware
> the patches they work, but I've left back an error while bumping linux
> version to 5.14. The error is that Linux's sunxi_defconfig(used by both
> a20_olinuxino_lime/2) enables Lima driver, but in this 2 boards we want
> to use Mali driver, so when Mali driver tries to load(being it a module),
> it finds that Lima already has taken gpu resources and fail. So here I add
> 3 patches, 1 to add a Linux fragment to disable Lima in Linux and other 2
> to use that fragment in a20_olinuxino_lime/2.
> 
> Giulio Benetti (3):
>    board/olimex/a20_olinuxino: add linux-disable-lima.fragment
>    configs/olimex_a20_olinuxino_lime2_defconfig: use
>      linux-disable-lima.fragment
>    configs/olimex_a20_olinuxino_lime_defconfig: use
>      linux-disable-lima.fragment
> 
> Miquel Raynal (2):
>    package/sunxi-mali-utgard: rename from sunxi-mali-mainline
>    package/sunxi-mali-utgard-driver: rename from
>      sunxi-mali-mainline-driver
> 
>   Config.in.legacy                              | 42 ++++++++++++++++
>   DEVELOPERS                                    |  4 +-
>   .../a20_olinuxino/linux-disable-lima.fragment |  2 +
>   configs/olimex_a20_olinuxino_lime2_defconfig  |  7 +--
>   configs/olimex_a20_olinuxino_lime_defconfig   |  7 +--
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
>   21 files changed, 206 insertions(+), 159 deletions(-)
>   create mode 100644 board/olimex/a20_olinuxino/linux-disable-lima.fragment
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
