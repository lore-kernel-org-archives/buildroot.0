From: Julien Viard de Galbert <julien.viarddegalbert@openwide.fr>
Date: Wed, 15 Jul 2015 09:43:26 +0200 (CEST)
Subject: [Buildroot] [PATCH v3] dieharder: new package
In-Reply-To: <20150711074344.GA7573@free.fr>
Message-ID: <733231957.3059218.1436946206315.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I've been moving and still need to wait to get internet access at
the new home, so this will take some time, but yes, I think it's
better to upstream patches than work on our side.

Also I'm not sure how soon I'll be able to work on this, I will
keep all your emails and review them all at that time.

Best regards,

Julien
----- Mail original -----
> De: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ?: "Romain Naour" <romain.naour@openwide.fr>
> Cc: "Julien Viard de Galbert" <julien@vdg.name>, buildroot at buildroot.org, "julien viarddegalbert"
> <julien.viarddegalbert@openwide.fr>
> Envoy?: Samedi 11 Juillet 2015 09:43:44
> Objet: Re: [Buildroot] [PATCH v3] dieharder: new package
> 
> Julien, Romain, All,
> 
> On 2015-07-11 01:10 +0200, Romain Naour spake thusly:
> > Le 17/05/2015 09:43, julien.viarddegalbert at openwide.fr a ?crit :
> > > From: Julien Viard de Galbert <julien@vdg.name>
> > > 
> > > Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> [--SNIP--]
> > > diff --git a/package/dieharder/dieharder.mk
> > > b/package/dieharder/dieharder.mk
> > > new file mode 100644
> > > index 0000000..2a3d46b
> > > --- /dev/null
> > > +++ b/package/dieharder/dieharder.mk
> > > @@ -0,0 +1,26 @@
> > > +################################################################################
> > > +#
> > > +# dieharder
> > > +#
> > > +################################################################################
> > > +
> > > +DIEHARDER_VERSION = 3.31.1
> > > +DIEHARDER_SITE = http://www.phy.duke.edu/~rgb/General/dieharder/
> > > +DIEHARDER_SOURCE = dieharder-$(DIEHARDER_VERSION).tgz
> > > +DIEHARDER_SUBDIR = dieharder-$(DIEHARDER_VERSION)
> > > +DIEHARDER_LICENSE = GPLv2b
> > > +DIEHARDER_LICENSE_FILES = $(DIEHARDER_SUBDIR)/COPYING
> > > +DIEHARDER_DEPENDENCIES = gsl
> > > +
> > > +DIEHARDER_CONF_OPTS = --includedir=$(STAGING_DIR)/usr/include
> > > +# fix endiannes detection
> > > +ifeq ($(BR2_ENDIAN),"BIG")
> > > +DIEHARDER_CONF_OPTS += ac_cv_c_endian=big
> > > +else
> > > +DIEHARDER_CONF_OPTS += ac_cv_c_endian=little
> > > +endif
> > 
> > There is a build issue with musl libc due to missing M_PI when
> > _GNU_SOURCE is
> > not defined.
> > 
> > I suggest you add it in CFLAGS by using DIEHARDER_MAKE_OPTS:
> > 
> > DIEHARDER_MAKE_OPTS = CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
> 
> Better yet: patch dieharder to define it in the source, and submit
> that
> patch upstream.
> 
> Regards,
> Yann E. MORIN.
> 
> > Don't forget to take into account Thomas's comment for the next
> > version ;-)
> > 
> > Best regards,
> > Romain
> > 
> > > +
> > > +# parallel build fail, disable it
> > > +DIEHARDER_MAKE=$(MAKE1)
> > > +
> > > +$(eval $(autotools-package))
> > > 
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> |  conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
> |               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/
> |  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> |   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Julien Viard de Galbert       // `` OPEN WIDE    23-25 Rue Daviel
Responsable des op?rations    \\//  Ing?nierie   75013 Paris - France
julien.viarddegalbert at openwide.fr                +33 (0)1 42 68 28 11
Open Wide Ing?nierie                           ingenierie.openwide.fr
Open Wide vid?o avanc?es                 video.ingenierie.openwide.fr
Blog des technologies libres et embarqu?es       www.linuxembedded.fr
