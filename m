From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 Jun 2020 20:30:20 +0200
Subject: [Buildroot] [PATCH] toolchain: adjust version check to allow
 for single numbers
In-Reply-To: <20200610235313.204905-1-nolange79@gmail.com>
References: <20200610235313.204905-1-nolange79@gmail.com>
Message-ID: <eb78ec3e-a54e-1ada-f339-b476f90ee44f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 11/06/2020 ? 01:53, Norbert Lange a ?crit?:
> A gcc compiler, which was configured with
> --with-gcc-major-version-only, will only return a single
> number. (debian does this for example).

This option is available since gcc 8:

https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3c36aa6ba2be894d4092a6ce8129d39ef846c964

So older toolchain always provide a full version.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> A simple modification allows the check to work with both
> single numbers (eg. '9') and full versions (eg. '9.2.1').
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  toolchain/helpers.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 44d0c83d1e..17bc159f3e 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -184,7 +184,7 @@ check_gcc_version = \
>  		exit 0 ; \
>  	fi; \
>  	real_version=`$(1) -dumpversion` ; \
> -	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
> +	if [[ ! "$${real_version}." =~ ^$${expected_version}\. ]] ; then \
>  		printf "Incorrect selection of gcc version: expected %s.x, got %s\n" \
>  			"$${expected_version}" "$${real_version}" ; \
>  		exit 1 ; \
> 
