From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 23:58:53 +0200
Subject: [Buildroot] [PATCH] Add package linux-pam (resending,
 fixed indentation, mentioned website)
In-Reply-To: <20120720224538.189830cc@skate>
References: <1342647267-20745-1-git-send-email-golubovsky@gmail.com>
 <20120720224538.189830cc@skate>
Message-ID: <20120720235853.70d901ff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 22:45:38 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> > +define LINUX_PAM_DISABLE_INNETGR
> > +	echo >>$(@D)/config.h
> > +	echo "#undef HAVE_RUSEROK">>$(@D)/config.h
> > +	echo "#define HAVE_RUSEROK_AF">>$(@D)/config.h
> > +	echo "#define ruserok_af(a, b, c, d, e) (-1)" >>$(@D)/config.h
> > +	echo "#undef innetgr">>$(@D)/config.h
> > +	echo "#define innetgr(a, b, c, d) 0" >>$(@D)/config.h
> > +	echo "all:" >$(@D)/doc/Makefile
> > +	echo "" >>$(@D)/doc/Makefile
> > +	echo "install:" >>$(@D)/doc/Makefile
> > +	echo "" >>$(@D)/doc/Makefile
> > +endef
> 
> Can you add a comment above this justifying why this is needed?

Also, isn't there a nicer way of doing that? Like applying a nice patch
to linux-pam instead?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
