From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 12 Oct 2018 12:09:46 -0400
Subject: [Buildroot] [PATCH 3/4] btcd: new package
In-Reply-To: <1538143163-20596-4-git-send-email-fabiorush@gmail.com>
References: <1538143163-20596-1-git-send-email-fabiorush@gmail.com>
 <1538143163-20596-4-git-send-email-fabiorush@gmail.com>
Message-ID: <CAFSsvmqNOWUR6JdBypZ=cJfkOavN+4x0845sqfU5N+YZdFaqEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi;
On Fri, Sep 28, 2018 at 10:03 AM Fabio Urquiza <fabiorush@gmail.com> wrote:
>
> An alternative full node bitcoin implementation written in Go (golang).
>
> Signed-off-by: Fabio Urquiza <fabiorush@gmail.com>
> ---
>  package/Config.in      |  1 +
>  package/btcd/Config.in | 10 ++++++++++
>  package/btcd/btcd.hash |  3 +++
>  package/btcd/btcd.mk   | 15 +++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/btcd/Config.in
>  create mode 100644 package/btcd/btcd.hash
>  create mode 100644 package/btcd/btcd.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 796383a..6a74a80 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1973,6 +1973,7 @@ endif
>
>  menu "Blockchain Applications"
>         source "package/bitcoin/Config.in"
> +       source "package/btcd/Config.in"
>  endmenu
>
>  endmenu
> diff --git a/package/btcd/Config.in b/package/btcd/Config.in
> new file mode 100644
> index 0000000..566e8dd
> --- /dev/null
> +++ b/package/btcd/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_BTCD
> +       bool "btcd"
> +       depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +       select BR2_PACKAGE_HOST_GO_GLIDE
> +       help
> +         btcd is an alternative full node bitcoin implementation
> +         written in Go (golang).
> +
> +         https://github.com/btcsuite/btcd
> +
> diff --git a/package/btcd/btcd.hash b/package/btcd/btcd.hash
> new file mode 100644
> index 0000000..d0b76c5
> --- /dev/null
> +++ b/package/btcd/btcd.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 4afd800125ecd9ff22c63dfc00c512ae5892f98b0415ecc1a19cd64afdf86bbb  btcd-2a560b2036bee5e3679ec2133eb6520b2f195213.tar.gz
> +sha256 46021938caf87eeb92c841fd48777a3a7bf218341386611c4d080aa45812d1d2  LICENSE
> diff --git a/package/btcd/btcd.mk b/package/btcd/btcd.mk
> new file mode 100644
> index 0000000..4a296a7
> --- /dev/null
> +++ b/package/btcd/btcd.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# btcd
> +#
> +################################################################################
> +
> +BTCD_VERSION = 2a560b2036bee5e3679ec2133eb6520b2f195213
Is there a reason v0.12.0-beta isn't being used? Normally I wouldn't
suggest a beta release,
but every release is marked with "beta."
> +BTCD_SITE = $(call github,btcsuite,btcd,$(BTCD_VERSION))
> +BTCD_LICENSE = ISC
> +BTCD_LICENSE_FILES = LICENSE
> +BTCD_GO_GLIDE = YES
> +BTCD_GO_GET = YES
> +
> +$(eval $(golang-package))
> +
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Thanks!

Adam
