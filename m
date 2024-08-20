Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86650C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 11:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 373CE400C1;
	Tue, 20 Aug 2024 11:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5YCS-JzEK5P; Tue, 20 Aug 2024 11:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD1EE40150
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD1EE40150;
	Tue, 20 Aug 2024 11:32:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 760231BF312
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 11:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EB0281179
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 11:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjOWzBciSeMN for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 11:32:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.89.1.15;
 helo=012.lax.mailroute.net; envelope-from=wdouglass@carnegierobotics.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71A5681176
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71A5681176
Received: from 012.lax.mailroute.net (012.lax.mailroute.net [199.89.1.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71A5681176
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 11:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 012.lax.mailroute.net (Postfix) with ESMTP id 4Wp6lW6kmNz1XhghP;
 Tue, 20 Aug 2024 11:32:55 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 012.lax.mailroute.net ([127.0.0.1])
 by localhost (012.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id QrryU_BZDC5Z; Tue, 20 Aug 2024 11:32:54 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 012.lax.mailroute.net (Postfix) with ESMTPS id 4Wp6lV5MRrz1XhghN;
 Tue, 20 Aug 2024 11:32:54 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Tue, 20 Aug 2024 07:32:53 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Tue, 20 Aug 2024 07:32:53 -0400
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Woodrow Douglass via
 buildroot" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] package/chicken: Update to 5.4.0
Thread-Index: AQHa8nZ7OFW2eUWj5kWvUney/xJrcrIwR4SA
Date: Tue, 20 Aug 2024 11:32:53 +0000
Message-ID: <77476c0d-9af4-4a75-bd83-8fd7d74a03c4@carnegierobotics.com>
References: <20240819122631.1684155-1-wdouglass@carnegierobotics.com>
 <20240819222903.54711ddb@windsurf>
In-Reply-To: <20240819222903.54711ddb@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-originating-ip: [67.20.241.14]
Content-ID: <DC4FDA4EF78E514E8E8C8D5DCAA9E37C@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1724153574; x=1726745575;
 bh=3MyL+w7t1SyTUuLb8/ZehmkWdxu7jjcw8gS5LAue9GI=; b=1peCNizaUzHJ
 kv2lHj9kl/FWmnguGhoLELLU6EHYkwqnTih8DYvrUn3ifaROygWZpFb6Nl4jBmxB
 kbWYlsnuuVGit12G7nktuwcguYeUtUw2pgL40T5LhN2xJGgsM8l8uiIqHwJWuo9z
 6WL65qN96uCohSzdKY9FvDlBj/evRCjKLXoXvNdXpiTEDU6yJt5GD3d0su3fPdsn
 MXvuHAEDUNsR33d1plbWTdjM07kFqJjCoLCxEuXzDUhAo0QpPBT1wZfl2bKmWDRB
 20jfornqNDMYgtwFod2iG60lnAosGwtvt68zkzEHZQr9VNXwggr9Nx17hW3Wdm0a
 Ti4AJlTtMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=carnegierobotics.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=1peCNiza
Subject: Re: [Buildroot] [PATCH 1/1] package/chicken: Update to 5.4.0
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

On 8/19/24 16:29, Thomas Petazzoni wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender.
>
>
> Hello Woodrow,
>
> On Mon, 19 Aug 2024 08:26:31 -0400
> Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:
>
>> This release includes a fix for CVE-2022-45145
> Then, could you update the commit title to:
>
>          package/chicken: security bump to 5.4.0
>
>> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
>> ---
>>   package/chicken/chicken.hash | 2 +-
>>   package/chicken/chicken.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/chicken/chicken.hash b/package/chicken/chicken.hash
>> index 5a553da792..b5df49814b 100644
>> --- a/package/chicken/chicken.hash
>> +++ b/package/chicken/chicken.hash
>> @@ -1,4 +1,4 @@
>>   # From https://code.call-cc.org/releases/5.3.0/chicken-5.3.0.tar.gz.sha256
>> -sha256  c3ad99d8f9e17ed810912ef981ac3b0c2e2f46fb0ecc033b5c3b6dca1bdb0d76  chicken-5.3.0.tar.gz
>> +sha256  3c5d4aa61c1167bf6d9bf9eaf891da7630ba9f5f3c15bf09515a7039bfcdec5f  chicken-5.3.0.tar.gz
> Are you sure you tested the build? The tarball here is still named
> chicken-5.4.0.tar.gz. Also pay attention to the comment in the .hash
> file, which contains an URL with the version.

I'm sorry! I ran a test build, but must have absentmindedly tested at 
the wrong point in my patch-rebase-send cycle. I'll send a new patch soon!


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com


Sorry again,

Woodrow Douglass

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
