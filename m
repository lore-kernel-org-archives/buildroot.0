From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 09:22:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: add support for mbedtls
 crypto backend
In-Reply-To: <CAKpO6uFOE2ShN1JupQoiupNF-SVnWzMiJ5x9twcAueGG5p9how@mail.gmail.com>
References: <20190918110609.7172-1-gliga.mircea@gmail.com>
 <20190918174859.1627727d@windsurf>
 <CAKpO6uFOE2ShN1JupQoiupNF-SVnWzMiJ5x9twcAueGG5p9how@mail.gmail.com>
Message-ID: <20190923092218.72ad7121@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Sep 2019 09:11:40 +0300
Mircea Gliga <gliga.mircea@gmail.com> wrote:

> Hi Thomas and thanks for the review,
> 
> The Config.in also has this part that automatically selects the OpenSSL
> package if no crypto backend is already available:
> 
> > -       select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
> > +       select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_MBEDTLS ||  
> BR2_PACKAGE_LIBGCRYPT)
> 
> This is in sync with the old behavior, when mbedtls was not in scope.
> And then in case there are multiple crypto backends available it will
> prefer Libgcrypt, then OpenSSL and in the end mbedTLS:
> 
> > +     default BR2_PACKAGE_LIBSSH_LIBGCRYPT if BR2_PACKAGE_LIBGCRYPT
> > +     default BR2_PACKAGE_LIBSSH_OPENSSL if BR2_PACKAGE_OPENSSL
> > +     default BR2_PACKAGE_LIBSSH_MBEDTLS if BR2_PACKAGE_MBEDTLS  
> 
> The default will be to select the first enabled crypto backend provider
> in the same preference order as is used now, i.e. no change from current
> behavior.

Thanks, but that was not my point. My point was: is it really useful to
provide an explicit choice vs. simply selecting a preferred crypto
provider automatically, with no explicit choice in Config.in.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
