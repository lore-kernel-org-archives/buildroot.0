From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 21:21:30 +0200
Subject: [Buildroot] [PATCH v4,
 1/1] package/uacme: don't allow mbedtls with ualpn
In-Reply-To: <20200426141309.61837b4f@windsurf.home>
References: <20200426110534.1758730-1-fontaine.fabrice@gmail.com>
 <20200426113639.GA5035@scaer>
 <20200426141309.61837b4f@windsurf.home>
Message-ID: <20200426192130.GD28666@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-26 14:13 +0200, Thomas Petazzoni spake thusly:
> On Sun, 26 Apr 2020 13:36:39 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > > +choice
> > > +	prompt "Crypto Backend"
> > > +	help
> > > +	  Select crypto library to be used in uacme.
> > > +
> > > +config BR2_PACKAGE_UACME_GNUTLS
> > > +	bool "gnutls"
> > > +	depends on BR2_PACKAGE_GNUTLS
> > > +
> > > +config BR2_PACKAGE_UACME_MBEDTLS
> > > +	bool "mbedtls"
> > > +	depends on BR2_PACKAGE_MBEDTLS
> > > +	depends on !BR2_PACKAGE_UACME_UALPN
> > > +
> > > +comment "mbedtls crypto backend unavailable with ualpn"
> > > +	depends on BR2_PACKAGE_MBEDTLS
> > > +	depends on BR2_PACKAGE_UACME_UALPN
> > > +
> > > +config BR2_PACKAGE_UACME_OPENSSL
> > > +	bool "openssl"
> > > +	depends on BR2_PACKAGE_OPENSSL
> > > +
> > > +endchoice  
> > Sorry, but this is still not correct: enable mbedtls, then enable uacme
> > and ualpn: there is no crypto backend selectable in the choice...
> Do we need a choice in the first place ?

We already have a few packages (libcurl, libssh, libssh2) that have a
choice for the crypto backend, so why not for uacme?

Yes, the above are all libraries, but that is not much different for an
application I believe.

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
