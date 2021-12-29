Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7FAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 16:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98CD240241;
	Wed, 29 Dec 2021 16:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwzOoD7pjfc2; Wed, 29 Dec 2021 16:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C93A54021C;
	Wed, 29 Dec 2021 16:27:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02E711BF373
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 16:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E43D64021C
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 16:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PP_9kF7HdlxP for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 16:27:23 +0000 (UTC)
X-Greylist: delayed 02:25:48 by SQLgrey-1.8.0
Received: from 8.mo548.mail-out.ovh.net (8.mo548.mail-out.ovh.net
 [46.105.45.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86675400C1
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 16:27:23 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.15])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4B6B420DB6;
 Wed, 29 Dec 2021 14:01:32 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 29 Dec
 2021 15:01:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0026df9a7c9-ebba-4820-8a41-03aa205d804b,
 6404A340A715A174C0D1142DC6E97647B5DF2CAE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ac4e193e-3fcb-80df-a433-70664e5fb850@kaod.org>
Date: Wed, 29 Dec 2021 15:01:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211112160413.2736382-1-clg@kaod.org>
 <20211228221430.7e8cb844@windsurf>
 <f7dc4424-a38a-c448-4436-f1e06b86ffb9@kaod.org>
 <20211229095040.43a2bb32@windsurf>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211229095040.43a2bb32@windsurf>
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8cbdf10d-c004-4b86-a009-0444a42c7ef5
X-Ovh-Tracer-Id: 7654993470347709222
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddvuddgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmrghtthhhvgifrdifvggsvghrsegtohhllhhinhhsrdgtohhm
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu: Add a ppc64le-powernv
 configuration
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

>> because the same image can be used for the QEMU machine implementing
>> the POWER8 processor, which also works for POWER9 and Power10.
> 
> So why don't we test it with -M powernv8 ?

Sure. Would you rather have a ppc64le-powernv8 and a ppc64le-powernv9
config instead ?

I have a few other patches adding similar boards for 44x CPUs. I can
resend a v2 for the whole.

What's the process to bump the QEMU version ?

Thanks,

C.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
