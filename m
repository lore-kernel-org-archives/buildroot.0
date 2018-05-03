From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:27:48 +0200
Subject: [Buildroot] [PATCH v3 4/9] package/screen: add /usr/bin/screen
 to /etc/shells
In-Reply-To: <20180203145848.GE2369@scaer>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
 <1516356909-18620-5-git-send-email-romain.naour@smile.fr>
 <20180203145848.GE2369@scaer>
Message-ID: <20180503232748.40be93cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 3 Feb 2018 15:58:48 +0100, Yann E. MORIN wrote:

> > diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> > index 8d67c04..37d4336 100644
> > --- a/package/screen/screen.mk
> > +++ b/package/screen/screen.mk
> > @@ -17,7 +17,14 @@ SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
> >  define SCREEN_INSTALL_SCREENRC
> >  	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
> >  endef
> > -  
> 
> Spurious empty line removal.

Indeed, but I believe it's fairly OK, as it allows the hook addition
below to follow the coding style. I've updated the commit log to
include the following paragraph:

    While at it, drop an empty line between an existing hook definition
    and its registration, to be consistent with the coding style used in
    the rest of Buildroot.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
