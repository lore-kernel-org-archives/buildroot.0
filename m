From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 18 Jan 2015 22:52:29 +0100
Subject: [Buildroot] [PATCH v3 5/7] dtc: add host build
In-Reply-To: <20150118165109.GT4275@free.fr>
References: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
 <1421178007-11877-6-git-send-email-ps.report@gmx.net>,
 <20150118165109.GT4275@free.fr>
Message-ID: <trinity-1df4a6f5-1472-482a-af08-b1709e976bdf-1421617949223@3capp-gmx-bs51>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

> Gesendet: Sonntag, 18. Januar 2015 um 17:51 Uhr
> Von: "Yann E. MORIN" <yann.morin.1998@free.fr>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net, "Fabio Porcedda" <fabio.porcedda@gmail.com>, "Jeremy Kerr" <jk@ozlabs.org>, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Matthew Weber" <matthew.weber@rockwellcollins.com>
> Betreff: Re: [PATCH v3 5/7] dtc: add host build
>
> Peter, All,
> 
> On 2015-01-13 20:40 +0100, Peter Seiderer spake thusly:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> [--SNIP--]
> > diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> > index c01fe7b..b0e2f28 100644
> > --- a/package/dtc/dtc.mk
> > +++ b/package/dtc/dtc.mk
> > @@ -43,4 +43,14 @@ define DTC_INSTALL_TARGET_CMDS
> >  	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
> >  endef
> >  
> > +# host build
> > +define HOST_DTC_BUILD_CMDS
> > +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr
> 
> This is a host tool, you should set PREFIX=$(HOST_DIR)/usr  ...
> 

O.k. (was copy/paste from the target build command), will fix on next
patch iteration...

> > +endef
> > +
> > +define HOST_DTC_INSTALL_CMDS
> > +	$(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) PREFIX=/usr install-bin
> 
> ... ditto, and not set a DESTDIR.
>

O.k, will fix, thanks for review...

Regards,
Peter
 
> Regards,
> Yann E. MORIN.
> 
> > +endef
> > +
> >  $(eval $(generic-package))
> > +$(eval $(host-generic-package))
> > -- 
> > 2.1.2
> > 
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> 
