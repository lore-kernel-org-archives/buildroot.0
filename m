Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1A5C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 08:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5829261156;
	Tue, 19 Jul 2022 08:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5829261156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_5bq3S4jw13; Tue, 19 Jul 2022 08:27:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C6460B2E;
	Tue, 19 Jul 2022 08:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60C6460B2E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6DA01BF4D7
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 08:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1FDC818CD
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 08:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1FDC818CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iCWqdxeQ1lNE for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 08:27:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E033A8188B
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E033A8188B
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 08:27:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22DFB24000B;
 Tue, 19 Jul 2022 08:27:25 +0000 (UTC)
Date: Tue, 19 Jul 2022 10:27:24 +0200
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220719102724.6adf0242@windsurf>
In-Reply-To: <CACPK8XeFVxsENuo9uWCzQiaOOSfDvkrSMVTQfUU5me_Xzsw-gg@mail.gmail.com>
References: <20220708142150.234611-1-bernd.kuhls@t-online.de>
 <20220718141453.23c89337@windsurf>
 <CACPK8XeFVxsENuo9uWCzQiaOOSfDvkrSMVTQfUU5me_Xzsw-gg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658219247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+U0OAyRV8rTB6JPvI7V0zncyeCK2ZDANXmRJg8bphXM=;
 b=IOEPD7zXZmQyfIhQm6wtYvf4Z1vpkQtdo0GmxN/IWi//N15WK447kGZS1wEa+mOYHG38pq
 MWHOyWkrGHbha8978vXqFON7YKbJC7kqswHgnHoUNrd2Yn01PbF6rt0PpQ3PIzte7ARUha
 fhW1xiYaJsOKhMB/wdvpEYH7e5SxiQ0/lyymXj4cvMh2pA25M0tRP6IuseZWUfv5yCt0j8
 UXEmPyVcXvtu3qrJTf3aeuCZ/aOOa6yAJaAwQwNivxDjt7GJweo2ckh4w+gvAaWu/jrYq+
 2O25ntFOYpQuJ/BslShP58ziXiGk3/1Kv0Q7+DJDLc8UkStUEm1vYZCG/squ/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IOEPD7zX
Subject: Re: [Buildroot] [PATCH 1/1] package/pixman: fix powerpc64le build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Joel,

On Tue, 19 Jul 2022 07:46:03 +0000
Joel Stanley <joel@jms.id.au> wrote:

> There's a few build failures going around due to nonsense
> configurations. In most cases the config has BR2_powerpc64le=y without
> selecting a CPU.

"Not selecting a CPU" is not possible. There is always a CPU within the:

choice
        prompt "Target Architecture Variant"
        default BR2_generic_powerpc
        help
          Specific CPU variant to use

...
endchoice

that will be selected. However...

> This defaults us to BR2_powerpc_970=y, which is a CPU
> that isn't supported to run ppc64le.

... it seems like some of them are selectable on ppc64le, even though
they do not make sense.

> The fix is to only allow CPUs that support ppc64le to be configured
> for that platform. I've prepared some patches that I'm running though
> CI now, and I'll send them out once they're tested.

Excellent! Looking forward to it!

> If my changes don't fix this pixman issue then we can use the
> BR2_POWERPC_CPU_HAS_ALTIVEC to force AltiVec/VMX off when we know the
> CPU does not support it.

But there's still a weird thing going on: pixman has a configure.ac
check that compiles a small test program to verify if VMX support is
available... and it concludes it is, but the actual pixman code then
fails to build.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
