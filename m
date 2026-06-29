Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E6FC43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 15:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EA4D81E5E;
	Mon, 29 Jun 2026 15:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeDFGdku6Moc; Mon, 29 Jun 2026 15:11:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A39581E52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782745872;
	bh=NbG8CYY0A6Dwn47+hKfEYyZ+gIDS1lZubMtg3nuKEnQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ou6YLibm5sulrUXo1VGcPLB9TunR7b1B7Sf12HUGSsKWgdYXTvA5IK58xMdTEBEhE
	 6UR+AiaU2Dd1uiaX2RUh4VQdYSt0OqfjYf8dNfuk0CYVSLq8Y+idkdGGy2tCKUBkg5
	 YhG226KuoJ22a+dnS4d/pg0Ygk9bqVXEHBHXNWSeBk8WOnbZS1hJhXy2g8UVZ0X6qY
	 FkSVpwmqBJrxGKl37MXtaF+PdPZq4WhnqeuRsFruXtDOzBEgTIDi1WFB28gETeHdYq
	 r7GLJBOXM2I6czkkp6JOD/lgRr0G91ADQ+rA3dQxC45En06UM2Gc2xFWFObs/a3Fxm
	 jmVDW7PxpJfsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A39581E52;
	Mon, 29 Jun 2026 15:11:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACDC42F3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA58740283
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-qLCnsCFKqd for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 15:11:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 346CC40119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 346CC40119
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 346CC40119
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 15:11:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq2E-1wxwPb1MMa-010xyf; Mon, 29
 Jun 2026 17:11:07 +0200
Message-ID: <368a7c7c-f461-433e-91a4-d4d5ed95ced8@gmx.de>
Date: Mon, 29 Jun 2026 17:11:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20260627120452.803450-1-fiona.klute@gmx.de>
 <20260629074239.273485-1-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260629074239.273485-1-thomas.perale@mind.be>
X-Provags-ID: V03:K1:nXbh/nU2nL9Mj08qz/IEMtchBDgEcEkf3V1/92HvLG2XPzBqmGZ
 vGg711wTQPsahxryoBPTWfrty/lX1QJdJZYbflGxNzS3+LpINSP/nWLNKiWLTUAhmvnTXvx
 uk8YoiRlLtpMyheeZMe+v/9B4RSZf500c+3vNWrSml2GiwkxoIdhLddcpW4sq14GhA2t2RK
 ES9t/gn7x7o1Ww+I3M48A==
UI-OutboundReport: notjunk:1;M01:P0:/b92J6wTyJE=;NYW8uC37YxK04WhYnpDVEYU+O7J
 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
 Bb40EO/MDvci69+QOumzhqSnriGqWJ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782745867; x=1783350667; i=fiona.klute@gmx.de;
 bh=+AoS4XcuUXCCm/V+3qR0IINnTJx/Fdys/NcwMH5n55s=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VwxMKQdvn62bc1nSm0Q92tWTQI8TOgfrMOYF/pM1MXy6b/8Bq2IC3W+wzx+YPBqM
 k7qJW3CQZP9taNLkdnjbzqEV5poPq2WM8NiUdwqPrWEnImdEhq60b0/LY/TApo+UU
 J6oNDd8yg1F1hxkQvPRoPyzsJAWVOOsSikEorqeNvvr61cpzhjYco0YMb/58bg45k
 LV8rhCl7PWWQk9kMan6c5FL30M3cNqS/JIACl34nj3y0PO0m8MvlEJxW1E+8mdXlS
 phwtypZ19+CCCwG/RifYGZWoz/bLph1KJ5tamAacyTZeHkCJZuISEyFqvG7+dfSSV
 9zGUWxytntFcBDRzFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=VwxMKQdv
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: drop unused
 0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas!

Am 29.06.26 um 09:42 schrieb Thomas Perale:
> Hi Fiona,
> 
> In reply of:
>> In 11aa1cfa5af9a77a0a9f726bd38f1b7db659c0bf the patch was accidentally
>> moved into a versioned directory with the wrong version (2.82.0
>> instead of 2.82.4) and thus not applied. However, there have been no
>> issues reported.
>>
>> The patch description mentions being needed to fix build errors in
>> package/atk and package/libnice. It was originally added in
>> b094f88a4d501101bfba9b65491209e6a0fe0397, and amended for libnice in
>> 2c916b400bc608512db790d97df010ca666b6dd2. package/atk was removed in
>> 2c3ca7bea1de76163aeef432412eb14551ed0581, because atk has been merged
>> into at-spi2-core. Both at-spi2-core and libnice are Meson packages,
>> as was atk at the time of its removal.
>>
>> Both current packages build with the following configuration (tested
>> using utils/test-pkg):
>>
>> BR2_PACKAGE_PYTHON3=y
>> BR2_PACKAGE_GOBJECT_INTROSPECTION=y
>> BR2_PACKAGE_LIBNICE=y
>> BR2_PACKAGE_AT_SPI2_CORE=y
>>
>> Evidently the patch is no longer needed, presumably because the
>> correct search path for GIR files is set by other means, and we can
>> remove it instead of fixing the version number of the patch directory.
>>
>> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> 
>> ---
>> I admit it is a bit unsatisfying that it's unclear exactly *what*
>> fixed that search path. Another bit of evidence I have is that when
>> working on that libglib2 2.82.x and gobject-introspection 1.82.0
>> version bump it was primarily for package/python-gobject, which also
>> uses Meson, so it probably was either that bump or a Meson bump at
>> some point before.
>>
>> TestPythonPy3NetworkmanagerGoi (accessing NM using python-gobject)
>> passes with this patch.
>>
>> For stable branches it's probably easiest to verify at-spi2-core and
>> libnice build using test-pkg and the config snippet above.
> 
> It builds on 2025.02.x.
> 
> Tested-by: Thomas Perale <thomas.perale@mind.be>
> 
> What do you think would be the next steps ?
> Do we still need to have a shared patch directory between libglib2 and libglib2
> bootstrap ? Only on 2025.02.x since there are not patches on 'master' branch.
2025.02.x, 2026.02.x, and 2026.05.x all have the same issue with the 
versioned patch directory, but no other patches. So I'd say if 
at-spi2-core and libnice build anyway, just backport this patch to tidy 
up. :-)

If we add patches in the future, we should apply them to both libglib2 
and libglib2-bootstrap, so we don't add odd bugs with the difference. 
Whether to use a versioned directory or symlinks directly in the 
bootstrap package is just a matter of what's more convenient.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
