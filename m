Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B664C001DC
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9E9141887;
	Fri, 21 Jul 2023 21:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9E9141887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2aAVkj8_e78I; Fri, 21 Jul 2023 21:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAF0741862;
	Fri, 21 Jul 2023 21:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAF0741862
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECD781BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA53E408BC
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA53E408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnKVKhRhf1wN for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:29:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5272E40055
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5272E40055
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23A2540002;
 Fri, 21 Jul 2023 21:29:25 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:29:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230721232924.17dae1ed@windsurf>
In-Reply-To: <20230718183238.688311-1-bernd@kuhls.net>
References: <20230718183238.688311-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689974966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oo0dmZbB89/df/g1HF3K5rLK9JmWewttFv5dpM0s//M=;
 b=QN0nJQsLZRCG1NqX5vbVP2YgWOFunRwch7RTUUYUE7+FPONQT99yn0oHhEeyZIHhj42ruX
 mGq9yziRNwdkRx/6CpYbFkgljokcr2i00BR7uu5ThUuKYkEbwJNr1bZMpTVCqP89MZkG/x
 OEvG4ghJmiwp1TUAK1vBvyJAeCdztdsKPRXNLlnyBGkCZ5wbRgi3RGHofDtkjufaUjoHV7
 4uHZSve9zUb1glgR3vanfsw7cBUgIibLWXkm2U5IQw5A7CW4MrFlHHujof7aitrsw+srEd
 d1ANFvoUvAP+mxhxWLqpGsov0w7mVnz8mWKNmrdrIgcqhn4BDVqJX6VFOeUFkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QN0nJQsL
Subject: Re: [Buildroot] [PATCH v2 1/4] package/libwpe: bump version to
 1.15.1
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Jul 2023 20:32:35 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed md5 hash.
> 
> Release notes:
> 1.14.1
> - https://lists.webkit.org/pipermail/webkit-wpe/2023-February/000574.html
> 1.15.1
> - https://lists.webkit.org/pipermail/webkit-wpe/2023-May/000595.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: no changes

I've applied the entire series to master. Hopefully Adrian will be able
to have a look and provide additional comments/feedback if needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
