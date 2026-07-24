Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09205C531C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 13:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F279160B85;
	Fri, 24 Jul 2026 13:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxpMkAj8nPqo; Fri, 24 Jul 2026 13:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 605AD60B69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784899191;
	bh=QqAYZF/dF1rmU0JO5UuhKY1nveFz2Fw7i3pOATHI+aQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZckD9J38zthY2cR+0GiA0AkR8NB87gg40qUvlg91smk0QKMSkGElpxDMHdtOkEaW4
	 tosrSgpqAL2gB0liw6nWmbEwUrkU1s6TAMH4esG0MoGbGLEeZ001LkFzL9eTDHuzfi
	 V6+gj70bYnO8JYLz5NPFj1xOgbnlo7D8LZJ8mPObZ9eNgG8eUzEkOUFm4R9yQzdpDL
	 UFVDxCVBFSdilmkehBdF4tqv9IY5E9yvD2hWFh168M1hMU9cE6P8F4j1GlKyJlST4U
	 3F1Oo43lCl+ba3LFCb+mK6AY3UTYitmQt6MWRMFuzHmZeKFYJ7RjjoxbXeqQ9ilfGI
	 PxoPhYBSSN06A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 605AD60B69;
	Fri, 24 Jul 2026 13:19:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E672429
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 13:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10A3840A3A
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 13:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXzfD_hoicJO for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 13:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6950240A0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6950240A0B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6950240A0B
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 13:19:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mk0JW-1xFxqy026i-00hLp9; Fri, 24
 Jul 2026 15:19:44 +0200
Message-ID: <a83d98ae-1938-4faa-922e-897401aaa167@gmx.de>
Date: Fri, 24 Jul 2026 15:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Flaviu Nistor <flaviu.nistor@gmail.com>, Julien Olivain <ju.o@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <2b65947d849cb7dfcee512ef2407d2df@free.fr>
 <20260724064006.216995-1-flaviu.nistor@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260724064006.216995-1-flaviu.nistor@gmail.com>
X-Provags-ID: V03:K1:T4IH9MGzhRFKt1uXxlybLx0QYM3Rw3kQTy1vtAHVPx6z7e8L+ab
 GkFsfCOng1PaVpkkI+MmWMXqpRFx26AWWX4DkI9s0b3XTs7OHDo0RSV5DMbMG8xAdKOYUBX
 EuAP/p8yHs2PluSwUV5iKhKb8cs+1XGssTTI1CWiS1BjfIxsAzaePTxpttHO3ONLKoRXxVQ
 FfOpJ/YD+DBiaGu5hBF/A==
UI-OutboundReport: notjunk:1;M01:P0:UQFL1xQHGv8=;nauAwc6KMd3UQPBhsPWKT/QyKQ0
 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
 PNvO/6vq4Kj76o3nkx70fvYdo9pwzAqY8g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784899184; x=1785503984; i=fiona.klute@gmx.de;
 bh=EnW98B3WBm+um7tSvj78Eu0XefOAqEVPPLx+oJVEWQM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KlHPtXTuGUxoQ7GnI+gX3I6ER6q095wE0zNlJZbb+531BadBWMi/g5EXmkZ/azlD
 w0uwuT4vcgNoD1Q4TeUScNIdLgW8MiKsYhksm/hw9K6sLJ3vgRbNhd3rJB9/p6lUV
 hCQ0LKO23j0NXvqzWZYM1hhMYEcfkK8TY5wnvon7l5om+e0inNHuzCHkvmEa1IkSs
 A4TQMwPItDKg70PST1IiJwY0b99qxtPnhbkkI+9qoDfwuLufZ1Mzb+/0yYtglJSWt
 JKJdD/mApQLgJzI79wsUsIRR6oJH7rMbW7wx8m+rUuPLRrVBWnXif4E3ZjIVxlTjz
 5hHAWQdLCiQt8qVk2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=KlHPtXTu
Subject: Re: [Buildroot] [PATCH v2] package/python-snappy: bump version to
 0.7.2
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

