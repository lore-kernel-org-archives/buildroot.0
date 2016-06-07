From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jun 2016 23:23:56 +0200
Subject: [Buildroot] [PATCH v2 next 6/7] Disable gcc-4.8 + binutils >=
 2.25 + MIPS combination
In-Reply-To: <1464693198-16523-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464693078-15767-1-git-send-email-Vincent.Riera@imgtec.com>
 <1464693198-16523-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160607212356.GG3775@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2016-05-31 12:13 +0100, Vicente Olivert Riera spake thusly:
> Commit 2fda0dd7d491e6e926ace1cd09ad2fb241356232 disabled the gcc-4.8 +
> binutils-2.25 + MIPS combination. But now that we have BINUTILS_AT_LEAST
> options we can use them in order to disable all combinations for future
> versions of binutils.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/gcc/Config.in.host | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 61d3dbe..4e45029 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -42,8 +42,8 @@ choice
>  		depends on !BR2_cortex_a12 && !BR2_cortex_a17
>  		# Broken or unsupported PPC cores
>  		depends on !BR2_powerpc_power8
> -		# gcc-4.8.x + binutils-2.25 is broken for MIPS
> -		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_X)
> +		# gcc-4.8.x + binutils >= 2.25 is broken for MIPS
> +		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25)

Hmm, this again does two things:
  - use the new biunutils-at-least options,
  - also disable binutils 2.26 (which was not disabled previously)

But OK, I guess you know what you're doing, regarding MIPS! ;-)

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  		# Unsupported for MIPS R6
>  		depends on !BR2_mips_32r6 && !BR2_mips_64r6
>  		select BR2_GCC_NEEDS_MPC
> -- 
> 2.7.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
