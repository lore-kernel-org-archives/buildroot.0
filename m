From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Jul 2021 08:21:58 +0200
Subject: [Buildroot] [PATCH 06/15] package/pkg-generic.mk: Introduce
 <PKG>_PER_PACKAGE_TWEAK_HOOKS
In-Reply-To: <20210702091855.60daf45f@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-7-herve.codina@bootlin.com>
 <20210622203909.GJ44262@scaer> <20210625092120.3f77d754@fedora>
 <20210702091855.60daf45f@bootlin.com>
Message-ID: <20210703062158.GD2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-07-02 09:18 +0200, Herve Codina spake thusly:
> On Fri, 25 Jun 2021 09:21:20 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> > On Tue, 22 Jun 2021 22:39:09 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > >  	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
> > > > +	$(foreach hook,$($(PKG)_PER_PACKAGE_TWEAK_HOOKS),$(call $(hook))$(sep))    
> > > I am going to bikeshed on the naming of this variable (which is a good
> > > sing that I am pretty much OK with the feature).
> > > I think $(2)_EARLY_PRE_CONFIGURE_HOOKS is more sensible.  
> > That's good for me.
> 
> Actions done in this hook are for package preparation.
> Yann talks about $(2)-prepare step and even if this step is not implemented as
> a buildroot step (.stamp_xxxxxx) this is really a package preparation.
> 
> Indeed, we prepare the package for the next step (retrieving dependencies files
> for per-package host and target dir) and finally we do the fixups.
> Once done, the package is ready and so we take the snapshot for overwrite
> detection.
> 
> What do you think about $(2)_POST_PREPARE_HOOKS ?

Works for me.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
