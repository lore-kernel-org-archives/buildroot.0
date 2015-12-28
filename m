From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Dec 2015 21:49:17 +0100
Subject: [Buildroot] [PATCH 2/2] package/jack2: add missing optional
 dependencies
In-Reply-To: <20151228214245.7b727b44@free-electrons.com>
References: <cover.1451329553.git.yann.morin.1998@free.fr>
 <5f7632a3d6ed3e3ab0f324e31be21a0ea18245d4.1451329553.git.yann.morin.1998@free.fr>
 <20151228214245.7b727b44@free-electrons.com>
Message-ID: <20151228204917.GB3446@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-28 21:42 +0100, Thomas Petazzoni spake thusly:
> On Mon, 28 Dec 2015 20:08:55 +0100, Yann E. MORIN wrote:
> > +ifeq ($(BR2_PACKAGE_OPUS),y)
> > +JACK2_DEPENDENCIES += opus
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_READLINE),y)
> > +JACK2_DEPENDENCIES += readline
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_EIGEN),y)
> > +JACK2_DEPENDENCIES += eigen
> > +endif
> 
> I'm fine with the opus and readline dependencies. But for the eigen
> dependency, I'm not so sure. linux/wscript defines HAVE_EIGEN3 is eigen
> is available. And this symbol is not used anywhere in the jack2 source
> code... So it seems like eigen is a useless dependency.

OK, I just based my analysis on the output of the waf configure command,
which just reported a missing eigen before this patch, and found it with
this patch.

However, after your comment I looked at what eigen was used for. It is
only used in cunjunction with gtkiostream to provide the IIO backend.

But we don't have gtkiostream (and it's not even in dDebian or Ubuntu!),
so indeed the eigen dependency is useless in our case.

I'll fix and respin.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
