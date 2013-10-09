From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 9 Oct 2013 16:04:39 +0200
Subject: [Buildroot] [PATCHv3 05/20] toolchain-buildroot: convert to the
 package infrastructure
In-Reply-To: <1381256237-27948-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LUcykhJZ9UcUTB8+WSm7YMLXFwBOUnq2dOr8_i+L8ayVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Oct 8, 2013 at 8:17 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This commit converts the toolchain-buildroot logic to the package
> infrastructure. The package is fairly simple as it only defines
> BUILDROOT_LIBC, and depends on host-gcc-final to get the overall
> internal toolchain build logic started.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  toolchain/toolchain-buildroot.mk                     |  9 ---------
>  toolchain/toolchain-buildroot/toolchain-buildroot.mk | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+), 9 deletions(-)
>  delete mode 100644 toolchain/toolchain-buildroot.mk
>  create mode 100644 toolchain/toolchain-buildroot/toolchain-buildroot.mk
>
> diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
> deleted file mode 100644
> index 3a05800..0000000
> --- a/toolchain/toolchain-buildroot.mk
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -# Triggerring the build of the host-gcc-final will automaticaly do the
> -# build of binutils, uClibc, kernel headers and all the intermediate
> -# gcc steps.
> -
> -include toolchain/helpers.mk
> -
> -BUILDROOT_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
> -
> -toolchain-buildroot: host-gcc-final
> diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> new file mode 100644
> index 0000000..ced430e
> --- /dev/null
> +++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# toolchain-buildroot
> +#
> +################################################################################
> +
> +TOOLCHAIN_BUILDROOT_SOURCE =
> +
> +BUILDROOT_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
> +
> +# Trigerring the build of the host-gcc-final will automatically do the
> +# build of binutils, uClibc, kernel headers and all the intermediate
> +# gcc steps.

It seems you miscorrected 'triggerring' after my comment on the first
version of your patch (and I did not yet have/take time to review v2
and v3). It should be:
Triggering (double g, single r instead of the other way around).

Best regards,
Thomas
