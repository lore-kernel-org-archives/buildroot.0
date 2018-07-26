From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 26 Jul 2018 20:46:59 +0200
Subject: [Buildroot] [PATCH] toolchain-external: add fortran support
 option for custom external toolchains
In-Reply-To: <20180714171542.8192-1-romain.naour@gmail.com>
References: <20180714171542.8192-1-romain.naour@gmail.com>
Message-ID: <CAHXCMMJuFZn9S==hQ4y2Z3BDz8oWQqd+Fq5NU=sD9tew5mZF7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

Sorry for the late response. :s

On Sat, Jul 14, 2018 at 7:15 PM, Romain Naour <romain.naour@gmail.com> wrote:
> If a custom external toolchain is used, we can't enable the fortran
> support. Add a new option for that.

Indeed, it is a long-time limitation of using buildroot toolchain as
external ones, all options are not necessarily available in the
external toolchain backend. :-/

>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  .../toolchain-external-custom/Config.in.options                   | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index 6a9921c149..5ec3f961a1 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -401,6 +401,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
>           support. If you don't know, leave the default value,
>           Buildroot will tell you if it's correct or not.
>
> +config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
> +       bool "Toolchain has Fortran support?"
> +       select BR2_TOOLCHAIN_HAS_FORTRAN
> +       help
> +         Select this option if your external toolchain has Fortran
> +         support. If you don't know, leave the default value,
> +         Buildroot will tell you if it's correct or not.
> +

In the gcc package, there is some extra checks for fortran with
libquadmath when available (which depends on the target architecture).
So, I wonder whether it should be sensitive to libquadmath (so wchar)
on the relevant architectures.

>  config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
>         string "Extra toolchain libraries to be copied to target"
>         help
> --
> 2.14.4
>

Regards,

-- 
Samuel
