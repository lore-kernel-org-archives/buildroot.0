Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE67FF513B
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 20:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7752C60E2A;
	Tue,  7 Apr 2026 20:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlPmuLNnfwct; Tue,  7 Apr 2026 20:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4469060E25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775593478;
	bh=teBibeHg0TdLR7WVzV8cyucSGwBhd8aZQ9SzdGAV9DU=;
	h=Date:References:To:Cc:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n9ABOpd2sV0OS7ojgCbwm0oK7VOJQDZyFx5pfCrqBrgCKWU2yBAuSoIO68JZpRz2Z
	 S8/ayVeXLArMeNnjCh5CMSspvSx2M2uKAicRCf/vIP1ckK+uZYO8ZYZ/BF9Dz79SUz
	 5CPkHutzJ1Yq302CzF+YnaEb5uUA3eDRq+izTPoZhb+4CQMEg+IbLT852qYv/Nx4Up
	 /XIypEF77qjKcOEMKQBwBAHAnrH/o6J807tlTlUJQaep9FVKrBm7TGG3WinLWal5e2
	 DEy650bjrA9pHmIjuFqW2C4RFDd9097L2F2/NV1zxhdKaagzp/pvrERQWmHzgibGbl
	 ZMmDqTu1zo6Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4469060E25;
	Tue,  7 Apr 2026 20:24:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D4CE2C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3372040DD2
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vdCS2M5eTd4 for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 20:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5ED1840DD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ED1840DD0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ED1840DD0
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:24:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CC502A4C2462;
 Tue,  7 Apr 2026 22:24:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33568)
 by fli4l.lan.fli4l with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.99.1) (envelope-from <bernd@kuhls.net>)
 id 1wACyN-000000002SV-1LJc; Tue, 07 Apr 2026 20:24:31 +0000
Message-ID: <18ad88ae-3382-4780-89af-282c64edaf14@kuhls.net>
Date: Tue, 7 Apr 2026 22:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
References: <1c5722eb-224a-e6f2-df3f-849e0f0878eb@tkos.co.il>
Content-Language: de-DE
To: buildroot@buildroot.org
Cc: fbstachura@gmail.com, ju.o@free.fr
From: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <1c5722eb-224a-e6f2-df3f-849e0f0878eb@tkos.co.il>
X-Forwarded-Message-Id: <1c5722eb-224a-e6f2-df3f-849e0f0878eb@tkos.co.il>
X-Spamd-Bar: ----
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775593471;
 bh=KT7u41GYoDO43/gNhxhDLrczPwfjEoThimpKHRP2Kd0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:From;
 b=DneIWp1sQQrZ4R/97hoVwGYifJ7X03zNO48f2kcUPF9CKbMXmzo2UgaVDaQLb7+HX
 4IoK/ckyMslcRf2wselhh7oHGJcZHVYzXFNwnC68ZF0C1dOnKlPnqOHt8PTVQ0smhY
 s9jC5N8Oev5+dQTxo1XUiUjGgaoE0LAj36L7TZ7W6+Sp4OUy2yB8CZiGND/ab1bap6
 DxMaEtm0jeM4r4XNVLfdl25KY5hyBMWqsj5z5CLkxvKDOGvAWWExrxkcnj34ti/e99
 oxF3zw/jcwtVAtQJmMLiWCfJl2Y+Vn1ZU2HS+tOoMDNP8AdZNOWuCgSBEaT0WHQYPe
 RePlkEbCzJcGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=DneIWp1s
Subject: [Buildroot] Fwd: [PATCH] package/libphidget: bump to version
 1.24.20260127
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

Hi @all,

Jonathan allowed me to forward his answer to the mailinglist, see below.

He also received an answer from Phidgets Support, which I (but not 
Franciszek) received from him, which states that they do not actively 
use buildroot anymore.

I will send patches to remove libphidget//phidgetwebservice.

Regards, Bernd


