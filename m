From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2018 11:26:48 +0200
Subject: [Buildroot] [PATCH] dahdi-tools: fix dependencies comment
 condition
In-Reply-To: <bcc4fba3f0a19c97f2361a8924defc43716966cc.1534496720.git.baruch@tkos.co.il>
References: <bcc4fba3f0a19c97f2361a8924defc43716966cc.1534496720.git.baruch@tkos.co.il>
Message-ID: <20180817092648.GG2556@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-08-17 12:05 +0300, Baruch Siach spake thusly:
> The threads dependency comment is unrelated to the Linux kernel
> dependency.

But at the same time, if the kernel is not enabled, do we want to
display the comment?

However, this is indeed not like the other cases, where we have a single
comment, like aufs-utils, gst-plugin-x170, on2-8170-libs, sysdig, or,
with a slight difference, xdriver_xf86-video-imx.

So, if we want to make it more similar to the others, and to make it
conform to the manual (17.2.5 Dependencies on a Linux kernel built by
buildroot):

    comment "dahdi-tools needs a toolchain w/ threads and a Linux kernel to be built"
        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LINUX_KERNEL

and get rid of the second comment altogether.

Regards,
Yann E. MORIN.

> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/dahdi-tools/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dahdi-tools/Config.in b/package/dahdi-tools/Config.in
> index 39042df04134..625d17f216e3 100644
> --- a/package/dahdi-tools/Config.in
> +++ b/package/dahdi-tools/Config.in
> @@ -17,7 +17,7 @@ config BR2_PACKAGE_DAHDI_TOOLS
>  
>  # Two comments, otherwise it may not fit in menuconfig for narrow terminals
>  comment "dahdi-tools needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LINUX_KERNEL
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
>  
>  comment "dahdi-tools needs a Linux kernel to be built"
>  	depends on !BR2_LINUX_KERNEL
> -- 
> 2.18.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
