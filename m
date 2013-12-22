From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 21:52:56 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 10/10] manual: adding
 packages luarocks
In-Reply-To: <20131222200218.GC3360@free.fr>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-10-git-send-email-francois.perrad@gadz.org>
 <20131222200218.GC3360@free.fr>
Message-ID: <20131222205256.GF27858@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois, All,

On 2013-12-22 21:02 +0100, Yann E. MORIN spake thusly:
> On 2013-11-15 14:07 +0100, Francois Perrad spake thusly:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  docs/manual/adding-packages-luarocks.txt |   91 ++++++++++++++++++++++++++++++
> >  docs/manual/adding-packages.txt          |    2 +
> >  2 files changed, 93 insertions(+)
> >  create mode 100644 docs/manual/adding-packages-luarocks.txt
> > 
> > diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
> > new file mode 100644
> > index 0000000..a2e5559
> > --- /dev/null
> > +++ b/docs/manual/adding-packages-luarocks.txt
> > @@ -0,0 +1,91 @@
> > +// -*- mode:doc; -*-
> > +// vim: set syntax=asciidoc:
> > +
> > +Infrastructure for LuaRocks-based packages
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +[[luarocks-package-tutorial]]
> > +
> > ++luarocks-package+ tutorial
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +First, let's see how to write a +.mk+ file for a LuaRocks-based package,
> > +with an example :
> > +
> > +------------------------
> > +01: ################################################################################
> > +02: #
> > +03: # luafoo
> > +04: #
> > +05: ################################################################################
> > +06:
> > +07: LUAFOO_VERSION = 1.0.2-1
> 
> I wonder if we should not split this in two:
>   - LUAFOO_VERSION: the version of the package itself, as released by
>     upstream
>   - LUAFOO_ROCKS_VERSION: the version of the LuaRocks packaging
> 
> Then, the ifnrastrucutre would just concatenate the two version strings.
> In my opinion, I think this is better to separate them: it makes it
> explixit what the package version is, and what the packaging version is.

Since I just forgot to do it, I'll let you implement it on your side if
you agree with that. ;-)

> > +08: LUAFOO_DEPENDENCIES = foo
> > +09:
> > +10: LUAFOO_BUILD_OPT += FOO_INCDIR=$(STAGING_DIR)/usr/include
> > +11: LUAFOO_BUILD_OPT += FOO_LIBDIR=$(STAGING_DIR)/usr/lib
> 
> I wonder if those two are good example of _BUILD_OPT, since they are
> (probably) already handled by the LuaRocks infrastrucutre.
> 
> And since no converted Lua package so far needed any of the above, and
> the build was successfull on my machine (not run-time tested, though), I
> guess they are not needed.
> 
> Maybe a very generic exampel should be used, such as:
>     LUAFOO_BUILD_OPT += --enable-option

Francois, care to provide a proper example of a _BUILD_OPT ?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
