Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ED1C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 18:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD818413A9;
	Wed, 10 Jul 2024 18:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsoXVzjjXa85; Wed, 10 Jul 2024 18:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6020341687
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6020341687;
	Wed, 10 Jul 2024 18:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF7D11BF471
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 18:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9B284044B
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 18:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwmO4HhPVGYq for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 18:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6839240376
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6839240376
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6839240376
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 18:41:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.120.32]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3lYB-1sRLGo3kDz-008wPd; Wed, 10
 Jul 2024 20:41:18 +0200
Message-ID: <83847513-35ce-449d-a90c-ba18e80c892b@gmx.de>
Date: Wed, 10 Jul 2024 20:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
 <20240704121352.1915154-4-fiona.klute@gmx.de>
 <20240708235639.7a9cc07c@windsurf>
 <1e0c66a5-b6d3-4117-aafb-68b4d00a5565@gmx.de>
 <20240709135538.4594978e@windsurf>
 <f1ec17d8-b94a-4759-be4b-9eba46ae1b5a@gmx.de>
 <20240709203551.1e05568e@windsurf>
 <e3604bce-6189-4cef-a0f2-19257f66ebf1@gmx.de>
 <20240710134719.5b84b352@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240710134719.5b84b352@windsurf>
X-Provags-ID: V03:K1:V/yLKJCHk1S/AL19wtlsH5+5LdGZpiCd3zKKfvOGaYUPYM2JYtD
 10FRtHU0Dt105zkj1h7JbprmJ41Iuz4vmCABA1KEjxwmz/spZGSVsEozIrxqdH6mK4/DUlo
 kGIReadiqlyEGFmgv4/s8mwMTIaE7la7tSYhxAodhJazK3pFP+Fs0dXgm/iaeZxPdqRq4rY
 9r8+aoQtjqqm9XtL2HYrA==
UI-OutboundReport: notjunk:1;M01:P0:++fwO0QjOzw=;TRdEsLeZFBGvlxGqfnkhedUKrCe
 FktHtP13yijTLWP5HhDYMJe1/R1IlHgCHY8UuwPxzStt5nQpW+dXgpXKvtkBK6Z86A6+d+cI/
 lPIQR1iZKLdDbf6IS+oiD/K57SHuOBeEPDJPnFMUFFWIYnL0Bpf0skE2pM17laHVpbmPZiBg8
 NXEFavhEpcHVIDpgVL4hOEvTtgcvpDlcTD80f1tJHYkpM8brapX434xDgowIPK1+9Yx2L7pG/
 SZdITmO6cx0U2Bjb2qRO3LjdFTK+jpeYM6d8hhRblFSUvAsP1w6k+HGiUnXKFusu2VArADUp0
 t9WzG6lTdhJMMstEbBDSnQ42y+6Qjiopgx7DJC2KfPnoTqR/yStGd9xmKL6P+lOXoNpSg2mVJ
 aMdTo7Qgg3sr9tfpkPLDUxNvKEKB9+xoHaf6q0LTkDmutc3wOx1I+aPveoelllkYiAk0dOGSE
 NyMqvTeGVJG3/iKyCVeQRtPqydh58dToLmHnNWzwq7KD8yfOZcJ0o6OnQJElBjc7Ub8Hijicy
 2oMpE4SxLplNGCqTuAasbKLVKrYFQzYOPqFrSlBRrzWRdTH4yIlxvYGRvTqVmVJ5ZqvsaRHo9
 xM8tfWObtn4Zz/p6cSQoBvAsyr3LN6dutYpddJoldZ5YFklSMlHuDHczR45V12vqkKUDnRLQl
 Wfn9POqoFVzWRUmBKvDRPND8cNhaes4kJxF1iT51K/1oUiVahXhNDyG6gA2nqB+n3QKmnDVmv
 ZPKCB2h6FwNujEc0e9R9Dv9f+Ds6B4JFEe38ybIE1rY50Ca7Q2ZDLypgk8Ao190FR4P6rqMPW
 iKrUcoVECqiu3T3j/WQwYuJA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720636878; x=1721241678; i=fiona.klute@gmx.de;
 bh=jxLlx1oyb2GdFMcNLJXZGXBBXvDPVRzNl3ixlxvOgTw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ajXVX1oiG0OxGS2EEhp+nstfsuaxLtFun+bgELW6Ji0dMnRt2aBIUJu38zIBgcm1
 qHskVEEfOvNLggTAy5VZtKRxS2l/17gb/OHap74khubOgYkT9jyVW9kxi3XphNpnh
 eXhKwox3/OakmfM+RJJjWGchy95H5dqPaZm/Mt8RaXYryiejiZzOLxtJuVcZp2XAa
 RQ8Dqd+UpRec2YkeT7BHIfo7xlb4r8tHo5CVsGjwY1jLiayJHlWk+RVesrJITfAdW
 Bb4nOwTRNJRorf64qcbpV1Kx0GpgBX5YLnHV7OyxDvPtAvBLhkXS48DLJJu3gSrQF
 TzzHw2X9Y1bN/dI+qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ajXVX1oi
Subject: Re: [Buildroot] [PATCH v2 3/4] package/fail2ban: bump version to
 1.1.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas!

Am 10.07.24 um 13:47 schrieb Thomas Petazzoni:
> On Wed, 10 Jul 2024 13:17:58 +0200
> Fiona Klute <fiona.klute@gmx.de> wrote:
>
>> If you just use a fresh defconfig, yes, but that doesn't quite work for
>> fail2ban (there isn't one that enables it, it needs Python, and I'd like
>> to build with musl to match my target). I guess it'd be easy enough to
>> create a snippet with the required config, append it after defconfig,
>> and run "make oldconfig".
>>
>> But then I still wouldn't get to reuse BR2_DL_DIR (though
>> utils/docker-run can use that from environment) and the CCache setup.
>
> Not sure what's the problem here. Here is another example, where I
> start from a simple config for an ARMv7 toolchain:
>
> $ mkdir /tmp/foo
> $ cp ~/buildroot/support/config-fragments/autobuild/bootlin-armv7-glibc.config .config
> $ ~/buildroot/utils/docker-run make -C ~/buildroot O=$(pwd) menuconfig
>
> enable BR2_PACKAGE_PYTHON3=y and BR2_PACKAGE_FAIL2BAN=y in menuconfig, exit

Having to manually edit the config is exactly what I was trying to
avoid, whether by using an existing .config or a defconfig that enables
the options I need. Minimizing friction. ;-)

> $ ~/buildroot/utils/docker-run make
>
> and that's it. No need to have an existing defconfig.
>
> Regarding BR2_DL_DIR: it re-uses the one defined in your environment
> outside the docker container, so it just works. Regarding BR2_CCACHE,
> you can set the option in menuconfig, but indeed it wouldn't re-use the
> cache that's available outside the container.
>
>> I could use a defconfig from my external tree, but then I'd need to get
>> utils/docker-run to mount it. That might actually be an option: Make
>> utils/docker-run honor BR2_EXTERNAL the same way it does BR2_DL_DIR.
>> Would such a patch be welcome? If yes I'm going to give it a try.
>
> See above: you don't need an existing defconfig to test things.
>
> However, it would indeed perhaps make sense for docker-run to mount
> BR2_EXTERNAL trees inside the container.

I've just sent a patch. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
