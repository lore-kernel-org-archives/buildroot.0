Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944ABC001DB
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 08:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE84181ED4;
	Sat, 12 Aug 2023 08:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE84181ED4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FjNWRtx9efnW; Sat, 12 Aug 2023 08:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B33181E98;
	Sat, 12 Aug 2023 08:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B33181E98
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A8661BF97A
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 08:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13FDF81E98
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 08:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13FDF81E98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHQWgOFdfChs for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 08:38:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8945D81E89
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 08:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8945D81E89
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAEF620002;
 Sat, 12 Aug 2023 08:38:07 +0000 (UTC)
Date: Sat, 12 Aug 2023 10:38:06 +0200
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20230812103806.2a4efc58@windsurf>
In-Reply-To: <DS7PR12MB904183FEC62ABB8A5A372E65A110A@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20230802220321.6af766af@windsurf>
 <DS7PR12MB9041FA314EB2D49935CF2D85A10BA@DS7PR12MB9041.namprd12.prod.outlook.com>
 <20230803001230.284ba84d@windsurf>
 <DS7PR12MB9041C235443BB70E65A561FEA108A@DS7PR12MB9041.namprd12.prod.outlook.com>
 <cc38f5ec-c613-2323-e288-7fc1d0b186b6@mind.be>
 <20230812002503.33f6d5c3@windsurf>
 <DS7PR12MB904183FEC62ABB8A5A372E65A110A@DS7PR12MB9041.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691829488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQ+jCrTPAhg0wK+6xLqL/yRv6+IdsE2S1+tEvYXA7Xs=;
 b=g3qmkV5JqgacsZdeoT/wlpkbBvDjnelbzqwlzP0pzyLlQOJZs7KIGMa7MnQx0lhwMDrneT
 QsJ8CRHyaP14hVbRp2Rm9nZE9stNk4ibziWSw45W5ohdgYICm8iQgVud7lvN1Vu0qQTHyJ
 Ka6u7zEETedjai5I2s+46L7YbPqLpcnd8QvCt5Nqodn42dlp1yCtWX4LIoKNSGCnsZdv2n
 /F2EIr2mTO8sAkQVLzzXby/3xarg0B4/j54ecSXoqQNS1MIWiEH2yomHpjZhIiQ9u2pD4r
 r+tPUqYKaBEniOYr8M/tOoX+EQvbLoIU5ZQYrmsqBY4u0wVZpSCmq4TddTZCQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g3qmkV5J
Subject: Re: [Buildroot] ARC support in Buildroot
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: ARC Buildroot mailing list <arc-buildroot@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Aug 2023 22:34:27 +0000
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> I'd say in coming weeks as I already started to work on clean-up and
> preparing for submission of first patches. In that sense I may handle that myself.
> One question to you though, if you prefer to have 2 patches:
>  1. Remove ARC-specific GCC & Binutils
>  2. Introduce ARCv3-specific tools: GCC, Binutils & glibc (uClibc is already upstreamed)

Are the ARCv3-specific tools going to be different than the
ARC-specific tools?

I think it could go like this:

- Update ARC-specific tools to newer versions (one patch)
- Add ARCv3 (one patch)
- Make ARC-specific tools only available for ARCv3 (one patch)

How does that sound?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
