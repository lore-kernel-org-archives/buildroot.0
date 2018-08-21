From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 00:07:48 +0200
Subject: [Buildroot] [PATCH next 1/4] lzo: build shared library for the
 host
In-Reply-To: <20180821215954.11971-2-thomas.petazzoni@bootlin.com>
References: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
 <20180821215954.11971-2-thomas.petazzoni@bootlin.com>
Message-ID: <20180821220748.GS15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-21 23:59 +0200, Thomas Petazzoni spake thusly:
> By default, the lzo package builds and installs only a static
> library. For the target variant, we pass the appropriate
> ENABLE_STATIC/ENABLE_SHARED options, but not for the host package, and
> therefore a static lzo library gets installed.
> 
> However, on the host, our policy is to build shared libraries and not
> static libraries, as visible in the default configure options passed
> to host package in pkg-autotools.mk (--enable-shared
> --disable-static). Let's do the same with lzo.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/lzo/lzo.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
> index 27ca459acf..0ead92725a 100644
> --- a/package/lzo/lzo.mk
> +++ b/package/lzo/lzo.mk
> @@ -23,5 +23,7 @@ else
>  LZO_CONF_OPTS += -DENABLE_STATIC=OFF
>  endif
>  
> +HOST_LZO_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
> +
>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> -- 
> 2.14.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
