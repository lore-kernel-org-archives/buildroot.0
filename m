From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:21:37 +0200
Subject: [Buildroot] [PATCH 2/9] uclibc/bfin: only supports
 linuxthreads.old
In-Reply-To: <1374324735-2286-3-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
 <1374324735-2286-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130727162137.66a04363@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 20 Jul 2013 09:52:08 -0300, Gustavo Zacarias wrote:
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
>  endchoice

As suggested by Yann, I've splitted this in two patches, one adding
the !bfin dependency, another one doing the re-ordering, including
x86_i386.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
