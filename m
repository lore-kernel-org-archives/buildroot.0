Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050FCC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 15:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8364E40FDE;
	Fri,  9 Dec 2022 15:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8364E40FDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hWnbjV8Pt3lM; Fri,  9 Dec 2022 15:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B92C340B78;
	Fri,  9 Dec 2022 15:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B92C340B78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF3281BF3DA
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 15:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7EE161112
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 15:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7EE161112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cPExOuHUjKCH for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 15:20:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9993A60DDF
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9993A60DDF
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 15:20:47 +0000 (UTC)
Received: from x230_1.trabucayre.com (nat-tf.ens2m.fr [194.167.45.244] (may be
 forged)) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 2B9FKies009151
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Dec 2022 16:20:44 +0100
Date: Fri, 9 Dec 2022 16:21:28 +0100
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221209162128.47e73154@x230_1.trabucayre.com>
In-Reply-To: <20221209155005.48a59bf8@windsurf>
References: <1670579823-1721-1-git-send-email-gwenj@trabucayre.com>
 <20221209155005.48a59bf8@windsurf>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH] package/gnuradio: restrict gcc to >= 9.3.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 9 Dec 2022 15:50:05 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri,  9 Dec 2022 10:57:03 +0100
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Since commit 5a15095f65c655356989c91e52da1746cd96f41b gnuradio requires
> > gcc >= 9.3.0
> > 
> > This patch add this dependency and removes BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> > dependency because it is only required for gcc < 7.
> > 
> > Also gcc restriction is required because volk needs a toolchain with a gcc > 7.
> > 
> > fix:
> > - http://autobuild.buildroot.net/results/6a82605c58f9ef9eb6c14603777dd8523dd00aa5/
> > - http://autobuild.buildroot.net/results/c7c4ae76954e388ab639b39fd521d90acfe4edc9/
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > ---
> >  package/gnuradio/Config.in | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> > index de19732cfb..2028cfb483 100644
> > --- a/package/gnuradio/Config.in
> > +++ b/package/gnuradio/Config.in
> > @@ -4,10 +4,13 @@ comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
> >  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> >  		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> >  
> > -comment "gnuradio needs a toolchain not affected by GCC bug 43744 and 64735"
> > +comment "gnuradio needs a toolchain not affected by GCC bug 43744"
> >  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
> >  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735  
> 
> You're not really removing it here :-)
Not enought cofee :-/
> 
> > +comment "gnuradio needs a gcc >= 9.3.0"
> > +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9  
> 
> This should be in the main Config.in comment:
> 
> comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 9"
> 
> Thomas

Thanks

Gwenhael
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