Am 24.07.26 um 08:40 schrieb Flaviu Nistor:
> Hi Julien
> 
> On 20/07/2026 21:51, Julien Olivain wrote:
>> Hi Flaviu,
>>
>> On 20/07/2026 15:33, Flaviu Nistor wrote:
>>> Hi Julien
>>>
>>> On 18/07/2026 13:54, Julien Olivain wrote:
>>>> Hi Flaviu,
>>>>
>>>> Thanks for the update.
>>>>
>>>> On 17/07/2026 08:19, Flaviu Nistor wrote:
>>>>> Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
>>>>> on the project homepage, hence the bump to 0.7.2.
>>>>> Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.
>>>>>
>>>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Fix error indicated by Julien Olivain when running make
>>>>> python-snappy-legal-info.
>>>>> - Link to v1:
>>>>> https://lore.kernel.org/all/20260409152520.5894-1-flaviu.nistor@gmail.com/
>>>>>
>>>>>   package/python-snappy/python-snappy.hash | 4 ++--
>>>>>   package/python-snappy/python-snappy.mk   | 5 +++--
>>>>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>>>>
>>>> [...]
>>>>> diff --git a/package/python-snappy/python-snappy.mk
>>>>> b/package/python-snappy/python-snappy.mk
>>>>> index e80aa861df..b1bd8ca6ca 100644
>>>>> --- a/package/python-snappy/python-snappy.mk
>>>>> +++ b/package/python-snappy/python-snappy.mk
>>>>> @@ -4,8 +4,9 @@
>>>>>   #
>>>>>
>>>>> ################################################################################
>>>>>
>>>>> -PYTHON_SNAPPY_VERSION = 0.6.1
>>>>> -PYTHON_SNAPPY_SITE =
>>>>> https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
>>>>> +PYTHON_SNAPPY_VERSION = 0.7.2
>>>>
>>>> When building with the commands:
>>>>
>>>> cat >.config <<EOF
>>>> BR2_aarch64=y
>>>> BR2_TOOLCHAIN_EXTERNAL=y
>>>> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>>>> BR2_PACKAGE_PYTHON3=y
>>>> BR2_PACKAGE_PYTHON_SNAPPY=y
>>>> EOF
>>>> make olddefconfig
>>>> make python-snappy
>>>>
>>>> The build fails with the error:
>>>>
>>>> ERROR Missing dependencies:
>>>>          cramjam>=2.6.0
>>>>
>>>> It seems python-snappy was updated to switch from the snappy library
>>>> to cramjam, since v0.7.0:
>>> https://github.com/intake/python-snappy/commit/277fb4a4b7e16b771f1ed1addde33feebd96c979
>>>>
>>>> Cramjam is currently not included in Buildroot. So, I believe you will
>>>> need to add it, and update this python-snappy bump to reflect that
>>>> library change.
>>>>
>>>> I also suggest you write a Buildroot runtime test to make sure
>>>> everything works. For the test, you can use the simple sequence
>>>> such as:
>>>> https://github.com/intake/python-snappy/blob/0.7.2/README.rst?plain=1#L50-L51
>>>>
>>>> Could you send an updated patch series addressing those issues,
>>>> please?
>>>
>>> First of all thanks a lot for the great support in guiding me and
>>> patience.
>>> For sure I will send a new patch series addressing the isseu, as soon
>>> as I have
>>> some time available.
>>> On my side, running the commands you provided fails even at installing
>>> toolchain-external-bootlin (2025.08-1), where look like a link can't be
>>> created.
>>> I'll have to make this work also on my side.
>>
>> The error you observe is most likely due to an "unclean" working
>> directory.
>> I believe you will just have to do a "make clean" first, then retry with
>> the
>> sequence I provided.
>>
> 
> That did the trick (make clean). I generated and tested a new patch series that
> now also added cramjam package and all is working fine. I even generated a QEMU
> image and tested inside the emulated that expected version is present and a simple
> py script using the python-snappy is working.
> 
> I still have some issue with the python-snappy package tests since I have an error
> (segmentation fault) when running and I still can't find my bug. The test is simple,
> so I can't understand what is happening. Once I solve this I will send a different
> patch for the test.
> 
> One more question: Since I added a new package and is not covered in the Developers
> list, should/can I add my self to that list in the future (for specific packages)?
Yes. If you add a new package it's generally expected that you add 
yourself to DEVELOPERS for that package. And you can add yourself for 
other packages, if you want. That doesn't give any special privileges, 
it just tells people to CC you for relevant patches, and certain 
automated systems will send you warnings related to those packages (e.g. 
if tests fail, or an update is available).

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
