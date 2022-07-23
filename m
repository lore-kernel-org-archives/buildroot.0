Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737BFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF2334168B;
	Sat, 23 Jul 2022 19:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF2334168B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EjJoW6eH83AB; Sat, 23 Jul 2022 19:11:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C89F64168D;
	Sat, 23 Jul 2022 19:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C89F64168D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D29581BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACECF84C15
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACECF84C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NTBM0-p2Pg2 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:10:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2386E84B8D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2386E84B8D
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:10:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE98160005;
 Sat, 23 Jul 2022 19:10:55 +0000 (UTC)
Date: Sat, 23 Jul 2022 21:10:53 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220723211053.69edd126@windsurf>
In-Reply-To: <20220517215933.1553086-1-james.hilliard1@gmail.com>
References: <20220517215933.1553086-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658603456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KeLbH465W21c/bSkxYNXo/sLSx9iaLcRf3Lrxek1RCo=;
 b=ZoTOvBLqjKr0elYsIGDMvq29K6LKgTAdZid309LsaXaDK8aPDjWkXrtuZD3BB8CYap0ALH
 ZOZ9X8OXkFytw6HqZenEQO/SqqFVlodtduFn8ruOe1C3CfItwcOtDOldMmzJ0te3LsmmGo
 0wE8w6/mHYh3MWCLmqUom4HI6NdR5F2dt6szglAlwKSBSBscnbBfaKkj3zZrydvcszNf0i
 XOjcodIb5cIfp6wLCdHvwvFlemFzckfSyndDP3Xtngzybia0InlGFxv/GZtOjul2cgW5kW
 i1pedOwpiZ3qh0gqabIN44nwPmIc4ee0uzwwZH2NDvbxA8s9VBd5ReO4VDY6TA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZoTOvBLq
Subject: Re: [Buildroot] [PATCH 1/4] package/python-typeguard: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 17 May 2022 15:59:30 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                              |  1 +
>  package/python-typeguard/Config.in             |  6 ++++++
>  package/python-typeguard/python-typeguard.hash |  5 +++++
>  package/python-typeguard/python-typeguard.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-typeguard/Config.in
>  create mode 100644 package/python-typeguard/python-typeguard.hash
>  create mode 100644 package/python-typeguard/python-typeguard.mk

Series applied, thanks. However, you had forgotten to add yourself in
the DEVELOPERS for the 3 new packages, so I have done so. Could you try
to remember for your next new packages to do that?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
