From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Nov 2016 06:39:56 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/qemu: enable host QEMU for
 powerpc64/powerpc64le
In-Reply-To: <ac172abdaec9d69c264652b6b552674e50eda2e4.1479961171.git.sam.bobroff@au1.ibm.com>
References: <ac172abdaec9d69c264652b6b552674e50eda2e4.1479961171.git.sam.bobroff@au1.ibm.com>
Message-ID: <20161124043956.zhzvogx464bkzz74@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On Thu, Nov 24, 2016 at 03:19:43PM +1100, Sam Bobroff wrote:
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
> v2:
> Corrected user-mode arch.

Since the previous version of your patch has already been applied to next 
(commit d634d9dda7), you should generate an incremental fix patch against 
next.

baruch

>  package/qemu/qemu.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 2c94a51..bc707cf 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -34,6 +34,8 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-p
>  #       mips64          mips64
>  #       mips64el        mips64el
>  #       powerpc         ppc
> +#       powerpc64       ppc64
> +#       powerpc64le     ppc64le
>  #       sh2a            not supported
>  #       sh4             sh4
>  #       sh4eb           sh4eb
> @@ -55,6 +57,12 @@ endif
>  ifeq ($(HOST_QEMU_ARCH),powerpc)
>  HOST_QEMU_ARCH = ppc
>  endif
> +ifeq ($(HOST_QEMU_ARCH),powerpc64)
> +HOST_QEMU_ARCH = ppc64
> +endif
> +ifeq ($(HOST_QEMU_ARCH),powerpc64le)
> +HOST_QEMU_ARCH = ppc64le
> +endif
>  ifeq ($(HOST_QEMU_ARCH),sh4a)
>  HOST_QEMU_ARCH = sh4
>  endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
