Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F39CC77B73
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 21:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1D3360FC2;
	Wed, 19 Apr 2023 21:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1D3360FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fw9NHeDgBaQJ; Wed, 19 Apr 2023 21:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEC7060F94;
	Wed, 19 Apr 2023 21:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEC7060F94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C035E1BF40B
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 21:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0C9F40291
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 21:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0C9F40291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqVOBURuHFwx for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 21:12:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C80164018F
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C80164018F
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 21:12:31 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pF6KpC844dGZDpF6Kp3DcF; Wed, 19 Apr 2023 23:12:28 +0200
Message-ID: <587903ea-1c31-0836-08e4-e52e87ae9952@benettiengineering.com>
Date: Wed, 19 Apr 2023 23:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, it
To: Lex Nahumury <lexnahumury@protonmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <rgAqqQDVcQB2W4pYC9_i78mR_f27aw3H8n-4y6HCzujypDNRqTFUmwyW7T7o0aRrx6zhx6qGRNBogVi_RH_1DYjgh5iVIU4O_nIHMqdUN2c=@protonmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <rgAqqQDVcQB2W4pYC9_i78mR_f27aw3H8n-4y6HCzujypDNRqTFUmwyW7T7o0aRrx6zhx6qGRNBogVi_RH_1DYjgh5iVIU4O_nIHMqdUN2c=@protonmail.com>
X-CMAE-Envelope: MS4xfPc9/HvMwc+qwUNjG4IravcQNmanFaXUEQ7/Istrf2g4kcaiRyHvfa1WV3Olb8wbqsFmSnsNMAObN0bsfguJbrjOZC2Nr5yaX7YHK3yJ1wWixisSe41+
 GzJXyzT0L2IkindU68FixI2j8MgeEsnzy4bc5mi6+jx7femBbc6IyfWS3y7FVGszQUJOB27K10k34RrNRVB/T/+uBcsYPzmp582AVTvPd3fXMCelN9U5ppqK
 iWQzcPWp7ODRo5WkTiwIN1451wTo1c4/vjEmFqSd5m4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1681938748; bh=vxtlHN2e1i3wSbmU56vysinbfStcWoFBFp++FCdUGhU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=fSOf4A2A4ImrQ/cllccqpIqaB0Q/b+UdrMqLFLYhQ6YQaxwtHTRck6wMNj6qlMhov
 Pc6GJmMwHPHoR6/jIxYP7b3Z8OLzl/PLJt/23j/p4eeuLnUmQhqY2g1jiz6I7o3YBY
 6qMc5JagT+FMsyf+TCjKskJL4OjoIc+rKF5sGR2ITwlU/haRtbFZJdK7c2RsrRteq5
 54qPrMFNDBGj6aAN/CjRs6cLquU44VtaollY0KXu/Q5e4gfLTfO4bhUe5abwOFZZAv
 ateOYXb83OuEXxm1CF3tD5+Fl2OlHB9rCF6LIU7Q1Xs9821jUyoWUzOdp9XynvtSGH
 o3UQ+eve/MchQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=fSOf4A2A
Subject: Re: [Buildroot] No sound device
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

Hi Lex,

On 19/04/23 21:45, Lex Nahumury via buildroot wrote:
> Hello,
> 
> I am trying to build a linux image for the Orang Pi Zero using buildroot.
> 
> git clone https://github.com/buildroot/buildroot.git 
> <https://github.com/buildroot/buildroot.git> buildroot
> make orangepi_zero_defconfig
> make menuconfig (adding alsa and jack)
> make
> 
> The build goes well and the board boots fine.
> The SOC has an on-chip I2S audio codec.
> However, there is no sound device detected.
> 
> # aplay -l
> aplay: device_list:274: no soundcards found...
> 
> I have tried a different board Olimex Olinuxino A64 which also has an 
> Allwinner SOC
> with on-chip audio codec.
> Same story; no sound card.
> 
> Am I missing some build setting in menuconfig?

the problem is not on buildroot side, it depends on Linux kernel if the
audio driver is enabled or not both in defconfig and dts.

I've taken a look at sun8i-h2-plus-orangepi-zero.dts in linux:
https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
and &codec node is missing.

It should be enough to add &codec node like in this dts:
https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts#L101

you can add it directly into output/build/linux-x.y.z/arch/arm/boot/dts/...
then you have to rebuild linux under buildroot with:
$ make linux-rebuild

and give a try. It should work in theory since in .dtsi common file for
h2 and h3 codec is the same.

If everything works I warmly suggest you to place the dts locally and 
point to it with buildroot's BR2_LINUX_KERNEL_CUSTOM_DTS_PATH and later
you could create a patch for the dts file and send it upstream for Linux.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> I am new to buildroot and Linux internals in general so I appreciate any 
> help.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
