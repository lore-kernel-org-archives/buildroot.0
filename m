Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652D0C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 07:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E435060B1D;
	Sun, 23 Jul 2023 07:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E435060B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcyYXE59oTYX; Sun, 23 Jul 2023 07:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24D5960687;
	Sun, 23 Jul 2023 07:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D5960687
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 877A81BF3DA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 07:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 421FE40484
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 07:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421FE40484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-1HB2k-5IO8 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 07:48:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3848440168
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 07:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3848440168
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF90C40003;
 Sun, 23 Jul 2023 07:48:20 +0000 (UTC)
Date: Sun, 23 Jul 2023 09:48:18 +0200
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230723094818.1d6d19f4@windsurf>
In-Reply-To: <20230706171834.1065129-1-vfazio@gmail.com>
References: <20230706171834.1065129-1-vfazio@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690098501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBW8h2u10QmxPNzGLcsVSZfqVTYe7pfWA+mYrL+fBqU=;
 b=dMAaT6l6/xgMJd6yIN7+bq35vpCxpINuMiTtPVRRf6eyqtZO7HVme1oSZ3LjxVb8zpyvFv
 40wuHDFb0OARqU58TN3Ijcv1t+ik/u/B556RnXoTHYoJ4BackDMfOfxseKIiZpwOMrsNzZ
 UMOquYSZtJRvb3+xnBU95mdmzWydf0cN31NNym+BYdVu2tc2k9JBtKm5iDP48aNEiQyZ7S
 1mLljj4rdLoOlGDjMHinMSSB3Pg8XXQrAPXNkpo+jMj9b0rNt8y2qJclodVTKKMAT/ak93
 YX2KcFNH7z5ING3jTytUhefWY2PhE0VULrwhM4XaHa4gausgVl7WhH473c3TLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dMAaT6l6
Subject: Re: [Buildroot] [PATCH 1/3]
 toolchain/toolchain-external/toolchain-external-bootlin: flag OpenMP
 support
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  6 Jul 2023 12:18:32 -0500
Vincent Fazio <vfazio@gmail.com> wrote:

> Due to a bug in the upstream toolchain builder's fragment generator [0],
> gen-bootlin-toolchains is not aware that OpenMP was enabled for all
> 2022.08 toolchains.
> 
> OpenMP support needs to be flagged so the proper libraries get copied
> into the resultant filesystem to avoid missing dependencies [1].
> 
> [0]: https://github.com/bootlin/toolchains-builder/issues/60
> [1]: https://bugs.busybox.net/show_bug.cgi?id=15634
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  .../Config.in.options                         | 187 ++++++++++++++++++
>  1 file changed, 187 insertions(+)

Thanks, I have applied the series. For PATCH 1/3, I have reworked the
commit log, because in fact what I did is that I fixed the bogus
fragments on toolchains.bootlin.com, then applied your commit, ran
gen-bootlin-toolchains, and verified that the results were identical.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
