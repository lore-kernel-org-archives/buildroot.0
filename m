From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Jul 2013 14:58:53 +0200
Subject: [Buildroot] [PATCH 2/9] uclibc/bfin: only supports
 linuxthreads.old
In-Reply-To: <1374324735-2286-3-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
 <1374324735-2286-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130720125853.GC3507@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2013-07-20 09:52 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/uclibc/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 90aae90..f9c4956 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -104,6 +104,7 @@ choice
>  
>  	config BR2_PTHREADS
>  		bool "linuxthreads"
> +		depends on !BR2_bfin
>  		depends on !BR2_xtensa
>  	        select BR2_TOOLCHAIN_HAS_THREADS
>  
> @@ -115,9 +116,10 @@ choice
>  		bool "Native POSIX Threading (NPTL)"
>  		select BR2_TOOLCHAIN_HAS_THREADS
>  		depends on !BR2_x86_i386
> +		depends on !BR2_arc
>  		depends on !BR2_avr32
> +		depends on !BR2_bfin
>  		depends on !BR2_xtensa
> -		depends on !BR2_arc

While at re-ordering, you could have also reorderd x86_i386.
Note this in the commit log, such as:
   trivial options re-rodering at the same time.

Although I would prefer you not mix cosmetics with actual changes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
