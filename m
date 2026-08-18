Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B8DC5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 21:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5DF480EB3;
	Tue, 18 Aug 2026 21:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8MZ86x37mKD; Tue, 18 Aug 2026 21:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787087878;
	bh=SYfo6XJG1U5Ozliwov3S5mhjCZLRFfvEsl2M++1vc+A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E81z+7iIcAxramyFjccDHDDsuqgUqQAjz1vLNb//aCkb0hCCBMjx4+MYEsEOu/E6J
	 kZ9szTDzzt4zfnEbB2ln7C9j3Svobttmts4NGtkkyKCEYqFkq+9h5tnujLVzw2jBqn
	 54vN2xExvh9esWDmh5Mjx5sZWTjjWdvsw2iUGvnxCzQjotKuZxZOClQpkEu6lEgY+O
	 yd+ZseyTItnELXyO8FHV7kk1qqX5PVk4TKVJ9fEzVwCpMeLulIBfOhwOtm6bGOKrAG
	 1mcSXg+PmR/ydCtThKxLGC6rfvrsionNN/GvpLRaV5ZObniQSi/4dQKLZ3YTgIpk0n
	 1S49O1dNqgSmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0221E80D84;
	Tue, 18 Aug 2026 21:17:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A54AB29B
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B2F2606E8
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bskwHt0SD0_T for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 21:17:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D207606D9
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:17:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AB4E14E41289;
 Tue, 18 Aug 2026 21:17:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 811F360355;
 Tue, 18 Aug 2026 21:17:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6D69211C74F8F; 
 Tue, 18 Aug 2026 23:17:48 +0200 (CEST)
Date: Tue, 18 Aug 2026 23:17:47 +0200
To: =?utf-8?Q?Rapha=C3=ABl?= Gallais-Pou <rgallaispou@gmail.com>
Cc: Alsey Coleman Miller <alseycmiller@gmail.com>, buildroot@buildroot.org, 
 Romain Naour <romain.naour@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>
Message-ID: <aoTL16HYNoYHZtEM@windsurf>
References: <20260809201403.3855903-1-alseycmiller@gmail.com>
 <6db03f79-b74a-4c8e-88f7-72d324ab4cde@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6db03f79-b74a-4c8e-88f7-72d324ab4cde@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libxkbcommon: build
 libxkbregistry when libxml2 is available
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Rapha=EBl,

On Mon, Aug 10, 2026 at 11:51:19AM +0200, Rapha=EBl Gallais-Pou wrote:

> For information, I've provided a similar fix here:
> https://lore.kernel.org/buildroot/20260527-master-v1-1-0d975f3b3f0d@gmail=
.com/
> earlier this summer.
> =

> Romain stated that xkbregistry had been disabled on purpose[1] and to whi=
ch
> my question has remained unanswered in this time of holidays.

Thanks for your message. On my side, the change looked good. I applied
the version from Alsey, as their version had a more documented commit
message.

Best regards,

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
