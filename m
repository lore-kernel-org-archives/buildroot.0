From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Sep 2014 23:38:00 +0200
Subject: [Buildroot] [PATCH 1/2] valgrind: allow building on Cortex A5
In-Reply-To: <1412107895-10015-2-git-send-email-mike@mikebwilliams.com>
References: <1412107895-10015-1-git-send-email-mike@mikebwilliams.com>
 <1412107895-10015-2-git-send-email-mike@mikebwilliams.com>
Message-ID: <20140930233800.79350bbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Tue, 30 Sep 2014 16:11:34 -0400, Mike Williams wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
> ---
>  package/valgrind/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
> index fd5649b..49ff1b1 100644
> --- a/package/valgrind/Config.in
> +++ b/package/valgrind/Config.in
> @@ -1,8 +1,8 @@
>  config BR2_PACKAGE_VALGRIND
>  	bool "valgrind"
> -	depends on BR2_i386 || BR2_x86_64 || BR2_cortex_a8 || \
> -		   BR2_cortex_a9 || BR2_powerpc || BR2_mips || \
> -		   BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	depends on BR2_i386 || BR2_x86_64 || BR2_cortex_a5 || \
> +		   BR2_cortex_a8 || BR2_cortex_a9 || BR2_powerpc || \
> +		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>  	help
>  	  Tool for debugging and profiling Linux programs.
>  

For good measure, could you also add Cortex A7, A12 and A15 to the
list? If you do this, then you can resend the updated patch with my
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
