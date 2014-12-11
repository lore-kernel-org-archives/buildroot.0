From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Dec 2014 21:49:31 +0100
Subject: [Buildroot] [PATCH 8/8] Build shared libraries only as the
 default
In-Reply-To: <1417642895-29606-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417642895-29606-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141211204931.GK4199@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-03 22:41 +0100, Thomas Petazzoni spake thusly:
> Now that we have more options in terms of static/shared libraries,
> switch from the existing default of building both shared and static
> libraries to building shared libraries only (of course only on
> platforms that support shared libraries).
> 
> Building both shared and static takes time (since the shared objects
> must be built with -fPIC, while static objects are generally built
> without, as -fPIC has some performance impact) and consumes a little
> bit more disk space.
> 
> For example, a static+shared build of libglib2 takes 1 minutes and 59
> seconds, with a final build directory of 96 MB. A shared-only build of
> libglib2 takes only 1 minutes and 31 seconds (almost a 25% reduction
> of the build time), and the final build directory weights 89 MB (a
> reduction of almost 8%).
> 
> So, switching to a shared library only build brings some useful build
> time and build size benefits.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I wonder how many opackages that will break... Let's say we apply it and
let the autobuilders do their hjob! :-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index e31f820..7dd4c86 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -528,7 +528,7 @@ comment "enabling Stack Smashing Protection requires support in the toolchain"
>  choice
>  
>  	prompt "libraries"
> -	default BR2_SHARED_STATIC_LIBS if BR2_BINFMT_SUPPORTS_SHARED
> +	default BR2_SHARED_LIBS if BR2_BINFMT_SUPPORTS_SHARED
>  	default BR2_STATIC_LIBS if !BR2_BINFMT_SUPPORTS_SHARED
>  
>  config BR2_STATIC_LIBS
> -- 
> 2.1.0
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
