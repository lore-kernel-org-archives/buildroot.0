From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 9 Oct 2008 02:06:58 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
In-Reply-To: <87d4ibx7bf.fsf@macbook.be.48ers.dk>
References: <20081007202927.B2E04F802A@busybox.net>
	<87d4ibx7bf.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730810082206nd6cc641wbcf9f3e2f5513672@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

>  correa> +
>  correa> +config BR2_PACKAGE_DIRECTFB_XSERVER
>  correa> +        bool "build with X server backend"
>
> Doesn't this need to depend on the various X implementations
> (E.G. BR2_PACKAGE_XORG || ..XORG7 || ..TINYX ?
>

I suppose it should, yes. Sorry, I didn't notice.
Btw, we really need a better check for X. something like the linux
kernel with BR2_HAS_X that is set on either X implementation.
XORG for instance is an empty folder in package/xorg. When/if that
changes, we need to revisit all packages, quite anoying.

>  correa> +config BR2_PACKAGE_DIRECTFB_PNG
>  correa> +        bool "enable PNG support"
>  correa> +        default y
>  correa> +        depends on BR2_PACKAGE_DIRECTFB
>  correa> +      select BR2_PACKAGE_LIBPNG
>  correa> +      select BR2_PACKAGE_ZLIB
>
> Indentation seems wrong. Actually it's right here and wrong everywhere
> else. Config.in uses tabs for indentation, not spaces (and help text
> is tab+2 spaces).
>

Unfortunally I can't see that using vi. Since it's not Python, I
honestly don't see the space/tab being relevant.

>  correa> +config BR2_PACKAGE_DIRECTFB_GIF
>  correa> +        bool "enable GIF support"
>  correa> +        default y
>  correa> +        depends on BR2_PACKAGE_DIRECTFB
>
> Is that built in, or do you need to select libgif or similar?
>

It seams to depend on libgif, so another select is missing. I was able
to catch the ZLIB select missing in the original patch and added it
myself, but I guess I didn't notice this one as I already had libgif
selected.

Fixes in -r23629

Kind Regards,
    Thiago A. Correa
