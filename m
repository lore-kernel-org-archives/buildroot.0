From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Fri, 20 Apr 2018 10:44:03 +0530
Subject: [Buildroot] [PATCH] dhcpcd: fix legal info
In-Reply-To: <b447f605d590d542297e63e0b987d76d407b6a16.1524198457.git.baruch@tkos.co.il>
References: <b447f605d590d542297e63e0b987d76d407b6a16.1524198457.git.baruch@tkos.co.il>
Message-ID: <CA+NV+Vnp0Cx0djXXE9sQP8i-u7CQ15Ef5LmvE=g8F5k9t68ngw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 20, 2018 at 9:57 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> The latest version bump to 7.0.3 moved dhcpcd.c to under src/.
>
> While at it, add a hash for that file.
>
> Fixes:
> http://autobuild.buildroot.net/results/f57/f5790e0a82a3b814d828d18eb71a3f6c422bb2b8/
> http://autobuild.buildroot.net/results/6b9/6b930827913f9b4d2602d5777f4243ba7b295ca7/
> http://autobuild.buildroot.net/results/603/603eda004a502f613e9b92cea4fb8cc9e4068255/
>
> Cc: John Stile <johns@msli.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/dhcpcd/dhcpcd.hash | 2 ++
>  package/dhcpcd/dhcpcd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
> index 99b7fe786e8a..2bdce6b50b8b 100644
> --- a/package/dhcpcd/dhcpcd.hash
> +++ b/package/dhcpcd/dhcpcd.hash
> @@ -1,2 +1,4 @@
>  # sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-7.0.3.tar.xz.distinfo.asc
>  sha256 a255d9aecceb1c77a9862f1c0d31a48ba37aab5ef2ca5ad76fc7a907b6ea292e        dhcpcd-7.0.3.tar.xz
> +# Locally calculated
> +sha256 f2fbaae2ff09996ffc53d19f23f942891e558034cad4c829754923b94d6d9432        src/dhcpcd.c
> diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
> index 1bb0dd8a5137..5c8e067120cb 100644
> --- a/package/dhcpcd/dhcpcd.mk
> +++ b/package/dhcpcd/dhcpcd.mk
> @@ -9,7 +9,7 @@ DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
>  DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
>  DHCPCD_DEPENDENCIES = host-pkgconf
>  DHCPCD_LICENSE = BSD-2-Clause
> -DHCPCD_LICENSE_FILES = dhcpcd.c
> +DHCPCD_LICENSE_FILES = src/dhcpcd.c

There is LICENSE file now. We should use it instead.

Thanks,
Rahul
