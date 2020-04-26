From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 Apr 2020 14:30:04 +0200
Subject: [Buildroot] [PATCH v4,
 1/1] package/uacme: don't allow mbedtls with ualpn
In-Reply-To: <20200426141309.61837b4f@windsurf.home>
References: <20200426110534.1758730-1-fontaine.fabrice@gmail.com>
 <20200426113639.GA5035@scaer> <20200426141309.61837b4f@windsurf.home>
Message-ID: <CAPi7W80pWfiaoxoC4rYKv8Bj87s9TU0URBGKwXYxDU-ssNNn_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 26 avr. 2020 ? 14:13, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sun, 26 Apr 2020 13:36:39 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > > +choice
> > > +   prompt "Crypto Backend"
> > > +   help
> > > +     Select crypto library to be used in uacme.
> > > +
> > > +config BR2_PACKAGE_UACME_GNUTLS
> > > +   bool "gnutls"
> > > +   depends on BR2_PACKAGE_GNUTLS
> > > +
> > > +config BR2_PACKAGE_UACME_MBEDTLS
> > > +   bool "mbedtls"
> > > +   depends on BR2_PACKAGE_MBEDTLS
> > > +   depends on !BR2_PACKAGE_UACME_UALPN
> > > +
> > > +comment "mbedtls crypto backend unavailable with ualpn"
> > > +   depends on BR2_PACKAGE_MBEDTLS
> > > +   depends on BR2_PACKAGE_UACME_UALPN
> > > +
> > > +config BR2_PACKAGE_UACME_OPENSSL
> > > +   bool "openssl"
> > > +   depends on BR2_PACKAGE_OPENSSL
> > > +
> > > +endchoice
> >
> > Sorry, but this is still not correct: enable mbedtls, then enable uacme
> > and ualpn: there is no crypto backend selectable in the choice...
>
> Do we need a choice in the first place ?
v2 didn't add a choice but it was a bit too confusing so I made v3/v4
upon Yann's request. I'll wait for your feedback before making a new
iteration.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
