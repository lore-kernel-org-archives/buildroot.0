From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Aug 2012 23:17:14 +0200
Subject: [Buildroot] BR2_SOURCEFORGE_MIRROR issue in package .mk files
In-Reply-To: <5033F5D8.2090706@petroprogram.com>
References: <CAJkQPO=k7cmM46OXekN1s6n-Whk8_AG5hs37Q=ELgvzoVOj8XA@mail.gmail.com>
 <201208212204.55029.yann.morin.1998@free.fr>
 <5033F5D8.2090706@petroprogram.com>
Message-ID: <201208212317.14834.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Tuesday 21 August 2012 22:55:52 Stefan Fr?berg wrote:
> 21.8.2012 23:04, Yann E. MORIN kirjoitti:
[--SNIP--]
> > In buildroot, it could be written thus:
> > BOOST_SITE = sf://boost/boost/$(BOOST_VERSION)
> >
> > with 'sf://' automatically turned by the pkg-infa into the canonical SF
> > download base URL:
> >   http://downloads.sourceforge.net/project/
> >
> > and thus giving the full URL:
> >   http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)/$(BOOST_SOURCE)
> Thank you!
> 
> That sf:// thing did not work for me

Of course not! Maybe I was not clear, but that was *only* a suggestion! ;-)

> but I tried this with libpng and
> changed LIBPNG_SITE to:
> 
> LIBPNG_SITE =
> http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/${LIBPNG_VERSION}
[--SNIP--]
> Works nicely !  :-)

What's even better, is that downloads.sf.net should pick a mirror that is
near to you (in terms of network), and that is not over-loaded. So I think
it would better to use than use a fixed mirror.

I'll submit a patch shortly to switch all packages to use that. I'll even
see if I can implement my sf:// scheme, just as a proof-of-concept. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
