Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B760C43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE614195E;
	Wed,  6 Jul 2022 21:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BE614195E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjOA1lC9CPkJ; Wed,  6 Jul 2022 21:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1634402EF;
	Wed,  6 Jul 2022 21:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1634402EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA831C1135
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D87B24049A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D87B24049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJo8rlAfOfVP for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:30:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE10540134
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE10540134
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:30:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8714AFF803;
 Wed,  6 Jul 2022 21:30:04 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:30:03 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220706233003.1bd89c76@windsurf>
In-Reply-To: <20220628213448.2886869-1-fontaine.fabrice@gmail.com>
References: <20220628213448.2886869-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657143004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ylTsOuIoAJnnYizVqulRjhdFh+wFOKXC4usC1KeHB7U=;
 b=hsv9kS9IQujMqWNAAICGMksXFoj1Kvlh7LXtNbvfb5gSbycxpwrwxE0lndS5iKpcKAM2YC
 FDZXXzGoMZMS9Fk1h6XyJbV8CmqWsmTZu7uL+i53UIy17FrruJYroVHzwL+Rbp8N95eOiR
 YuPVKVPxZ8uJCvfp2FqKjtPIU9K+eIx6QucC/4+BQ2aMwHVlSezcUPlOU0FG+xZ9A+1Eiz
 4eVI/xuIe5DOg2LPUjqZofXK8S0T8aIpvpIsEaJ2GPvZgS7aQPtDDn+g3JnuVSQNu5HSE0
 QimtBJncXo/IzCwEnDCkpyqUxJ1meYyVHsUgUS0ZOJTSt0JpPNwReTkEdaCNoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hsv9kS9I
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libsndfile: fix libsndfile.pc
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

On Tue, 28 Jun 2022 23:34:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with libsamplerate or minimodem raised
> since bump to version 1.1.0 in commit
> c59a9d12b7805f2ac08be81fe18a4ebc197d5cd9:
> 
> powerpc-buildroot-linux-uclibc-gcc.br_real: error: EXTERNAL_MPEG_LIBS@: No such file or directory
> 
> Add host-pkgconf dependency to avoid the following build failure when
> running autoreconf:
> 
> configure.ac:345: error: macro PKG_INSTALLDIR is not defined; is a m4 file missing?
> m4/ax_require_defined.m4:35: AX_REQUIRE_DEFINED is expanded from...
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6de2d7634b1958693b7cf96fbcc79121f92347e9
>  - http://autobuild.buildroot.org/results/bf66b19cacd6394957f534035af647ddd8037d60
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Add host-pkgconf dependency

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
