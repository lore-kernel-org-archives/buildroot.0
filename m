Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30714EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 03:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9135940972;
	Tue, 15 Aug 2023 03:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9135940972
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMViFDagW0Rp; Tue, 15 Aug 2023 03:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0283340220;
	Tue, 15 Aug 2023 03:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0283340220
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B71441BF380
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 03:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 688F840931
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 03:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 688F840931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48i_sf4lp_oO for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 03:36:19 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC8B340900
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 03:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC8B340900
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D24B03520B80; Tue, 15 Aug 2023 05:36:14 +0200 (CEST)
Date: Tue, 15 Aug 2023 05:36:14 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZNryrsoZV6f+TZll@waldemar-brodkorb.de>
References: <ZNiFAM4q72gwMume@waldemar-brodkorb.de>
 <20230814165343.2e3936c6@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814165343.2e3936c6@windsurf>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1692070574; bh=aA+Fnb60eDWCbkwp5nHePLhgu9rctmpk54NQ3zs7Ra0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q7xxQ4CNGkP/vV7Jn2Kb10Sopj35irKdycPitvXh/625a6GuO5g7Q3rv39wDeCOfN
 xx7xp+HHHL9dAK8OUxsLn6YmJ+3LTAyxh4Q2drLY01KbFSy87oLI41BOBHpJC44xT/
 gVT1vC8qjl3+a9J+c8HuUl+mL86wNsRHgTu3ZdfY/iHYeNeIC7yVUv8jXj+ZvsTmRV
 d+sqt4svhC/SrBNm1hyhKOXd6iWIU2wWVbgfKPeWHBgZKlFqfQPpXkBH/mDn6rWG6Q
 N43DelfAHso8zFWjF9Z0d/GpUpcEXlq2UZWhO42F4H4J5aFDx2MLLDiRgHmrPY/hY2
 WeQWiGA/uLOXw==
Subject: Re: [Buildroot] [PATCH 2/2] package/tcf-agent: fix uClibc-ng
 compile on ARM
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> On Sun, 13 Aug 2023 09:23:44 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> > +TCF_AGENT_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
> > +endif
> > +endif
> 
> What is the situation with musl?

Musl works fine with static and shared without this patch.
How should a v2 look like? 
 
> With glibc, BR2_STATIC_LIBS=y is impossible.
> 
> But with musl, BR2_STATIC_LIBS=y is possible. Is getauxval() always
> supported on musl, regardless of static or shared?

Yes.
 
> Also, shouldn't the horrible "#  define USE_getauxval
> (defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 &&
> __GLIBC_MINOR__ >= 16)) || (defined(__UCLIBC__) &&
> defined(__HAVE_SHARED__)))" be turned into a proper CMake test ?

That might be something upstream should do. :)

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
