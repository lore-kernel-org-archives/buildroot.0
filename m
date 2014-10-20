From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 19:50:11 +0200
Subject: [Buildroot] [PATCH 1/2] libupnpp: new package
In-Reply-To: <20141020174327.GG3742@free.fr>
References: <1413813009-20149-1-git-send-email-jkrause@posteo.de>
 <20141020174327.GG3742@free.fr>
Message-ID: <20141020175011.GI3742@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2014-10-20 19:43 +0200, Yann E. MORIN spake thusly:
> On 2014-10-20 15:50 +0200, J?rg Krause spake thusly:
> > Signed-off-by: J?rg Krause <jkrause@posteo.de>
> [--SNIP--]
> > diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
> > new file mode 100644
> > index 0000000..5a79452
> > --- /dev/null
> > +++ b/package/libupnpp/Config.in
> > @@ -0,0 +1,20 @@
> > +config BR2_PACKAGE_LIBUPNPP
> > +	bool "libupnpp"
> > +	select BR2_PACKAGE_EXPAT
> > +	select BR2_PACKAGE_LIBCURL
> > +	select BR2_PACKAGE_LIBUPNP
> > +	depends on BR2_INSTALL_LIBSTDCPP
> > +	depends on BR2_LARGEFILE # libupnp
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
> > +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
> > +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
> > +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
> 
> Nice! It proves you did quite some testing! :-)

I withdraw that comment: the dependencies were copied as-is from
upmpdcli. Are they still required for libupnpp?

> > +	help
> > +	  The libupnpp C++ library wraps libupnp for easier use by upmpdcli and
> > +	  upplay.
> > +
> > +	  http://www.lesbonscomptes.com/upmpdcli/
> > +
> > +comment "upmpdcli needs a toolchain w/ C++, largefile, threads"
> 
> 'upmpdcli', really?
> 
> Otherwise, looks good. With the above mishap fixed, you can add my:
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Sorry, I withdraw my rev tag, because of the above. That's what you get
by not reviewing the whole series before replying to a patch...
Sorry... :-(

J"org, that does not mean this is faulty, I just wnat to have an answer
to the above before I can give my rev tag.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
