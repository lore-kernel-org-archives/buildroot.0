From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 9 Oct 2008 09:57:47 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
In-Reply-To: <d6cda7730810082206nd6cc641wbcf9f3e2f5513672@mail.gmail.com>
References: <20081007202927.B2E04F802A@busybox.net>
	<87d4ibx7bf.fsf@macbook.be.48ers.dk>
	<d6cda7730810082206nd6cc641wbcf9f3e2f5513672@mail.gmail.com>
Message-ID: <20081009075747.GA31080@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 09, 2008 at 02:06:58AM -0300, Thiago A. Corr?a wrote:
>Hi Peter,
>
>>  correa> +
>>  correa> +config BR2_PACKAGE_DIRECTFB_XSERVER
>>  correa> +        bool "build with X server backend"
>>
>> Doesn't this need to depend on the various X implementations
>> (E.G. BR2_PACKAGE_XORG || ..XORG7 || ..TINYX ?
>>
>
>I suppose it should, yes. Sorry, I didn't notice.
>Btw, we really need a better check for X. something like the linux
>kernel with BR2_HAS_X that is set on either X implementation.
>XORG for instance is an empty folder in package/xorg. When/if that
>changes, we need to revisit all packages, quite anoying.

That's the reason why we have BR2_PACKAGE_XSERVER_none; See
package/Config.in
>
>>  correa> +config BR2_PACKAGE_DIRECTFB_PNG
>>  correa> +        bool "enable PNG support"
>>  correa> +        default y
>>  correa> +        depends on BR2_PACKAGE_DIRECTFB
>>  correa> +      select BR2_PACKAGE_LIBPNG
>>  correa> +      select BR2_PACKAGE_ZLIB
>>
>> Indentation seems wrong. Actually it's right here and wrong everywhere
>> else. Config.in uses tabs for indentation, not spaces (and help text
>> is tab+2 spaces).
>>
>
>Unfortunally I can't see that using vi. Since it's not Python, I
>honestly don't see the space/tab being relevant.

It is relevant since it is the style that is perused in this project.
Try something like :match Error '\(^\s\(\s\s\)[^[:alnum:]]\|\s\+$\)'
you get the idea..
>
>>  correa> +config BR2_PACKAGE_DIRECTFB_GIF
>>  correa> +        bool "enable GIF support"

Can you please strip all "enable" and "compile" off those bools. They
are highly redundant.

TIA
