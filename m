From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 00:15:25 +0200
Subject: [Buildroot] [PATCH 12 of 15] pkg-generic: add checks on
 deprecated variables FOO_BAR_OPT
In-Reply-To: <20141004191415.4db579ee@free-electrons.com>
References: <patchbomb.1411846357@localhost>
 <27f6b6064904e682eccc.1411846369@localhost>
 <20141004191415.4db579ee@free-electrons.com>
Message-ID: <20141004221525.GA22416@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2014-10-04 19:14 +0200, Thomas Petazzoni spake thusly:
> On Sat, 27 Sep 2014 21:32:49 +0200, Thomas De Schampheleire wrote:
> 
> > +# Ensure unified variable name conventions between all packages
> > +$(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_STAGING_OPT,$(2)_INSTALL_STAGING_OPTS))
> > +$(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_OPTS))
> > +$(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
> > +$(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
> > +$(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
> > +$(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
> > +$(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
> 
> I think the legacy variable checking should go to the respective
> package infrastructure they belong to: AUTORECONF_OPT and
> GETTEXTIZE_OPT should go to pkg-autotools.mk, KCONFIG_OPT to
> pkg-kconfig.mk, etc.
> 
> The pkg-generic.mk infrastructure doesn't know anything about those
> variables, so there's no reason to have those checks at this level.

I agree on principle.

However, having all of them right here avoids duplication. For example:
  - $(2)_BUILD_OPT was valid for lua, perl and python packages,
  - $(2)_CONF_OPT was valid for autotools, cmake and perl packages,
  - ...

Would you find appropriate that the checks be duplicated in all of the
impacted infras?

Note: I don't mind either way, just inquiring.

> Care to cook a followup patch fixing that?

I can have a spin at it tomorrow, unless Thomas DS is not completely fed
up with this series! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
