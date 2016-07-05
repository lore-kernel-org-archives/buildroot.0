From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Jul 2016 13:16:25 +0200
Subject: [Buildroot] [PATCH 1/5] texinfo: new host package
In-Reply-To: <1467712019-24632-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467712019-24632-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <32bbe9d9-c832-26b7-8885-3a39e73d61bb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 05/07/2016 ? 11:46, Thomas Petazzoni a ?crit :
> We have tried multiple solutions to solve the "makeinfo" problem in
> binutils and gdb, without finding anything really convincing. So it
> seems like the easiest solution is to add a texinfo host package, and
> use it as a dependency of binutils/gdb when they are fetched from
> Git. This commit introduces just the host-texinfo package.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/texinfo/texinfo.hash |  2 ++
>  package/texinfo/texinfo.mk   | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 package/texinfo/texinfo.hash
>  create mode 100644 package/texinfo/texinfo.mk
> 
> diff --git a/package/texinfo/texinfo.hash b/package/texinfo/texinfo.hash
> new file mode 100644
> index 0000000..4bdf343
> --- /dev/null
> +++ b/package/texinfo/texinfo.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 ac68394ce21b2420ba7ed7cec65d84aacf308cc88e9bf4716fcfff88286883d2 texinfo-6.1.tar.xz
> diff --git a/package/texinfo/texinfo.mk b/package/texinfo/texinfo.mk
> new file mode 100644
> index 0000000..ebd0b48
> --- /dev/null
> +++ b/package/texinfo/texinfo.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# texinfo
> +#
> +################################################################################
> +
> +TEXINFO_VERSION = 6.1
> +TEXINFO_SITE = $(BR2_GNU_MIRROR)/texinfo
> +TEXINFO_SOURCE = texinfo-$(TEXINFO_VERSION).tar.xz
> +TEXINFO_LICENSE = GPLv3+
> +TEXINFO_LICENSE_FILES = COPYING
> +
> +$(eval $(host-autotools-package))
> 
