From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jul 2016 01:18:57 +0200
Subject: [Buildroot] [PATCH 2/4] vde2: enable building host package
In-Reply-To: <1467584664-11640-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467584664-11640-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1467584664-11640-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160703231857.GI3482@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon, Thomas, All,

On 2016-07-04 00:24 +0200, Thomas Petazzoni spake thusly:
> From: Simon Maes <simonn.maes@gmail.com>
> 
> In preparation of enabling vde2 support in host-qemu package.

I'm not sure why we need to have a host-qemu with VDE2 support...

As far as I understand it, VDE2 is needed for complex and complicated
cloud-like networking infrastructure, whereas we provide a host-qemu
that will serve to quickly test a Buildroot build.

I think ew should not add such a dependency.

However, I'll still do a review...

> Signed-off-by: Simon Maes <simonn.maes@gmail.com>
> [Thomas:
>  - add HOST_VDE2_CONF_OPTS and HOST_VDE2_MAKE, like we have for the
>    target variant.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/vde2/vde2.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
> index bad758d..d9b11bb 100644
> --- a/package/vde2/vde2.mk
> +++ b/package/vde2/vde2.mk
> @@ -37,4 +37,16 @@ VDE2_CONF_OPTS = \
>  #?Package does not build in parallel due to improper make rules
    ^
Non-breakable space here...
Note: there's another one for the first item in the list, above...

Probably my deed, btw...

>  VDE2_MAKE = $(MAKE1)
>  
> +HOST_VDE2_CONF_OPTS = \
> +	--disable-experimental  \
> +	--disable-cryptcab      \
> +	--disable-pcap          \
> +	--disable-python        \
> +	--disable-profile       \
> +	--disable-kernel-switch \
> +	--enable-tuntap         \
> +
> +HOST_VDE2_MAKE = $(MAKE1)
> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> -- 
> 2.7.4
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
