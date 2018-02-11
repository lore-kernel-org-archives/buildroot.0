From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 11 Feb 2018 09:49:26 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webkit: add missing icu dependency
In-Reply-To: <20180211101445.51c63dab@windsurf.lan>
References: <20180211020330.32658-1-gael.portay@savoirfairelinux.com>
 <20180211101445.51c63dab@windsurf.lan>
Message-ID: <20180211144926.jgne5lnzvlmoeq75@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Feb 11, 2018 at 10:14:45AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 10 Feb 2018 21:03:30 -0500, Ga?l PORTAY wrote:
> 
> > The Config.in is already selecting BR2_PACKAGE_QT5BASE_ICU but the
> > dependency is missing from the QT5WEBKIT_DEPENDENCIES list in
> > qt5webkit.mk.
> 
> And qt5base.mk has:
> 
> QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
> 
> and in turn, qt5webkit depends on qt5base.
> 

Good catch !

> Therefore, I don't see how you can fall into the situation where the
> qt5webkit build is started without icu being already built.
> 
> Could you explain ?
> 

Well, I do not remember exactly the situation :/

It happened in development. I assume I had a qtbase already build
(certainly without ICU support). And then, I build qtwebkit running
`make qt5webkit`, the issue happened.

BTW, I made a quick look to qtwebkit, and it does not seem to call some
Qt ICU symbols. It looks qtwebkit requires ICU for its own needs.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Gael
