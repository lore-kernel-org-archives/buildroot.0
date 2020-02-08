From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 22:24:40 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/qemu: add support for sparc64
In-Reply-To: <20200208211512.994361-3-aduskett@gmail.com>
References: <20200208211512.994361-1-aduskett@gmail.com>
 <20200208211512.994361-3-aduskett@gmail.com>
Message-ID: <20200208212440.GB23769@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-02-08 13:15 -0800, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/qemu/qemu.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 6794157709..f6c14c6a47 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -237,6 +237,9 @@ endif
>  ifeq ($(HOST_QEMU_ARCH),sh4aeb)
>  HOST_QEMU_ARCH = sh4eb
>  endif
> +ifeq ($(HOST_QEMU_ARCH),sparc64)
> +HOST_QEMU_ARCH = sparc64

I have some issues parsing that condition...

If HOST_QEMU_ARCH is set to sparc64, then we assign it the same value it
already had. This is a bit of a noop, no?

Regards,
Yann E. MORIN.

> +endif
>  ifeq ($(HOST_QEMU_ARCH),csky)
>  ifeq ($(BR2_ck610),y)
>  HOST_QEMU_ARCH = cskyv1
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
