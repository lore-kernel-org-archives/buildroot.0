Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2ACC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 17:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7948040334;
	Mon, 22 Jul 2024 17:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LuhJIU1lQUt2; Mon, 22 Jul 2024 17:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34CD640343
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34CD640343;
	Mon, 22 Jul 2024 17:24:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7994B1BF2F7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 17:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65FAD40343
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 17:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vulfLcis1R_Q for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 17:24:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.89.1.17;
 helo=014.lax.mailroute.net; envelope-from=wdouglass@carnegierobotics.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2DE2340334
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DE2340334
Received: from 014.lax.mailroute.net (014.lax.mailroute.net [199.89.1.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DE2340334
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 17:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 014.lax.mailroute.net (Postfix) with ESMTP id 4WSRwK3xtgzlt3BM;
 Mon, 22 Jul 2024 17:24:17 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 014.lax.mailroute.net ([127.0.0.1])
 by localhost (014.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id SzEO906x7UgX; Mon, 22 Jul 2024 17:24:16 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 014.lax.mailroute.net (Postfix) with ESMTPS id 4WSRw32ybgzlt3B7;
 Mon, 22 Jul 2024 17:24:03 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 22 Jul 2024 13:24:02 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Mon, 22 Jul 2024 13:24:02 -0400
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Woodrow Douglass via
 buildroot" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/chicken: move literals into text
 section for xtensa architecture
Thread-Index: AQHa3FJhLeGIhJGZ+UGtiNGVDDN4o7IDQk0A
Date: Mon, 22 Jul 2024 17:24:02 +0000
Message-ID: <b318a44f-5471-4bc1-8522-e8650d21173c@carnegierobotics.com>
References: <20240722143100.346659-1-wdouglass@carnegierobotics.com>
 <20240722150833.360915-1-wdouglass@carnegierobotics.com>
 <20240722181534.44a86e85@windsurf>
In-Reply-To: <20240722181534.44a86e85@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-originating-ip: [172.30.0.85]
Content-ID: <91D1C6ACB79D4846B85308ECB432B1B6@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1721669056; x=1724261057;
 bh=Nwa/q+X1ItCvBThiY7fSnr2822TxQLpfi0oy2qzfmsw=; b=qRm+ana3ZNea
 wmka+KjPT3IPgkmhrWZiG/fl356hN2fYtDz8O7FW7bMFhvNACBBr7vkx+waMbMb5
 RYHDyJ+TLoJCAZRIwoeTabtpZKVeZPW2Ywd/IGGxi3uuxx96kQMLAz0TXMNlA9BD
 gVzkftGQHwu5QFjQl5MbJjEgXl3HFdS23lSuhXoDv0JQSlret49Enxi0BCBEQ+x5
 yvrHJUAv/0OLkcy/5ui6XDy0H/ZWH6fmDV67eIiZC113cERXtPDca3cUZXeaAVb2
 +bt3x7PXaagzLTnY9XXrsk6eBlU8WEW7JuLuYrdQTTEkw8N6leug2k6Dg40SpuyA
 7ov9lwG52w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=carnegierobotics.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=qRm+ana3
Subject: Re: [Buildroot] [PATCH] package/chicken: move literals into text
 section for xtensa architecture
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

Thomas,

Sorry about that, i was replying with `git send-email`, and it didn't 
work the way that I expected. I'll update to filter back to `unused` and 
attempt to reply to this email.

Thank you for your patience, and all your work maintaining buildroot!
Woodrow Douglass

On 7/22/24 12:15, Thomas Petazzoni wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender.
>
>
> Hello Woodrow,
>
> On Mon, 22 Jul 2024 11:08:33 -0400
> Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:
>
>> -# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
>> +#Chicken only uses the "arch" variable for some special-case compile arguments
>> +#If it's empty, it tries to detect the arch host
>> +#x86-64 is spelled differently, but in most cases the normalized arch is fine here
> You did not reply to my e-mail on an earlier version in which I asked
> some questions. I would prefer if we were not blindly passing
> $(BR2_NORMALIZED_ARCH) here, can we instead handle only the cases for
> which chicken does something specific based on ARCH=, and for all other
> cases, pass ARCH=unused, as we used to do?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
