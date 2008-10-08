From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2008 20:36:36 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
In-Reply-To: <20081007202927.B2E04F802A@busybox.net> (correa@uclibc.org's
	message of "Tue\, 7 Oct 2008 13\:29\:27 -0700 \(PDT\)")
References: <20081007202927.B2E04F802A@busybox.net>
Message-ID: <87d4ibx7bf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "correa" == correa  <correa@uclibc.org> writes:

 correa> Author: correa
 correa> Date: 2008-10-07 13:29:27 -0700 (Tue, 07 Oct 2008)
 correa> New Revision: 23621

 correa> Log:
 correa> widen options to configure directfb, patch by Micha Nelissen <micha@neli.hopto.org>

 correa> +
 correa> +config BR2_PACKAGE_DIRECTFB_XSERVER
 correa> +        bool "build with X server backend"

Doesn't this need to depend on the various X implementations
(E.G. BR2_PACKAGE_XORG || ..XORG7 || ..TINYX ?

 correa> +config BR2_PACKAGE_DIRECTFB_PNG
 correa> +        bool "enable PNG support"
 correa> +        default y
 correa> +        depends on BR2_PACKAGE_DIRECTFB
 correa> +	select BR2_PACKAGE_LIBPNG
 correa> +	select BR2_PACKAGE_ZLIB

Indentation seems wrong. Actually it's right here and wrong everywhere
else. Config.in uses tabs for indentation, not spaces (and help text
is tab+2 spaces).

 correa> +config BR2_PACKAGE_DIRECTFB_GIF
 correa> +        bool "enable GIF support"
 correa> +        default y
 correa> +        depends on BR2_PACKAGE_DIRECTFB

Is that built in, or do you need to select libgif or similar?

-- 
Bye, Peter Korsgaard
