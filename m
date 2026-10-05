Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9945CA5FFC
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 19:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDAD560748;
	Mon,  5 Oct 2026 19:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltfiecjyawUk; Mon,  5 Oct 2026 19:22:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F3EFD6064B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791228170;
	b=gP4swKprUa3+M9d9q16feQ/hBLmTVRQy08vdI4TcItuXGRz7vXN8duNznFpiNCDeFAzK
	 Jp+oaxxKZqBpoPcrN26osWqeTgqqWtN672ARRlXAkViqOvU1iBoZcGOIsi8jKY5WLbcdp
	 98s5f0LK/QHiWtf0Awwp0MMBGRF4kX8EIYpRLqoeNOXG/eCzSz1g1VsCVj2pNL3qbaz4Y
	 +Tvr5rH2PPtm2QVIS6rxiSuxsbw73Lha0Vp9gzqbuHmck/55Gv1uWx43OxUwmDeO1i/U6
	 rDhqPmcwDqDOZ5/CvBb16LYIoJbJFMviUSb+SyoejNaUekcOKWZWVjdQgaMFzhpaAXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791228170;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 In-Reply-To:References:Date:To:MIME-Version:Message-ID:User-Agent:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IpB5289N55xoO/R9PT26FyBLu0vqpnTBj0yt+dvEmE8=;
	b=aqUjDXT0AHyDnyqD0vJ+TZAOJ+KzT1FCs05g2nwXkf059r9xW7PnTGi7aENU5ecyj+ek
	 xTXPdWBryvR2GKnttGm9Eqb/JfkMSQ8DqFcFyQQqvL4tl0I+mzzWO96zQhGcSKlOcdRER
	 nAZhUL8bJSB/WE1uCZCS7U12gotMjGOKeyCh/ZHvub+JN2M8/WvX739mOK4pg+/UiDsla
	 CoJXZPpvdjLY2kFozpIIdj3ToODnwt/JtmwSUrSRojNrOzdai+q1HV1SVDhVSmNcyxI2O
	 Joow09K+4upb/YcX6Lh/geu0PI9uOBy/9nzbb9xQXh/qxAloWumpZ4Mv6rKjIK+u5qw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791228170;
	bh=IpB5289N55xoO/R9PT26FyBLu0vqpnTBj0yt+dvEmE8=;
	h=In-Reply-To:References:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=DF/i3KV3etDO9hljgfQrom7dS3uBIQhb98sD/vuJf1aHKOa54VZaU+hJKDKawqHV3
	 XMjDWa/Be5lV4ed0ILXdWJ8js5vJwEF/mBIp5g7NGDiqTAF1yVwT1nzSf8UnOAk/tk
	 Az6wBKoQFPA9emE27e+VczZGBWY7Db5A0pnaNkYA2lur3VxjX79owF8w7WA8C62DmD
	 UV2KHdCtiG46sTa7UTLVou5LRT6YwXEzeZTMglW1ZnzUn/wdVa6eC9gmoW0YK1OMd2
	 l8NyH4Vm5T039b+eMMGaTvasmUPSzxuNlW/FCR9bl/TdJQvRgA+nZAhYt9685yMRfh
	 tKcz0PTJboNuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3EFD6064B;
	Mon,  5 Oct 2026 19:22:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FE85338
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 19:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15BBE4005A
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 19:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FTdkaJ_KKi6 for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 19:18:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7506F40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791227892;
 b=JpDUryY0hwqEMSufR8YNAThC8Hc2vXTAVtPf8iNDMHNoFp4P/0TKl1L26SWnJbMtuHEO
 j2P6gxxQ5eKXW1U9vVocOXj2K55mXX4vFn9Ln+jzoU5TtTe4FzXxA1AUAST9pZiO24qeJ
 tl7APesyNj3rL6o7FBR00Ez4wUSdMXFNJMqb1lkghw14kL6WBe6AQX08NUcoWaDScI8eL
 DEG3I9OPy2sDOX/XVqkfcV8xe0cjZlhg8iq63ql27jk45DjzFZ8Ib6lubcUWwiNV25JWA
 GThJBl0bD6LTcM3q1ZuHm2HPAGGPKOw4FQrEJvUk5XT+pnAqBeGf4isRxQdNu+iPuAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791227892;
 h=Received-SPF:Received:DKIM-Signature:From:In-Reply-To:Content-Type:
 References:Date:Cc:To:MIME-Version:Message-ID:Subject:User-Agent:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=/Dw4Vd1fIiEAGTW1BxwHqenwS3Petj2jWDe0nx6EwZ0=;
 b=oK6okrBySbw50Qlax5mFhCTRJbofUfRz7/4R/KsoUmxuu/oKBCr8c+k+upyH9enTJifX
 2dn7l/7ISnB068xou07LGDv08l1+ef8z7MZEKAAfq6FVpwU7R4bqt8o0rKCRmuvVSJSxn
 mSN9YRBy9KXWmJ8fuZuwxvPwv2FtgtRMc8XNBJqL6v1fM3TI0+NAqSo2OxFogs00jD943
 uCHKbi3D6pv9Cao5SK24i1AwWIJ62xx8hOq65zQU50Ei8IOfKROxYRkSFJATkIHEpVpFu
 gL8D8N7roFqyX6I5XDt3Jnx9meZRtz0YEJPeskBCl5atsQdlmYFSYTnykys8zy+fGLw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=cmmUWRIP; 
 arc=none smtp.remote-ip="2a01:4f8:1c0c:5073::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7506F40042
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 19:18:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 9443B1814BB; Mon, 05 Oct 2026 21:18:05 +0200 (CEST)
In-Reply-To: <87o6d83y5a.fsf@tarshish>
References: <20261005092033.925097-2-buildroot@heine.tech>
 <87o6d83y5a.fsf@tarshish>
Date: Mon, 05 Oct 2026 21:18:05 +0200
To: "Baruch Siach" <baruch@tkos.co.il>
MIME-Version: 1.0
Message-ID: <36c6339d-9ebc-1909-78fd-d3091aff24c0@heine.tech>
User-Agent: SOGoMail 5.12.11
X-Last-TLS-Session-Version: None
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/libabseil-cpp=3A__requ?=
 =?utf-8?q?ire_wchar?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

On Monday, October 05, 2026 18:33 CEST, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Michael,
> 
> On Mon, Oct 05 2026, Michael Nosthoff via buildroot wrote:
> > absl::StrFormat() unconditionally includes <cwchar>. So a toolchain
> > with wchar support is required.
> >
> > Fixes:
> > https://autobuild.buildroot.org/results/948/948463b01ce52456179b06ae17d4ace9a823f92b//
> >
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> > ---
> >  package/libabseil-cpp/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
> > index feb4963042..739e6d279e 100644
> > --- a/package/libabseil-cpp/Config.in
> > +++ b/package/libabseil-cpp/Config.in
> > @@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> >  	default y if BR2_sh
> >  	default y if BR2_sparc || BR2_sparc64
> >  	default y if BR2_x86_64
> > +	depends on BR2_USE_WCHAR
> 
> New dependencies must propagate to all reverse dependencies,
> recursively.

The added depends is on the ARCH_SUPPORTS which should already be propagated.
Maybe that's not the right place?

> 
> Also, dependencies comment below needs update.
> 
thats's right.

Michael

> baruch
> 
> >  	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
> >  	# absl/base/internal/direct_mmap.h only implements DirectMmap()
> >  	# with mmap2 for the o32 ABI on MIPS, and its 64-bit fallback
> 
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
