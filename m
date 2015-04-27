From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 27 Apr 2015 21:02:56 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/swupdate: new package
In-Reply-To: <20150425102232.GB4275@free.fr>
References: <1429916563-20332-1-git-send-email-joerg.krause@embedded.rocks>
 <20150425102232.GB4275@free.fr>
Message-ID: <1430161376.1537.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sa, 2015-04-25 at 12:22 +0200, Yann E. MORIN wrote:
> J?rg, All,
> 

[snip]

> 
> We prefer to point to the homepage when it exists, rather than to the
> git tree:
>     https://sbabic.github.io/swupdate/

Ok.

> 
> > +if BR2_PACKAGE_SWUPDATE
> > +
> > +config BR2_PACKAGE_SWUPDATE_CONFIG
> > +   string "swupdate configuration file"
> > +   default "package/swupdate/swupdate.config"
> > +   help
> > +     The default swupdate configuration file will enable 
> > swupdate with
> > +     an image downloader and a webserver, as well as 
> > handlers for UBI
> > +     volumes, raw NAND or NOR flash, SD cards and shell 
> > scripts.
> > +
> > +     Most people will just use the default swupdate 
> > configuration file.
> > +     However, some people may wish to use their own modified 
> > swupdate
> > +     configuration file, and will specify their config file 
> > location
> > +     with this option.
> > +
> > +     Note that if you add lua support in the configuration 
> > file you need
> > +     the Lua 5.2 interpreter (BR_PACKAGE_LUA_5_2) manually.
> 
> Something's weird in this sentence. What about:
> 
>     Note that if you add lua support in the configuration file, you 
> will
>     have to enable the Lua 5.2 interpreter (BR_PACKAGE_LUA_5_2).

Ok.

> 
> [--SNIP--]
> > diff --git a/package/swupdate/swupdate.mk 
> > b/package/swupdate/swupdate.mk
> > new file mode 100644
> > index 0000000..71ae888
> > --- /dev/null
> > +++ b/package/swupdate/swupdate.mk
> > @@ -0,0 +1,53 @@
> > +##################################################################
> > ##############
> > +#
> > +# swupdate
> > +#
> > +##################################################################
> > ##############
> > +
> > +SWUPDATE_VERSION = c68f02320858f89f2d441ff2057d49489fb6f586
> > +SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
> > +SWUPDATE_LICENSE = GPLv2+
> 
> In fact, there are a few other licenses. For example, the copies of
> Mongoose and lsqlite3 they bundle are MIT; the sqlite3 aggregated 
> source
> file is public domain ("The author disclaims copyright to this source
> code.").

I see. So I'll add MIT and Public Domain, right?

> > +SWUPDATE_LICENSE_FILES = COPYING
> > +
> > +# swupdate bundles its own mongoose and lsqlite3 versions
> 
> Is it possible to make it use external versions, or does it only 
> support
> using its bundled ones?
> 
> If that's possible, we prefer that.

swupdate bundles with mongoose 3.8 (2013) and lsqlite3 0.8 (2011)
versions. I'm not sure it will work with recent versions.

Best regards
J?rg Krause
