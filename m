From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 May 2016 11:37:26 +0200
Subject: [Buildroot] [PATCH 3/3] swupdate: bump to version 2016.04
In-Reply-To: <1462178921.5359.5.camel@embedded.rocks>
References: <1461916620-5170-1-git-send-email-joerg.krause@embedded.rocks>
 <1461916620-5170-4-git-send-email-joerg.krause@embedded.rocks>
 <20160501224841.396f3844@free-electrons.com>
 <1462178921.5359.5.camel@embedded.rocks>
Message-ID: <20160502113726.66942fc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 02 May 2016 10:48:41 +0200, J?rg Krause wrote:

> > > ?* Remove comment about bundled lsqlite3, it has been removed.
> > > ?* Remove upstream patches:
> > > ????- "Kbuild: Fix link error for CONFIG_UBOUT and missing libz"
> > > [1]
> > > ????- "Kbuild: Link with GCC instead of LD" [2]
> > > ?* Add patch from upstream:
> > > ????- "Fix build without MTD support" [3]
> > > ?* Add optional dependency for libarchive
> > > ?* Add optional dependency for uboot-tools
> > > ?* Lua support is not restricted to Lua 5.2
> > > 
> > > [1] https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d5
> > > 8ffaee924bb8e6a51e1
> > > [2] https://github.com/sbabic/swupdate/commit/f26577423eb65728fcd10
> > > f78f9978dd07d51dcb9
> > > [3] https://github.com/sbabic/swupdate/commit/69c0e66994f01ce1bf229
> > > 9fbce86aee7a1baa37b
> > > 
> > > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>  
> >   
> > > ?	??* Select BR2_PACKAGE_ZLIB if you want to deal with gzip
> > > compressed
> > > ?	????archives.
> > > +	??* Select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV and
> > > BR2_PACKAGE_ZLIB to
> > > +	????add support for setting the U-Boot environment.  
> > 
> > But in the .mk file itself you're setting HAVE_LIBUBOOTENV=y as soon
> > as
> > BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV=y, even if BR2_PACKAGE_ZLIB is
> > disabled. Isn't that somewhat inconsistent?  
> 
> No. It's not about enable U-Boot support, but setting the available
> libraries through the environment. With this, swupdates KConfig checks
> for?HAVE_LIBUBOOTENV and?HAVE_ZLIB to enable U-Boot support.

Hum, ok, makes sense. Thanks for the explanation. Can you respin a
patch series with the other comments addressed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
