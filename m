From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jun 2018 18:00:30 +0200
Subject: [Buildroot] [PATCH] shadowsocks-libev: new package
In-Reply-To: <20180604120908.0f340f5e@windsurf>
References: <20180604071626.17528-1-xuminready@gmail.com>
 <20180604120908.0f340f5e@windsurf>
Message-ID: <20180604160030.GC3700@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Min, Thomas, All,

On 2018-06-04 12:09 +0200, Thomas Petazzoni spake thusly:
> On Mon,  4 Jun 2018 00:16:26 -0700, Min Xu wrote:
[--SNIP--]
> > diff --git a/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch b/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch
> > new file mode 100644
> > index 0000000..64dda02
> > --- /dev/null
> > +++ b/package/shadowsocks-libev/0001-docs-add-BSD-3-Clause-licence.patch
> > @@ -0,0 +1,52 @@
> > +From 0047295445c499e010706598c50f1bff8b0d632c Mon Sep 17 00:00:00 2001
> > +From: Min Xu <xuminready@gmail.com>
> > +Date: Wed, 30 May 2018 13:16:12 -0700
> > +Subject: [PATCH] docs: add BSD-3-Clause licence
> > +
> > +add missing licence for shadowsocks-libev/libipset
> > +
> > +Signed-off-by: Min Xu <xuminready@gmail.com>
> 
> I'm still not entirely convinced by a patch adding a license file. It
> would definitely be useful to convince upstream to add this license
> file, but I'm not sure we want to carry patches in Buildroot adding
> license files.
> 
> Peter, Arnout, Yann, any comment on this ?

I agree with Thomas here: do not add a license file ourselves (unless we
backport an upstream commit, in which case the patch should say so).

If the package does not have a license file, then just include a source
file, preferrably a prominent one like main.c or whatever.

And above all, better no information that bad information. So, don;t add
the license file.

Regards,
Yann E. MORIN.

> > +SHADOWSOCKS_LIBEV_VERSION = 3.2.0
> > +SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
> > +SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause(libbloom), BSD-3-Clause(libcork, libipset)
> > +SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING libipset/LICENSE.txt
> > +SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
> > +SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
> > +SHADOWSOCKS_LIBEV_CONF_OPTS = --disable-documentation --with-pcre=$(STAGING_DIR)/usr
> 
> --disable-documentation is already passed by the autotools-package
> infrastructure, so it isn't needed.
> 
> Besides those minor issues, the rest looks good to me. Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
