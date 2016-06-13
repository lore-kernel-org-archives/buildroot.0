From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jun 2016 22:41:20 +0200
Subject: [Buildroot] [PATCH 4/6] gcc: remove occurrence of eglibc
In-Reply-To: <1465422059-22254-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160613204120.GF3786@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-08 23:40 +0200, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gcc/gcc-final/gcc-final.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 721f4c8..78ceeba 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -115,7 +115,7 @@ HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINK
>  
>  # In gcc 4.7.x, the ARM EABIhf library loader path for glibc was not
>  # correct, so we create a symbolic link to make things work
> -# properly. eglibc installs the library loader as ld-linux-armhf.so.3,
> +# properly. glibc installs the library loader as ld-linux-armhf.so.3,

Yeah I remember something weird about that... However, the comment was
specifically speaking about eglibc. Was/is it also valid for glibc?

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  # but gcc creates binaries that reference ld-linux.so.3.
>  ifeq ($(BR2_arm)$(BR2_ARM_EABIHF)$(BR2_GCC_VERSION_4_7_X)$(BR2_TOOLCHAIN_USES_GLIBC),yyyy)
>  define HOST_GCC_FINAL_LD_LINUX_LINK
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
