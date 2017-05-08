From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 May 2017 23:16:03 +0200
Subject: [Buildroot] [PATCH v3 1/2] rhash: new package
In-Reply-To: <20170508173456.fep2syi43cvqs7ul@tarshish>
References: <20170508170007.13923-1-Vincent.Riera@imgtec.com>
 <20170508173456.fep2syi43cvqs7ul@tarshish>
Message-ID: <20170508211603.GB3544@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, Baruch, All,

On 2017-05-08 20:34 +0300, Baruch Siach spake thusly:
> Hi Vicente,
> 
> On Mon, May 08, 2017 at 06:00:06PM +0100, Vicente Olivert Riera wrote:
> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > ---
> > Changes v2 -> v3:
> > - Nothing
> > Changes v1 -> v2:
> > - rename package to rhash
> > - take the help text of the library instead of the console utility
> > - sub-config option for the rhash binary starts with the package name
> > - conditionals for shared/static/shared-static reordered
> > - put make options into a make_opts variable
> > - install the console utility to staging as well
> >   (All suggestions by Arnout)
> 
> [...]
> 
> > +ifeq ($(BR2_PACKAGE_RHASH_BIN),y)
> > +define RHASH_INSTALL_RHASH_BIN
> > +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> > +		DESTDIR="$(STAGING_DIR)" $(RHASH_MAKE_OPTS) install-shared
> 
> You mention above that Arnout suggested to install the binaries to staging. 
> But this is quite unusual. A comment explaining the reason for that would be 
> nice.

And please do so in a post-staging-install hook, not in the post-target-install
hook.

Regards,
Yann E. MORIN.

> > +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> > +		DESTDIR="$(TARGET_DIR)" $(RHASH_MAKE_OPTS) install-shared
> > +endef
> > +RHASH_POST_INSTALL_TARGET_HOOKS += RHASH_INSTALL_RHASH_BIN
> > +endif
> > +
> > +$(eval $(generic-package))
> 
> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
