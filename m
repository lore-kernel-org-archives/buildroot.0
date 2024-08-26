Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C12AC5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 13:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21ACE600B3;
	Mon, 26 Aug 2024 13:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PaXtrn4a9Kd; Mon, 26 Aug 2024 13:08:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27A6060670
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A6060670;
	Mon, 26 Aug 2024 13:08:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5ABC1BF2F4
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 13:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C323F402BF
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 13:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shdwSsgOjl1l for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 13:08:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.89.1.17;
 helo=014.lax.mailroute.net; envelope-from=wdouglass@carnegierobotics.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DCFD402AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DCFD402AB
Received: from 014.lax.mailroute.net (014.lax.mailroute.net [199.89.1.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DCFD402AB
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 13:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 014.lax.mailroute.net (Postfix) with ESMTP id 4Wsrb61bbPzlv8Fl;
 Mon, 26 Aug 2024 13:08:34 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 014.lax.mailroute.net ([127.0.0.1])
 by localhost (014.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id Ll_Zees31xwm; Mon, 26 Aug 2024 13:08:32 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 014.lax.mailroute.net (Postfix) with ESMTPS id 4Wsrb45h79zlvHHC;
 Mon, 26 Aug 2024 13:08:32 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 26 Aug 2024 09:07:57 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Mon, 26 Aug 2024 09:07:57 -0400
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Woodrow Douglass via
 buildroot" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v3] package/chicken: security bump to 5.4.0
Thread-Index: AQHa88fiYLZpAw1xTEetjRQ4V4eIxrI2RCuAgAOJQ4A=
Date: Mon, 26 Aug 2024 13:07:57 +0000
Message-ID: <83631600-3e75-4d84-9e40-ae2eed5266d0@carnegierobotics.com>
References: <20240820232730.60670833@windsurf>
 <20240821124414.8330-1-wdouglass@carnegierobotics.com>
 <20240824090753.551ad073@windsurf>
In-Reply-To: <20240824090753.551ad073@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-originating-ip: [172.30.0.85]
Content-ID: <D0AD6EB36D3D66479FF3F54E37A4F06B@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1724677712; x=1727269713;
 bh=s8ebiaQV5+5MeOULptqSed18NPvtu9WG5JfN4vlMGfU=; b=W21tPQbBzdxT
 Bq/Pa81WVMXEb4niiW9jOxLkI7BbSwiafkC7i6CdLGT3MIeTdMjPVzARBPU8kXCJ
 NYkOK/oQD1KjQRwb0EWq+JukBcP/pzY6oj4GMbtsF9Cx8jglP/18yNznLmCwfAk0
 DoGIPr9iFW4dD2xE2NxVdPr5Z0d0iSFrtJpt1sORRjoii/LUBS/ShvVsgmJCl8Ke
 fZQ+qEBbyXRFp9Nnq9empu7NKNVZGbHnj8Mj1bykBu/aliJVO8tT1KQ78LELc28V
 dX23duaQvUbuzqooSfGeqxerpUdUc5NndskB2nvUURbIDK9IRC46XuHGosXPL2cE
 tZVMY5UbOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=carnegierobotics.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=W21tPQbB
Subject: Re: [Buildroot] [PATCH v3] package/chicken: security bump to 5.4.0
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

On 8/24/24 03:07, Thomas Petazzoni wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender.
>
>
> On Wed, 21 Aug 2024 08:44:14 -0400
> Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:
>
>> This release includes a fix for CVE-2022-45145
>>
>> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
>>
>> --
>> Changes v2 -> v3:
>>    - Add this changelog to commit message
>>    - Add Signed-off-by to commit message
>>
>> Changes v1 -> v2:
>>    - Update version numbers in hash file
>>
>> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
>> ---
>>   package/chicken/chicken.hash | 4 ++--
>>   package/chicken/chicken.mk   | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
> Sorry to be annoying, but this patch breaks the legal information for


Not annoying at all, it's my lack of diligence, I'm sorry. I'll add 
`make chicken-legal-info` to my list of things i do to test.


> this package:
>
>>>> chicken 5.4.0 Patching
>>>> chicken 5.4.0 Collecting legal info
> ERROR: while checking hashes from package/chicken/chicken.hash
> ERROR: LICENSE has wrong sha256 hash:
> ERROR: expected: b434ac92e094214136a6b5032f0dc9da97f22cef084ac1d0131b02a09e2caa37
> ERROR: got     : c0ed699d5c4a8687f90a6488244f7f57d48a7f2d42bb7461b08a0d69a07d4f58
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> make: *** [package/chicken/chicken.mk:46: chicken-legal-info] Error 1
>
> So the hash of the license file needs to be updated *and* an
> explanation about the changes in the license files must be added in the
> commit log.
>
> Also, please note that updating from 5.3.0 to 5.4.0 is OK as the
> package is new in 2024.08, but as it fixes a security issue, we need to
> have this fix in master, and therefore a more minimal update to 5.3.1
> would have been preferable for master (and the update to 5.4.0 in our
> next branch). But again, as this package is new, I think it is OK to
> upgrade to 5.4.0 even in our master branch.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


I'll send a revision of the patch soon


Thanks,
Woodrow Douglass

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
