Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A078BD10DDD
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 09:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74C13818C4;
	Mon,  2 Dec 2024 09:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Loy6_g800NxD; Mon,  2 Dec 2024 09:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96497818D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96497818D7;
	Mon,  2 Dec 2024 09:36:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 467F81DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 09:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31A2640863
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 09:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vqps8UAyzMMh for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 09:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D2E4E407D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2E4E407D1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2E4E407D1
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 09:36:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6A84FF803;
 Mon,  2 Dec 2024 09:36:10 +0000 (UTC)
Date: Mon, 2 Dec 2024 10:36:09 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 jarkko@kernel.org, bastien.curutchet@bootlin.com, Sen Hastings
 <sen@hastings.org>, Norbert Lange <nolange79@gmail.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
Message-ID: <20241202103609.60b97911@windsurf>
In-Reply-To: <87ser7kx7t.fsf@dell.be.48ers.dk>
References: <20241130092534.819113-1-thomas.petazzoni@bootlin.com>
 <87ser7kx7t.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1733132171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1vWgHilXvJruen+MgPx2upYMDJqlMcvOQ6VrmhoT7E=;
 b=lJuEpMPeNaiMho3Cfs3ySLQ7qDRyllbIT2fuDDpZwxDL2s/AGYnJvRdfFpLupCHrbuclnq
 F+xsRHIoXGGptS0qNZiuk5U8vklxA6iAg2X1d0V/KMgIWj9LfnTK/hfJpiEbA2mcd/UXdJ
 OtqGuE2yeTORnq8Z0NIr18hEqYqL0Pk+iQa+odZNdUcTS7r6MgMgyKAbO/PvADK4wfwf0/
 RZ3nlALOF3EPhctO+nziZzSUv+oZeoowklJ0zrgbkF/5kpQUSuoTJmqlWIlHjYQphE5z1Y
 Y5DaN5ZpmTNJcC9QQ1jeQYPdvYeSjIHKzhaExVSDHswWR6HchSbjKTLMeKwZ1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lJuEpMPe
Subject: Re: [Buildroot] [PATCH 2024.02.x] package/systemd: fix bcachefs
 magic patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 01 Dec 2024 20:41:10 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > This issue only exists in 2024.02.x at this point, because in master
>  > we have moved to systemd 256.x, which has dropped entirely this piece
>  > of code related to defining BCACHEFS_SUPER_MAGIC (and we wonder how
>  > systemd can then build with slightly older kernel headers, as
>  > BCACHEFS_SUPER_MAGIC is only in the public kernel headers since Linux
>  > 6.10).  
> 
> Hmm, odd indeed..

Yes, I didn't have the time to do an actual test... but I assume this
would have caused some breakage in the autobuilders, so I'm really not
sure to understand why it works.

> I see there are newer 254.x bugfix releases since v254.13 (latest is
> v254.21). Maybe it makes sense to update the version we use? I don't see
> anything directly relevant for this though.

No, the issue is not fixed upstream. I didn't test 254.21 because it
wasn't there, but I tested 254.20 and it definitely was still broken.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
