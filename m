From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 9 Aug 2016 22:22:51 +0200
Subject: [Buildroot] [PATCH 2/9] execline: new package
In-Reply-To: <20160809100912.0f7738b3@free-electrons.com>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1470690140-18803-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20160809100912.0f7738b3@free-electrons.com>
Message-ID: <20160809222251.1e58104e@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le Tue, 9 Aug 2016 10:09:12 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> On Mon,  8 Aug 2016 23:02:13 +0200, Eric Le Bihan wrote:
> > This package provides execline, a (non-interactive) scripting
> > language, like sh, used in the s6 supervision system.
> > 
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> >  package/Config.in               |  1 +
> >  package/execline/Config.in      | 15 +++++++++
> >  package/execline/Config.in.host |  7 +++++  
> 
> Why do we need an option visible in menuconfig to enable this as a
> host package? Why do we need the host package at all?

I made the host variant of execline visible in menuconfig so the end
user knows it can be used to write post-build script (same goes for
the host variant of s6-rc). Anyway, if this is supefluous, I will remove
it.

> > +define EXECLINE_CONFIGURE_CMDS
> > +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure
> > $(EXECLINE_CONFIGURE_OPTS)) +endef
> > +
> > +define EXECLINE_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
> > +endef
> > +
> > +define EXECLINE_INSTALL_TARGET_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR)
> > install  
> 
> You're using MAKE1 to build the target variant, but MAKE to build the
> host variant. Is this expected?

This looks like a copy paste/error...

Best regards,

-- 
ELB
