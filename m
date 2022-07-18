Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB27EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F47683E91;
	Mon, 18 Jul 2022 10:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F47683E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZ2_wqItc4iG; Mon, 18 Jul 2022 10:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B506B83E8A;
	Mon, 18 Jul 2022 10:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B506B83E8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6BDE1BF421
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF2CF83E0D
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF2CF83E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWg2peIeWL-P for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:11:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F98483E10
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F98483E10
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 10:11:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B66A3C0011;
 Mon, 18 Jul 2022 10:11:42 +0000 (UTC)
Date: Mon, 18 Jul 2022 12:11:41 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220718121141.513277ca@windsurf>
In-Reply-To: <20220717221400.2907670-1-fontaine.fabrice@gmail.com>
References: <20220717221400.2907670-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658139103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JlRiHBLfyC5ykUKEtQmI4oVbVRwkMCnYklVMGY+9qU0=;
 b=GZbRDx91PqKAqanSxmTd5l89HbwZT4wMFL7zRpCG5fF2RkgDmUrMWyOxZEkfPi02ZRrNYY
 L0gLgI0/jiHEERo46Wr43GEQVGS0zDL3YLknTym5HaIkoTveQ8zLJOywOXvjIoCYjO+hWI
 DoU3UPfRKlWeqFrcCWen7updkx/1oc7u3KnLISqkelFyi/EyIAGrSW0G6MqjM8mL3wG3Va
 3JPEA/iXs+PwR9WyicgNVIiNtTiEWwBZsUMKyUyV8ryiBxFvHP3gy8hzFQDtaHVxY7JboS
 mB4NBEjGoVU8sRzQmDX1iJkjgcz14z4xKOq4ZVHnvk0NyW/m9NFFYpLQtXJhKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GZbRDx91
Subject: Re: [Buildroot] [PATCH 1/1] package/apg: fix musl static build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Jul 2022 00:14:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop APG_CFLAGS (which is empty) to correctly set CFLAGS with
> TARGET_CFLAGS (which will contain -static) passed by
> TARGET_CONFIGURE_OPTS. Moreover, pass TARGET_CFLAGS to FLAGS which is
> used to build apgbfm. This will fix the following musl static build
> failure raised since the addition of the package in commit
> 99eb1a7019a4333f99e93b844962db301a8c3f98:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/10.3.0/../../../../armeb-buildroot-linux-musleabi/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/armeb-buildroot-linux-musleabi/10.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
> /home/buildroot/autobuild/instance-2/output-1/build/host-gcc-final-10.3.0/build/armeb-buildroot-linux-musleabi/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0e53957965363ceb7141bf8a612998abec893b17
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/apg/apg.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
