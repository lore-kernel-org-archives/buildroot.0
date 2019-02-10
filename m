From: Bastian Breit <bastian.breit.buildroot@gmail.com>
Date: Sun, 10 Feb 2019 15:12:48 +0100
Subject: [Buildroot] [PATCH] add library xmlsec1
In-Reply-To: <20190210103749.50caf547@windsurf.home>
References: <20190209215351.29395-1-basti171@gmail.com>
 <20190210103749.50caf547@windsurf.home>
Message-ID: <CACHoAdp2+4-E8_KroYibuYxoFeT2groW-3-H+WS-M0aQDFvCDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> > +LIBXMLSEC1_CONF_OPTS += --with-libxslt=no
>
> Why ? You have a dependency on libxslt. Also, if this dependency is not
> mandatory, it should be made optional.
>
> > +LIBXMLSEC1_CONF_OPTS += --with-gnutls=no
> > +LIBXMLSEC1_CONF_OPTS += --with-gcrypt=no
>
> So OpenSSL is not mandatory and GnuTLS or GCrypt could be used ? If
> that is the case, then it should be supported.
>
> > +LIBXMLSEC1_DEPENDENCIES = libxml2 libxslt openssl
> > +
> > +$(eval $(autotools-package))
>
> Could you rework your package to address those comments ?
>
> Thanks a lot!

I locally fixed the formatting and licence part.
I had some trouble with the mailing list and will use
bastian.breit.buildroot at gmail.com from now on. We use libxmlsec1 in
this context and haven't used another configuration. I am not sure,
how the library works in other configuration. I would create config
options for each option based on that list at
https://www.aleksey.com/xmlsec/faq.html
Should I send changes for formatting & licences with a different patch
or should I send an all in one patch?

Sincerely

Bastian