-------- Weitergeleitete Nachricht --------
Betreff: Re: [PATCH] package/libphidget: bump to version 1.24.20260127
Datum: Tue, 7 Apr 2026 15:52:02 +0300 (IDT)
Von: Jonathan Ben Avraham <yba@tkos.co.il>
An: Bernd Kuhls <bernd@kuhls.net>
Kopie (CC): Franciszek Stachura <fbstachura@gmail.com>, Baruch Siach 
<baruch@tkos.co.il>

Hi Bernd, Franciszek,
After giving this further thought...

1. The current libphidget version in HEAD of the buildroot master is 
2.1.9.20190409.

2. The current libphidget version at 
https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22/ 
is libphidget22-1.24.20260127.

3. Between the two versions listed above there were about 64 intervening 
releases on https://www.phidgets.com/downloads/phidget22/libraries/linux/
which indicates a significant level of activity (by at least one person ;-).

4. ArchLinux supports libphidget 2:1.17.20231004-1 - someone was 
interested, but not enough demand to continue support since the end of 2023.

5. AFAIK removing the current 2.1.9.20190409 from Buildroot will not 
break anyone's project/product.

6. https://www.phidgets.com/ appears to be an active company, although I 
am no longer involved in supporting their devices. This company is in 
the business of rapid prototyping and design of sensing and control 
devices. Their customers are probably mostly makers and students. The 
customer I worked for was using Phidget devices in test jigs to test 
consumer microwave ovens. This customer eventually sold their product 
portfolio to Miele and closed its local operations where I live.

There are currently 184 active products in the Phidgets catalog as of 
early 2026 [Gemini].

7. https://www.linkedin.com/company/phidgets-inc/ shows eight employees.

8. A history of the idea behind phidgets is available at 
https://en.wikipedia.org/wiki/Phidget.

9. I wrote to support@phidgets.com just now to ask if they think there 
is interest in Buildroot support.


In summary:

1, Through negligence I did not remove myself as maintainer for this 
project. I apologize to the community.

2. I recommend removing the current libphidgets and phidgetwebservice 
packages and not trying to update the packages without a maintainer.

3. I recommend conditioning re-adding updated versions of these packages 
on finding a maintainer:

  - who can in good faith commit to fixing issues for at least two years
  - who has the infrastructure to test fitness for use of these packages 
on a Buildroot target system, not just fix build errors

I agree to reposting this email on Buildroot-related forums.

BR,

  - yba


On Mon, 6 Apr 2026, Bernd Kuhls wrote:

> Date: Mon, 6 Apr 2026 23:32:03 +0200
> From: Bernd Kuhls <bernd@kuhls.net>
> To: Jonathan Ben Avraham <yba@tkos.co.il>,
>     Franciszek Stachura <fbstachura@gmail.com>
> Subject: Re: [PATCH] package/libphidget: bump to version 1.24.20260127
> 
> [This mail was also posted to gmane.comp.lib.uclibc.buildroot.]
>
> Hi Franciszek,
>
> Am Mon,  6 Apr 2026 20:48:59 +0200 schrieb Franciszek Stachura:
>
>> This is also a backward-incompatible upgrade from version 21 to 22 [1].
>
> correct, building phidgetwebservice breaks with this bump:
>
> configure: error: Missing libphidget21; make sure the Phidget21 library is 
> installed.
>
>> As an alternative, I would propose removing this package from Buildroot.
>> Version 21 was deprecated some time ago and the package has been causing
>> the same errors in autobuild, almost daily, for more than a year already
>> (see 2024-07-06).
>
> I also tried sometime ago to fix the packages but stopped due to complexity 
> and lack of interest.
>
> @Jonathan: You are listed as maintainer for both packages.
> What is your opinion about it?
>
> Regards, Bernd
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
        mailto:yba@tkos.co.il tel:+972.52.486.3386 http://tkos.co.il

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
