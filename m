Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FACC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:48:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82F90610A2
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82F90610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C1E3831A0;
	Sun,  1 Aug 2021 18:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJawbA48Ubds; Sun,  1 Aug 2021 18:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC7758322E;
	Sun,  1 Aug 2021 18:48:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FF801BF399
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90045605B0
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnePsSTh8Qxm for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 18:48:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1E18600B6
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 18:48:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1ADA65FFA8;
 Sun,  1 Aug 2021 20:48:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627843714;
 bh=AO+pDVlWBbFLGMXIsiielsYmDbsqzXr1tAQUlLnb4/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OFMBEU7BQ9zAjg/UPf1pH+8lGtVcIonz7n4iSy9Wup99Xcw82NMRtf+vPV1PZHi70
 JUKQlOfuFGqV9KoosSDbak60QTPy2G+RhOa6MCtGTDLqgXYd9H2ZuFyjiXAwxInpfA
 EkIMlrDAKohEEnNEj7uoglZokIwjCOua8TjSf95xfj00uBvrftV+NzJmzIwQoZ5FC+
 3WfBtkZ0SBhKzyrCnQvlARpuBO+z/elNcckc9SOCOngQtv0D4apKbmgAtc3N5ORJfy
 teFliSoYp9otwQRnp+O/brrP24tjwK7q+STABLWKkkedoVYPD7FBRjLUaKdT4Qnqn1
 K7isYWRN43f6g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 20:48:29 +0200
Date: Sun, 1 Aug 2021 20:48:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801184829.GI3189549@scaer>
References: <20210801122909.3074515-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801122909.3074515-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/openzwave: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 14:29 +0200, Fabrice Fontaine spake thusly:
> Set DEBUG_FLAGS and RELEASE_FLAGS to an empty value to remove -Werror
> and fix the following build failure with gcc 11:
> 
> /tmp/instance-5/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/command_classes/AssociationCommandConfiguration.cpp: In member function 'virtual bool OpenZWave::Internal::CC::AssociationCommandConfiguration::HandleMsg(const uint8*, uint32, uint32)':
> /tmp/instance-5/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/command_classes/AssociationCommandConfiguration.cpp:191:85: error: 'this' pointer is null [-Werror=nonnull]
>   191 |                                                                 group->ClearCommands(nodeIdx);
>       |                                                                 ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/05ad5cc1f593704ef032f3c5278695247450b94b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openzwave/openzwave.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
> index 357d19f32e..9c28c0a13b 100644
> --- a/package/openzwave/openzwave.mk
> +++ b/package/openzwave/openzwave.mk
> @@ -23,6 +23,7 @@ OPENZWAVE_INSTALL_STAGING = YES
>  # the correct directory otherwise openzwave will install configuration files in
>  # $(PREFIX)/etc/openzwave.
>  # Disable doxygen documentation.
> +# Set {DEBUG,RELEASE}_CFLAGS to an empty value to remove -Werror.
>  OPENZWAVE_MAKE_OPTS = \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
>  	PREFIX=/usr \
> @@ -30,6 +31,8 @@ OPENZWAVE_MAKE_OPTS = \
>  	pkgconfigdir=/usr/lib/pkgconfig \
>  	sysconfdir=/etc/openzwave \
>  	DOXYGEN= \
> +	DEBUG_CFLAGS= \
> +	RELEASE_CFLAGS= \
>  	USE_BI_TXML=0
>  
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
