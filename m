From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Feb 2013 04:34:21 +0100
Subject: [Buildroot] [PATCH 10/13] librtmp: new package
In-Reply-To: <201302212117.57668.yann.morin.1998@free.fr>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <b7845a27b24e15e0657906431ba388d10d725f73.1361458625.git.maxime.hadjinlian@gmail.com>
 <201302212117.57668.yann.morin.1998@free.fr>
Message-ID: <20130224043421.1672506f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 21 Feb 2013 21:17:57 +0100, Yann E. MORIN wrote:

> > +LIBRTMP_LICENSE_FILES = COPYING
> > +LIBRTMP_DEPENDENCIES = openssl zlib
> 
> And here, I'd do something like:
> 
>     LIBRTMP_DEPENDENCIES = openssl zlib

This line should be:

 	LIBRTMP_DEPENDENCIES = zlib

>     ifeq ($(BR2_PACKAGE_GNUTLS),y)
>     LIBRTMP_DEPENDENCIES += gnutls
>     else
>     ifeq ($(BR2_PACKAGE_POLARSSL),y)
>     LIBRTMP_DEPENDENCIES += polarssl
>     else
>     LIBRTMP_DEPENDENCIES += openssl
>     endif
>     endif

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
