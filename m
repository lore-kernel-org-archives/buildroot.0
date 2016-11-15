From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 13:06:18 +0100
Subject: [Buildroot] [PATCH] grub2: enable grub-mkfont host tool
In-Reply-To: <20161109110352.7222-1-jezz@sysmic.org>
References: <20161109110352.7222-1-jezz@sysmic.org>
Message-ID: <20161115130618.5c12d64f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Nov 2016 12:03:52 +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Empty commit log: not good. It would have been nice to explain in which
situations grub-mkfont is useful.

> ---
>  boot/grub2/grub2.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index dc4e51e..a3352c2 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -9,7 +9,7 @@ GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
>  GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
>  GRUB2_LICENSE = GPLv3+
>  GRUB2_LICENSE_FILES = COPYING
> -GRUB2_DEPENDENCIES = host-bison host-flex
> +GRUB2_DEPENDENCIES = host-bison host-flex host-freetype

I don't really like this additional dependency, that is only needed
when one needs mkfont (pretty rare use case I believe).

Can we instead add a sub-option to the grub2 package to select (or not)
the build of the mkfont utility?

Of course, don't forget to explicitly --enable/--disable the relevant
option.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
