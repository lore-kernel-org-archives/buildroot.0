Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7799BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 11:15:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D99B60F93
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 11:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D99B60F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3422281028;
	Mon, 20 Sep 2021 11:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M59DES0znVdc; Mon, 20 Sep 2021 11:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70E0B8100B;
	Mon, 20 Sep 2021 11:15:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E52041BF2C8
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 11:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D41DD40408
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 11:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3aZwnHEwsL2 for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 11:15:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AEEF40400
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 11:15:44 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SHGwm7XApJzjeSHGwmKPJF; Mon, 20 Sep 2021 13:15:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632136542; bh=gQv8Go+f5bjiXV3eiW2FDMqVEfrh/hDmV3nMHpzHtjE=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=XcGGPti3DCEzTUNr9YooM3gagIKUD8BBRwodnrPi2mNlq5u50WYBWGSsz+PaHRO0Y
 Wk8vqyhLTutZabM356KfNz1WFMaf25IiYhihG4Ma+fCg0B2Zvr29vp2MleJinq797b
 liiQmK2sQtpn02Ioaup5nd+djNpVcY0kxusX+hBSpFXtMG7Tr9XOQuyZFOunKvuZbU
 rbFr4WMvBG/+1Z/upEaRP10gyqQbbf12JJFo3C9sBsdaFfeAmcqfoTJUmlJER4Mkk+
 Str2vu/7z+Sl7E0JSmNknA6SzQZGmMv9Tk1ztwSuqf2RM1GMtbAhAp8gdzooX5iLT/
 Xyi40BLjhrj0g==
To: Arnout Vandecappelle <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <f98c560b-9a4f-26df-3bcb-3bdb4509786d@benettiengineering.com>
 <20210920084105.4b8fea91@windsurf>
 <7492dc18-5c41-b7f4-f10e-979b6c042ba8@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <cb9eced9-ef72-679f-fd83-bc5bae9fa08b@benettiengineering.com>
Date: Mon, 20 Sep 2021 13:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7492dc18-5c41-b7f4-f10e-979b6c042ba8@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDPPJp8kmA8scbvWxuohTfzbyiqFZsxuxM+WhMiNlYnFZxy6DJABwzkjHUbMY0XVFh4yh6nTlYyfVW5Cc7ZCxy3GW4BniGeeTcyD5l/zssdVqxjJ9ksr
 SN3cotPj5/Czuy3CUDI20oXQv1LzxtP5zWab1r6dGgoWELsuRIEcXB1ArJ0rUMQOk/wwfnbA+lyszembZOBfqXzeEkr4IX7cvzrCa53Ag+DOJoCT6SqrHocR
 OgzI8u50sXL4i+FKg2PcguVkUNT74+V1DRyb0EMLzI1RY6NfDe/zFT1RHlCJsE761tlHbWJlB4j5dBwAgQuURg==
Subject: Re: [Buildroot] Harfbuzz bump major version question
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On 9/20/21 11:00 AM, Arnout Vandecappelle wrote:
> 
> 
> On 20/09/2021 08:41, Thomas Petazzoni wrote:
>> Hello Giulio,
>>
>> On Sun, 19 Sep 2021 23:10:23 +0200
>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>
>>> I'm going to bump harfbuzz to version 3.0.0 but being a major version it
>>> looses 15 apis[1] and introduce some new ones. So I'm not that sure if
>>> this can be a normal bump or I need to introduce the new package
>>> harfbuzz3. Package pango that requires harfbuzz builds fine, but how
>>> should I proceed? Should I build every package that depends on it and
>>> check if it builds fine? Or should I add package harfbuzz3 and then
>>> every package that depends on harfbuzz should move to harfbuzz3 package
>>> per package? I'm new to this case so help is appreciated.
>>
>> The best is to not have to introduce a separate harfbuzz3 package, as
>> it really complicates things.
>>
>> There are not that many packages that have a dependency on harfbuzz:
>>
>> package/efl/efl.mk:ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
>> package/libass/Config.in:       select BR2_PACKAGE_HARFBUZZ
>> package/mupdf/Config.in:        select BR2_PACKAGE_HARFBUZZ
>> package/pango/Config.in:        select BR2_PACKAGE_HARFBUZZ
>> package/qt5/qt5base/Config.in:config BR2_PACKAGE_QT5BASE_HARFBUZZ
>> package/qt5/qt5base/Config.in:  select BR2_PACKAGE_HARFBUZZ if \
>> package/qt5/qt5base/qt5base.mk:ifeq ($(BR2_PACKAGE_QT5BASE_HARFBUZZ),y)
>> package/supertuxkart/Config.in: select BR2_PACKAGE_HARFBUZZ
>> package/vlc/vlc.mk:ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
>> package/webkitgtk/Config.in:    select BR2_PACKAGE_HARFBUZZ
>> package/wpewebkit/Config.in:    select BR2_PACKAGE_HARFBUZZ
>>
>> So I would suggest to create a configuration that builds all those
>> packages successfully prior to the harfbuzz bump, and then retry this
>> configuration with the harfbuzz bump applied. This will give you a
>> sense of how much breakage the API changes are causing.
> 
>    It would be nice to convert the explanation above into a documentation update!

I could add 'Updating a package' under 'III. Developer guide' in the 
manual on the same level of 'Adding new packages to Buildroot', does it 
sound good?

I've never contributed to the manual.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>    Regards,
>    Arnout
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
