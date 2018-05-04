From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Fri, 4 May 2018 06:27:02 +0000
Subject: [Buildroot] [PATCH] dropbear: Do not build static binary
In-Reply-To: <20180503180853.2473u472dvxhvwkn@tarshish>
References: <20180503114701.9452-1-stefan.sorensen@spectralink.com>
 <20180503114701.9452-2-stefan.sorensen@spectralink.com>
 <20180503180853.2473u472dvxhvwkn@tarshish>
Message-ID: <06a47e87f804576dc13ab3c33a8f9239cc318d9e.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2018-05-03 at 21:08 +0300, Baruch Siach wrote:
> > -ifeq ($(BR2_STATIC_LIBS),y)
> > -DROPBEAR_CONF_OPTS += --enable-static
> > -endif
> > +# The generic --enable-static flags is only intended for use when
> > building
> > +# libraries, but dropbear will be built as a static executeable
> > with this
> > +# flag, so we overide it here
> > +DROPBEAR_CONF_OPTS += --disable-static
> 
> You add --disable-static unconditionally, but we do want to build
> statically 
> when BR2_STATIC_LIBS=y. So maybe add --disable-static only for 
> BR2_SHARED_STATIC_LIBS=y to counter the effect of --enable-static
> that Buildroot adds automatically. Would that work for you?

The --disable-static causes dropbear to do nothing, i.e. just do a
normal link, so that will also work with BR2_STATIC_LIBS=y.

Stefan
