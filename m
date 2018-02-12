From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 12 Feb 2018 15:54:53 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webkit: add missing icu dependency
In-Reply-To: <20180212210723.5148adca@windsurf.lan>
References: <20180211020330.32658-1-gael.portay@savoirfairelinux.com>
 <20180211101445.51c63dab@windsurf.lan>
 <20180211144926.jgne5lnzvlmoeq75@archlinux>
 <20180212210723.5148adca@windsurf.lan>
Message-ID: <20180212205453.fsrnoodvtoxe6jp4@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Feb 12, 2018 at 09:07:23PM +0100, Thomas Petazzoni wrote:
> > BTW, I made a quick look to qtwebkit, and it does not seem to call some
> > Qt ICU symbols. It looks qtwebkit requires ICU for its own needs.
> 
> If that is truly the case, then qtwebkit should not select
> BR2_PACKAGE_QT5BASE_ICU. Can you try to make a build with qt5webkit
> enabled, but BR2_PACKAGE_QT5BASE_ICU disabled, and see what happens ?
> 
> Perhaps this select BR2_PACKAGE_QT5BASE_ICU needs to be turned into a
> select BR2_PACKAGE_ICU + icu in QT5WEBKIT_DEPENDENCIES. Of course, make
> sure to verify for Qt 5.6 and Qt 5.9. I hope you have some decent build
> machines, because building qt5webkit is very long :)
> 

Fore sure! I already have a patch for this :) I need to find time to
test it and make sure it still works without QT5 ICU.

Hopefuly, I have access to a powerful machine now. I get the output
within the next 1 hour.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com

Regards,
Gael
