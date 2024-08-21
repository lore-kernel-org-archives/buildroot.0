Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C00C52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 12:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC35B405C4;
	Wed, 21 Aug 2024 12:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gd1TBHNzA5gT; Wed, 21 Aug 2024 12:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EF5C40699
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF5C40699;
	Wed, 21 Aug 2024 12:40:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 500781BF5DA
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 12:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C6F980AB1
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 12:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFOzNJO20uhp for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 12:40:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.89.1.14;
 helo=011.lax.mailroute.net; envelope-from=wdouglass@carnegierobotics.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3AC91811DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AC91811DA
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AC91811DA
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 12:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 011.lax.mailroute.net (Postfix) with ESMTP id 4WpmC557rnz60ZG;
 Wed, 21 Aug 2024 12:40:33 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id fx3tJYfre9aS; Wed, 21 Aug 2024 12:40:32 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 011.lax.mailroute.net (Postfix) with ESMTPS id 4WpmC425YTz60Sl;
 Wed, 21 Aug 2024 12:40:32 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Wed, 21 Aug 2024 08:40:31 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Wed, 21 Aug 2024 08:40:31 -0400
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Woodrow Douglass via
 buildroot" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/chicken: security bump to 5.4.0
Thread-Index: AQHa8vXO4Texp/Pouk28ru8bR7MlkLIw7KgAgAD/GIA=
Date: Wed, 21 Aug 2024 12:40:31 +0000
Message-ID: <b1758d97-83fd-4a9f-a277-47642d5aca54@carnegierobotics.com>
References: <77476c0d-9af4-4a75-bd83-8fd7d74a03c4@carnegierobotics.com>
 <20240820114015.11119-1-wdouglass@carnegierobotics.com>
 <20240820232730.60670833@windsurf>
In-Reply-To: <20240820232730.60670833@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-originating-ip: [172.30.0.85]
Content-ID: <57489428719BA241BEF14D2709FE692D@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1724244032; x=1726836033;
 bh=XNj4xMU+4rNTII2ag6maP6goRdEGKFPhiTQFpJkgj14=; b=dpco5FIDu2R+
 kxZCrLD8JwQ1GOauPA05lnYZSSFylSL9NFRDYb0XkA6dxHE0KXbp+bYrnmRnPaRT
 skjtZYUUlz32gqoaf/sB3jNPXRh4UuO50OdhuiLxcq7HZcFHKI9SrQbedEGJ6rLx
 g6oBLb68xRIyuZ6glfuBqQsb+ogvw5QGgi2N9xJ8hj0w2/4skXcdOQ7d80d7dSM/
 4ffOYZwX672sJoJNhSfcVueVHI123W3BqPKN3+7+q1YEbg4SbWfdM8TWukk/uwEq
 Y5zTDB4yLgKmnKZPqW66zWY//b+t8LJZX3wJIup4ilAMjtqHNYtvna6YuCxt3Qjb
 G1nWTwirsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=carnegierobotics.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=dpco5FID
Subject: Re: [Buildroot] [PATCH] package/chicken: security bump to 5.4.0
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
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/20/24 17:27, Thomas Petazzoni via buildroot wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender.
>
>
> On Tue, 20 Aug 2024 07:40:14 -0400
> Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:
>
>> This release includes a fix for CVE-2022-45145
>> ---
>>   package/chicken/chicken.hash | 4 ++--
>>   package/chicken/chicken.mk   | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
> Thanks for your new iteration... but this time around it lacks your
> Signed-off-by line :-)
>
> Also, when you send a new iteration, please label it [PATCH v2] and
> include a small changelog.
> See https://buildroot.org/downloads/manual/manual.html#submitting-patches
> for more details.
>
> Sorry if I'm a bit pedantic, but I believe this helps everyone learn
> what the best practices for patch submission are. If you find I'm too
> pedantic, let me know, and I'll try to be more flexible :-)
>
> Thanks again!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

No problem, I'll submit a new patch in a bit. Also, don't worry about 
being pedantic, I appreciate all the work you do maintaining buildroot! 
Buildroot's mailing-list/git-send-email/patchwork workflow is different 
then other projects I've contributed to, so sometimes I mess up the 
rules, and I'm sorry for that. Thank you very much for your patience.

Woody

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
