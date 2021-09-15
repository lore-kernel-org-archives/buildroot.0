Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E390CC433FE
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 17:06:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D5F361246
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 17:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D5F361246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02F734052D;
	Wed, 15 Sep 2021 17:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCClPeZlj40w; Wed, 15 Sep 2021 17:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 529F240530;
	Wed, 15 Sep 2021 17:06:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C9C31BF34A
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 17:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C1CC6063E
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 17:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sErLzB4L7qAQ for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 17:06:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 831C8605E6
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631725578;
 bh=3PbE1K4FZdAHVHT8VdGFIkPIsKKJX+aRv9kPbI8MQ14=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=KK7Tn3PPMSV0cTKSz4J7/eOVyBY3aBCkGO6O5pm6FcIaR0UwC0eYjmSRYXZIOz9oZ
 IxOJD6dHkHE8ZY6BcHicddT+1WrUlnKDtvoarYLIlKNtjf+FiTrEsi7lvPv9H/H117
 RTJspJeLXLexT3XiV+otfSUTppADRsCQroOYQPdg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.112]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUZ4-1nGMnG0YoO-00pwQK; Wed, 15
 Sep 2021 19:06:18 +0200
Date: Wed, 15 Sep 2021 19:06:17 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Rafal Gorczynski <rafal.gorczynski@ecosystems-group.co.uk>
Message-ID: <20210915190617.5d64460f@gmx.net>
In-Reply-To: <00597E818BDD634EB31FF8A2ECBC4934AB0ADE22@ECO-SRV.ecosystems.local>
References: <00597E818BDD634EB31FF8A2ECBC4934AB0ADE22@ECO-SRV.ecosystems.local>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:qGdSVPEu9h2szLG0s18iFSBdaF61IcC/Db4H+XIk7OfTDzXNtTx
 TA0uEx9MvrCn535Vu9L17e9xXjXpRKtna08yXasVQobT2/Fu63vm3cmU4UF7XMtacFWWkXW
 kUeB04zgtv5HOnO2vXs7jGVwrxSXsiw4cYpVLzvHmIQHGELku4aA4cL0yyiwFyywiNT9Aze
 j9AGsTbWLyZpN8WdBfHag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eTeTVBP2jE0=:PZcIxbukU7YLy4aSwWbgqT
 yUQf723y5Lfi+XYrJSvD9a9bClsHjjGPkF+5aLEAr3P4RoFDqmi/U/tdQzgaytXm2UAr8jrGJ
 GdJ9niPiFT/hK83URcLjMJ17GMYDTvjkWMBNLl+iQthinIMhAJrqUrPIS40QcRiuuLobj4Dlw
 eDSszzuavS3Z+gbNcrc/GKMiqkOKU1dwiHxTZop8A5+MgyPSWBSO9VEzkU9faGmYo7UPB+0HL
 Pl3PAaHbusC24BEdLt3jr9ufmA22vtA8yB7fmds4BepkpW4rvCDCb4YGrsyoWwzc+zc2oYnyq
 136T7m/5tUccj5vJyuylcfnr7TKoB8nFB09Tr53Mz5RC/dK5gHWhzL8yc4TKFIbUnWYVgZ5ox
 PJpdERY0abZ7D2HlKv2M0pWvARA8MegGnwooK6zY1qhTMErew43ltAFn3UdnDI6XzWER8j8EZ
 oH877vJSoFOzYAdrcPOKTbhed260LzLYZbhAqXXFDcj+FrUtRMwFRHQKA+atPPKvYq2Adt/FI
 KyxTUvM/xoNRIK7AIVHmkgbXFXpC00nNDv1g4Xgxag6ElZCCgkppjH9OU4kyjvAsRCm+Uo6v3
 u/UAz8PbJaY8XD1mEfiCiEDhYjluqaofhbmX47908CXXHeevtp5BIp4EgJmH0u57lHaTlFtma
 Iew5tQ+gSKaeltaONbX5bSnkqODDwOsoB1VCrRBf8h+bcVVDJPWp+xMtjYqLUG9hyjdyXAS4R
 h1P6Kfzk24QJGXQ+gjblLgtyLbrhwNwZOTUftKj9nnf4L2Ld1+EbyOX6wRozm1aaGsajUm2DA
 I5IiI5PiNiKvfOib9U/jewkQJx4opv9MlgoUQRQVUy1paNj3n7Ck2S5KJzfAyU4zScSM4ei0K
 QO5l3UZ0gpuOmmFqwrYdzaFs1igr7l4BEeFujpERacN5soPsI1dj1TJ6kvV8Voq+BfUaiM1MP
 iEvqHVRt2h7DJPWQCwtKfhVBF4O7GWmGzpeaFfFYIuUnEAnjUuYq4wg1KJdLam7wiErOmGaqy
 4jVJh+bCU4PnAoew3XuyKd5GNBsyMyHAF/IBSH+TKk1a40rvmYC51kSAm7y2uqhgIQw/rMxfJ
 oH8gQYlMaEMSpc=
Subject: Re: [Buildroot] A problem with running Xorg 2021.08.x
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello Rafal,

On Wed, 15 Sep 2021 12:47:56 +0000, Rafal Gorczynski <rafal.gorczynski@ecosystems-group.co.uk> wrote:

> Hi,
> I'm looking for help with running Xorg in my image, tried multiple branches such as 2021.08, 2021.05, 2021.02 with no luck.
>
> This is what I've received from Xorg
>
> [   353.565] (II) LoadModule: "intel"
> [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/intel_drv.so
> [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/intel_drv.so: /usr/lib/xorg/modules/drivers/intel_drv.so: undefined symbol: vgaHWFreeHWRec
> [   353.565] (EE) Failed to load module "intel" (loader failed, 0)
> [   353.565] (II) LoadModule: "modesetting"
> [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
> [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/modesetting_drv.so: /usr/lib/xorg/modules/drivers/modesetting_drv.so: undefined symbol: shadowRemove
> [   353.565] (EE) Failed to load module "modesetting" (loader failed, 0)
> [   353.565] (II) LoadModule: "fbdev"
> [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
> [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/fbdev_drv.so: /usr/lib/xorg/modules/drivers/fbdev_drv.so: undefined symbol: fbdevHWSave
> [   353.565] (EE) Failed to load module "fbdev" (loader failed, 0)
> [   353.565] (II) LoadModule: "vesa"
> [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
> [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/vesa_drv.so: /usr/lib/xorg/modules/drivers/vesa_drv.so: undefined symbol: VBESetModeParameters
>
> Full Xorg.log https://pastebin.com/nu5wpHex
> Full defconfig https://pastebin.com/RLJRwMES
>
>
> I don't have problems with branch 2020.08.x with the same defconfig.
>
> Any idea?

Seems similar to the problem fixed by commit [1] (for the fbdev use case), but take a look
at the linked bug report/mailing list report for hints about the module loading order in
xorg.conf file and/or needed patches...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=9dc2b4a4eee557d3d9e7df31e9d2e96f364a2f03

>
> Rafal
>

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
