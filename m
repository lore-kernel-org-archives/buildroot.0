Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F31FC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37F324049A;
	Wed, 27 Jul 2022 09:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37F324049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CN0sykQbFMsy; Wed, 27 Jul 2022 09:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EA154048C;
	Wed, 27 Jul 2022 09:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EA154048C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E84511BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C351B81A81
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C351B81A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VUgoozeXU9Mi for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:22:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2B4481A65
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2B4481A65
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:22:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8EE81240009;
 Wed, 27 Jul 2022 09:22:53 +0000 (UTC)
Date: Wed, 27 Jul 2022 11:22:52 +0200
To: Nicolas TRAN <nicolas.tran@smile.fr>
Message-ID: <20220727112252.5cf24679@windsurf>
In-Reply-To: <CAJdGGv5J4VJWfb3Y-r-U2EsVNKq8qG9qd3t1L9nPihK0uT3tuQ@mail.gmail.com>
References: <20220726155115.2024965-1-nicolas.tran@smile.fr>
 <20220727094534.5e912b16@windsurf>
 <CAJdGGv5J4VJWfb3Y-r-U2EsVNKq8qG9qd3t1L9nPihK0uT3tuQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658913773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/PuX0kfDbPcgDNDHSE6Klu/cBfolTvO7mplEuktbINQ=;
 b=nHWd3G43q3yIfQxwaMhfx7eT4BI/W5pS+Bv7ISBoX21FH78WW/JbGQcDKdB6EOOfmKa7vs
 nQWz0fxEg3H4j8D1RA6XB8mm57jVWvmdsohVxd8oO3EYkyed2YANyYAw3NdgWuXAd96RMR
 cJQiLZ+gi5qhn3I2xzK/JAziIFmQyvUzoVICSy/uHt3EYgdeIErJ14Cxhtb+IJP+GE79oq
 3gaIVZLGC95Y2tjEnWXm5ikbZj55d7YOGVMMerRBDqyANikqowjfH4A9EMeaq0vZvFk2fq
 m13+0ehWKOE8EbHTx7ICN4tCjBrfueCh0FX3KavqeawOE05MfN3yZjlUFz6yHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nHWd3G43
Subject: Re: [Buildroot] [PATCH v3] package/dust: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nicolas,

On Wed, 27 Jul 2022 10:52:37 +0200
Nicolas TRAN <nicolas.tran@smile.fr> wrote:

> Indeed, the hash value is wrong.
> $ sha256sum dust-0.8.1.tar.gz
> 8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19789bebde
>  dust-0.8.1.tar.gz
> 
> The mismatched value corresponded to the v0.8.1-alpha.2 release of the
> package I previously used. Sorry for the confusion.

Thanks for confirming. Could you send a v4 with the correct hash,
verified on your side?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
