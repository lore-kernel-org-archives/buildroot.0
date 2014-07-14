From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2014 12:16:48 +0200
Subject: [Buildroot] PACKAGE_USERS does not work
In-Reply-To: <53C3AC5F.9090404@posteo.de>
References: <i5np0ra770dn4ujwdmsweh48.1405067942517@email.android.com>
 <CAJtjsKbLN1-yEkBq=cCsoaOx_n+LUYof1P51T3wzOupaxR75JQ@mail.gmail.com>
 <53BFE547.70600@posteo.de> <20140711203733.GE3739@free.fr>
 <53C3AC5F.9090404@posteo.de>
Message-ID: <20140714101648.GA3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2014-07-14 12:09 +0200, J?rg Krause spake thusly:
> On 07/11/2014 10:37 PM, Yann E. MORIN wrote:
> >On 2014-07-11 15:23 +0200, J?rg Krause spake thusly:
> >BTW, it also depends on expat.
> 
> I am unsure of the necessary dependencies. The author of the package stated
> that it only depends on libupnp and libmpdclient.
> 
> I added host-pkgconf because I saw it on other package makefiles. Do I need
> it here?

It is easy to check if a package requires host-pkgconf:
    grep PKG_CHECK_MODULES configure.ac

If it returns something, then you need host-pkgconf; otherwise, you
don't.

> Why do you suggest expat?

Because I tried to build upmpdcli, and it barfed because expat was not
available. ;-)

That being said, expat is not the only library providing XML parsing,
maybe it can use libxml2, too, but I did not check. The last message for
the failed configure was about missing expat, so I just added that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
