From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Oct 2018 22:34:06 +0200
Subject: [Buildroot] [PATCH] meson: Use AR via wrapper
In-Reply-To: <20181009192422.20809-1-abrodkin@synopsys.com>
References: <20181009192422.20809-1-abrodkin@synopsys.com>
Message-ID: <20181009203406.GM2869@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2018-10-09 22:24 +0300, Alexey Brodkin spake thusly:
> If building with LTO enabled we need to use GCC wrapper for AR otherwise
> archives get created improperly and we see a lot of unresolved symbols
> on finla linkage.
> 
> In particular this allows to build SystemD with LTO.

This is just 'systemd', not SystemD, or any other case-mangling on it
https://www.freedesktop.org/wiki/Software/systemd/ ;-)

There, I'm done with the nit-picking. ;-) Now read on, for the real
review lies below...

> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Mark Corbin <mark.corbin@embecosm.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/meson/cross-compilation.conf.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> index 0eec74087b..de4600cc58 100644
> --- a/package/meson/cross-compilation.conf.in
> +++ b/package/meson/cross-compilation.conf.in
> @@ -6,7 +6,7 @@
>  [binaries]
>  c = '@TARGET_CROSS at gcc'
>  cpp = '@TARGET_CROSS at g++'
> -ar = '@TARGET_CROSS at ar'
> +ar = '@TARGET_CROSS at gcc-ar'

I was curioous as to see for how long gcc provided that wrapper. It
turns out that at least 4.9 did.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  strip = '@TARGET_CROSS at strip'
>  pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
>  
> -- 
> 2.16.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
