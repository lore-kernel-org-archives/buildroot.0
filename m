From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Dec 2012 07:37:48 +0100
Subject: [Buildroot] [PATCH 02/51] package/qemu: fix host-qemu variable
 names
In-Reply-To: <1355070924-8009-3-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <1355070924-8009-3-git-send-email-yann.morin.1998@free.fr>
Message-ID: <50C5833C.5070602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/12 17:34, Yann E. MORIN wrote:
> With the upcoming introduction of qemu-on-target, we need to properly
> separate the variables used for the host qemu, from the variables
> used for the target qemu.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> Cc: Francois Perrad<fperrad@gmail.com>
> ---
>   package/qemu/qemu.mk |   25 ++++++++++++++-----------
>   1 files changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 790d34f..81cd79f 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -13,7 +13,10 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
>   #       the non-(L)GPL license texts are specified in the affected
>   #       individual source files.
>
> -QEMU_DEPENDENCIES = host-pkgconf zlib libglib2
> +#-------------------------------------------------------------
> +# Host-qemu
> +
> +HOST_QEMU_DEPENDENCIES = host-pkgconf zlib libglib2

  I guess this should be host-zlib and host-libglib2?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
