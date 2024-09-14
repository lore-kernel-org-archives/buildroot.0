Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BABC0219F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 15:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6631641A3A;
	Sat, 14 Sep 2024 15:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQxt_vLuUiSo; Sat, 14 Sep 2024 15:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED063419DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED063419DC;
	Sat, 14 Sep 2024 15:14:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3FC81BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A29F560780
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgfcK3D5y3Cl for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 15:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 440FD6077F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 440FD6077F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 440FD6077F
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:14:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F2C31C0002;
 Sat, 14 Sep 2024 15:14:27 +0000 (UTC)
Date: Sat, 14 Sep 2024 17:14:26 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240914171426.10f526db@windsurf>
In-Reply-To: <CA+R_depEZMghW6+r2v90xw-pqvgwx_yNOEhgkqQGrQy76NjSPg@mail.gmail.com>
References: <20240911140214.2479977-1-christian@klarinett.li>
 <20240912090246.618903-1-christian@klarinett.li>
 <CA+R_depEZMghW6+r2v90xw-pqvgwx_yNOEhgkqQGrQy76NjSPg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726326868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KX3tIGrPixSjbmyHQXqCNcrDPXz9ZCsRyS92tO5mZMk=;
 b=SqbWdLU8dXaAewcK1H3m9Ysb8MBlYB+JNYRLgpO0KUQwUjbM7wpFyq12ZoVfpcUsGqcJ1e
 EJDqz68foETSBarnjHabChFwmSt07lL4AYitE4nJwKO9vYsWnEAwE/OwUVd5bhawt6I4+D
 iBI5oT4oTDdjUHbEQxEk67IS0GyP76414kCQJhma3YCpii8Gd234VePxjIbQAtGltJARn/
 OWa0KBWWs4daiGY7H8FKhe1hNeH95M18HsK9KG/UXdhWjXzzGUS6/V800ggECG4QiaQI+3
 OvPtgi7tTMVDerG/dSd9R1HwTQq4XuK4QwuH2v+463fQzcv3BLpsHx4Lg+imUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SqbWdLU8
Subject: Re: [Buildroot] [PATCH v3] package/qt6/qt6scxml: new package
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
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>, Jesse Van Gavere <jesseevg@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

Thanks for the review! I've taken it into account when merging. See below.

On Fri, 13 Sep 2024 09:17:35 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> > diff --git a/package/qt6/qt6scxml/Config.in
> > b/package/qt6/qt6scxml/Config.in
> > new file mode 100644
> > index 0000000000..ff738bdc17
> > --- /dev/null
> > +++ b/package/qt6/qt6scxml/Config.in
> > @@ -0,0 +1,14 @@
> > +config BR2_PACKAGE_QT6SCXML
> > +       bool "qt6scxml"
> > +       help
> > +         This repository contains two relates state machine modules:
> >  
> 
> I think this is more correct:
> 
>          This package contains the following Qt modules:
> 
> 
> > +
> > +         * Qt6::StateMachine: The State Machine framework provides
> >  
> 
> Maybe indent with two spaces the bullet points and associated text. I've
> seen this in other packages.
> 
> Example from bind:
> 
> help
>  BIND (Berkeley Internet Name Domain) is an
>  implementation of the Domain Name System (DNS) protocols
>  and provides an openly redistributable reference
>  implementation of the major components of the Domain
>  Name System, including:
> 
>    * a Domain Name System server (named)
>    * a Domain Name System resolver library
>    * tools for verifying the proper operation of the DNS
>      server
> 
> Maybe drop the '::' so the name correspond to what is found in the
> documentation:
> 
>  * Qt StateMachine: The State Machine framework provides

I indeed rephrased a bit the help text. Not exactly as you suggested,
because I also made it consistent with other Qt6 packages, but
definitely took into account your suggestions.


> +           create state machines from SCXML files.
> > +
> > +         https://doc.qt.io/qt-6/qtscxml-index.html  
> 
> 
> Maybe we should also say something about the statemachine compiler tool?

I wasn't sure what to add, and it can be added as a follow-up patch if
needed.

> Some test qml files are under GPL-3.0-only. So I think it would be best to
> summarize as (buildsystem, examples, snippets)

ACK, taken into account.

> > +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> > +QT6SCXML_DEPENDENCIES += qt6declarative
> > +HOST_QT6SCXML_DEPENDENCIES += host-qt6declarative
> 
> What if we only build host-qt6scxml?

It is not possible to build just host-qt6scxml. For now, it's a
"hidden" host package, in the sense that it can only be built as a
dependency of target qt6scxml. So I think that solution was good
enough: when target qt6scxml is built with declarative support, it
needs host-qt6scxml to have been built with declarative support.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
