Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26DBC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 07:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAADC60FBF;
	Sun,  4 Feb 2024 07:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAADC60FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYoDxMdgS1LI; Sun,  4 Feb 2024 07:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14AC861480;
	Sun,  4 Feb 2024 07:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14AC861480
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6E3F1BF484
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 07:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F77761480
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 07:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F77761480
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4QaxJetSUbK for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 07:40:31 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B323F60FBF
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 07:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B323F60FBF
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4436135210E4; Sun,  4 Feb 2024 08:40:27 +0100 (CET)
Date: Sun, 4 Feb 2024 08:40:27 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zb8/azzAJHqtcGcw@waldemar-brodkorb.de>
References: <Zb0RQA8kV+RXOd0h@waldemar-brodkorb.de> <87msshu9d6.fsf@48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87msshu9d6.fsf@48ers.dk>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1707032427; bh=hpP/yp75gfG5Q9jLnVU4drnQWGBd+G7yEwmxod1fYjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ol2772ZUE8RuCHGeojBfBFSxAHWjZjDfAaL47tFHBz5zXr9axyQLEgjAh9OdMWroV
 3ahBisGlGZp1Gg5pyqmzolwSvy6pMk5UbZNvi6VwWKlNZ8lmELz4bGTeQHQUxgSgXC
 HTDHtUXT0PUpDw9C6jGweK6yZWdkDDp4GF6CMpxtLMMvuvLzpJJeF7OCkITILE6gYR
 txBhdmGAYHzWXX1JFVxJIW+W4tP3LFUMBqPMgzz26eJ9aBiwn7lqA2998L0/wI4GxA
 1JC4+mklClB3Eiluz/+71FwXPrEeuxE7pof5oDCNAqDtTtTh26zdS5N+788Q0B2JAz
 mk1RrvVos6MRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=ol2772ZU
Subject: Re: [Buildroot] [PATCH 2/2 v2] package/asterisk: bump to 20.6.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,
Peter Korsgaard wrote,

> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
> 
>  > See here for changes:
>  > https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-20-current.md
> 
>  > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>  > ---
>  v1-> v2:
>  >  - use separate libjwt package instead of bundled one, suggested by
>  >    Peter Korsgaard
>  > ---
>  >  package/asterisk/Config.in     | 1 +
>  >  package/asterisk/asterisk.hash | 2 +-
>  >  package/asterisk/asterisk.mk   | 6 ++++--
>  >  3 files changed, 6 insertions(+), 3 deletions(-)
> 
>  > diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
>  > index c52456f8fc..662f070dac 100644
>  > --- a/package/asterisk/Config.in
>  > +++ b/package/asterisk/Config.in
>  > @@ -10,6 +10,7 @@ config BR2_PACKAGE_ASTERISK
>  >  	select BR2_PACKAGE_LIBCURL
>  >  	select BR2_PACKAGE_LIBEDIT
>  >  	select BR2_PACKAGE_LIBILBC
>  > +	select BR2_PACKAGE_LIBJWT
>  >  	select BR2_PACKAGE_LIBXML2
>  >  	select BR2_PACKAGE_SQLITE
>  >  	select BR2_PACKAGE_UTIL_LINUX
>  > diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
>  > index 246f4219aa..d50955dd2b 100644
>  > --- a/package/asterisk/asterisk.hash
>  > +++ b/package/asterisk/asterisk.hash
>  > @@ -1,5 +1,5 @@
>  >  # Locally computed
>  > -sha256  9def260ac8745a5eac7aceabe1c22f84a283b7812f0eccd760f87ce9eb991d22  asterisk-20.5.2.tar.gz
>  > +sha256  088dbc08916e21528dba364f5452b2090b066dbba4548b32ec10af138d4b442f  asterisk-20.6.0.tar.gz
>  
>  >  # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
>  >  # sha256 locally computed
>  > diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
>  > index d1f3ea82d3..869e4128ff 100644
>  > --- a/package/asterisk/asterisk.mk
>  > +++ b/package/asterisk/asterisk.mk
>  > @@ -4,7 +4,7 @@
>  >  #
>  >  ################################################################################
>  
>  > -ASTERISK_VERSION = 20.5.2
>  > +ASTERISK_VERSION = 20.6.0
>  >  # Use the github mirror: it's an official mirror maintained by Digium, and
>  >  # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>  >  ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
>  > @@ -27,7 +27,7 @@ ASTERISK_SELINUX_MODULES = asterisk
>  
>  >  # For patches 0002 and 0003
>  >  ASTERISK_AUTORECONF = YES
>  > -ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson
>  > +ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson -Ithird-party/libjwt
> 
> Why do we still need to point autoreconf to the bundle libjwt?

Otherwise the generated configure does not work.
 
> Even worse, I see the following during the configure step:
> 
> checking for embedded pjproject (may have to download)... configuring
> [pjproject]  Downloading https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.13.1/pjproject-2.13.1.tar.bz2 to /tmp/pjproject-2.13.1.tar.bz2
> [pjproject]  Verifying /tmp/pjproject-2.13.1.tar.bz2
> [pjproject]  Verify successful
> [pjproject]  Verifying /tmp/pjproject-2.13.1.tar.bz2
> [pjproject]  Verify successful
> [pjproject]  Unpacking /tmp/pjproject-2.13.1.tar.bz2
> 
> We don't want packages to download stuff behind our back. Can we use an
> external pjproject?

I tried with the existing libpjsip in the tree, but asterisk is
segfauting with my config:
Asterisk Ready.
asterisk: ../src/pjsip/sip_transport.c:296: get_tpname: Assertion
`!"Invalid transport type!"' failed.

Thread 28 "asterisk" received signal SIGABRT, Aborted.

Unfortunately the external libpjsip 2.14 does not work well with
Asterisk.

What can we do about it?

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
