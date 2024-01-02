Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E16C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 07:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 957E9401F9;
	Tue,  2 Jan 2024 07:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 957E9401F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikMBQeNB7t4O; Tue,  2 Jan 2024 07:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A68401EE;
	Tue,  2 Jan 2024 07:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A68401EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66D361BF341
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 07:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F51B81348
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 07:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F51B81348
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PO9lybakWDZW for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 07:13:18 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4231381316
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 07:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4231381316
Received: by mail.gandi.net (Postfix) with ESMTPSA id 388D9C0002;
 Tue,  2 Jan 2024 07:13:13 +0000 (UTC)
Date: Tue, 2 Jan 2024 08:13:11 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240102081311.2aa8f0b2@booty>
In-Reply-To: <ZY9AigY5WWfIPT-m@landeda>
References: <20231227181756.156827-1-bernd@kuhls.net>
 <20231228095121.5255f937@booty> <ZY9AigY5WWfIPT-m@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704179593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=stGzX84yly0O6FJkaSkfIKwBSQtEB/1xOGKqjS37RCY=;
 b=hecy4ErhkYu5hNgzgad6mVmewI0W6/MPkRVbLrx/bSf781e2wf1iQ6oExL+006u4/L3gfb
 82h/yTYkvkUPfD/WIur6851EAvlFj9Vw72Bo16Y/w/BP+QU7caKgBxUMoqat4oiHHXyXjC
 PR9Tuk2I84s0PEdHodqiKRcXnM/GpKTp4w+usMdHvy0HS9k8U8qlUlo5mWDTbk6V9ToEwq
 YHt2DWacGddXjZUCcSxd+nshfWfvuF7O/bnQ1RAb9F3T5hVUfGeICy4j+pTOycqtVcLpXz
 oF3TJDeyTD8soCH3on/g+IsPKPxsQ3HY18dS1xpABpw6YoG21CydQOh8XSSHMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hecy4Erh
Subject: Re: [Buildroot] [PATCH 1/2] package/exim: fix build with libexecinfo
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Fri, 29 Dec 2023 22:56:26 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Bernd, Luca, All,
> 
> On 2023-12-28 09:51 +0100, Luca Ceresoli via buildroot spake thusly:
> > On Wed, 27 Dec 2023 19:17:55 +0100
> > Bernd Kuhls <bernd@kuhls.net> wrote:  
> > > Upstream added optional support for execinfo  
> [--SNIP--]
> > > @@ -126,6 +127,15 @@ ifeq ($(BR2_STATIC_LIBS),y)
> > >  EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
> > >  endif
> > >  
> > > +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> > > +EXIM_DEPENDENCIES += libexecinfo
> > > +define EXIM_EXTRALIBS
> > > +$(call exim-config-add,EXTRALIBS,-lexecinfo)
> > > +endef
> > > +else
> > > +EXIM_C_FLAGS = -DNO_EXECINFO
> > > +endif  
> > 
> > I think this logic is not entirely correct. As I read it:
> > 
> >  * on non-glibc systems it automatically enables the new exim
> >    stack dump feature if libexecinfo is enabled
> >  * on glibc systems, which always have the backtrace() and related
> >    functions without additional libraries, we never enable this feature
> > 
> > For consistency, the else branch should just be removed to avoid
> > setting NO_EXECINFO, thus enabling the stack dump feature whenever it
> > is possible.  
> 
> If I understand correctly, your proposal would not work either: for a
> non-glibc config that does not have libexecinfo eabled, we do want to
> define NO_EXECINFO.

Exactly!

> Instead, the logic should be somthong like:
> 
>     if glibc:
>         do nothing, execinfo is available
>     elif libexecinfo enabled:
>         add dependency and extra-lib
>     else:
>         define NO_EXECINFO
> 
> Since libexecinfo embedds the fact that it is also non-glibc, we can
> rewrite the condition as:
> 
>     if libexecinfo:
>         add dependency and extra-lib
>     elif non-glibc;
>         define NO_EXECINFO
> 
> So, the 'else' clause only needs to be changed into:
>     else ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)

Correct, thanks for suggesting this fix.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
