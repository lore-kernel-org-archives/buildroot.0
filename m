From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Feb 2018 21:07:23 +0100
Subject: [Buildroot] [PATCH 1/1] qt5webkit: add missing icu dependency
In-Reply-To: <20180211144926.jgne5lnzvlmoeq75@archlinux>
References: <20180211020330.32658-1-gael.portay@savoirfairelinux.com>
 <20180211101445.51c63dab@windsurf.lan>
 <20180211144926.jgne5lnzvlmoeq75@archlinux>
Message-ID: <20180212210723.5148adca@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Feb 2018 09:49:26 -0500, Ga?l PORTAY wrote:

> > Therefore, I don't see how you can fall into the situation where the
> > qt5webkit build is started without icu being already built.
> > 
> > Could you explain ?
> >   
> 
> Well, I do not remember exactly the situation :/
> 
> It happened in development. I assume I had a qtbase already build
> (certainly without ICU support). And then, I build qtwebkit running
> `make qt5webkit`, the issue happened.
> 
> BTW, I made a quick look to qtwebkit, and it does not seem to call some
> Qt ICU symbols. It looks qtwebkit requires ICU for its own needs.

If that is truly the case, then qtwebkit should not select
BR2_PACKAGE_QT5BASE_ICU. Can you try to make a build with qt5webkit
enabled, but BR2_PACKAGE_QT5BASE_ICU disabled, and see what happens ?

Perhaps this select BR2_PACKAGE_QT5BASE_ICU needs to be turned into a
select BR2_PACKAGE_ICU + icu in QT5WEBKIT_DEPENDENCIES. Of course, make
sure to verify for Qt 5.6 and Qt 5.9. I hope you have some decent build
machines, because building qt5webkit is very long :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
