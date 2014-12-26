From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 21:01:12 +0100
Subject: [Buildroot] [PATCH 1/2] package/kismet: fix ncurses static build
In-Reply-To: <bc13bcfd2fff0fa2c313edad80d220ef5e34e567.1419615048.git.yann.morin.1998@free.fr>
References: <cover.1419615048.git.yann.morin.1998@free.fr>
 <bc13bcfd2fff0fa2c313edad80d220ef5e34e567.1419615048.git.yann.morin.1998@free.fr>
Message-ID: <20141226210112.224245f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 26 Dec 2014 18:33:08 +0100, Yann E. MORIN wrote:

> diff --git a/package/kismet/0003-fix-curses-libs-ordering.patch b/package/kismet/0003-fix-curses-libs-ordering.patch
> new file mode 100644
> index 0000000..c5e7eff
> --- /dev/null
> +++ b/package/kismet/0003-fix-curses-libs-ordering.patch
> @@ -0,0 +1,52 @@
> +configure: fix ordering of ncurses libraries
> +
> +Says Vicente:
> +    [T]he order is very important when doing static builds.
> +    Otherwise we will see errors like this one:
> +
> +    [...]/sysroot/usr/lib/libpanel.a(p_delete.o):
> +    In function `del_panel':
> +    p_delete.c:(.text+0x68): undefined reference to `_nc_panelhook'
> +
> +Fix the order configure adds libraries: new libraries should be added
> +at the *front* of the list, not at the end.

So this is only talking about library ordering.

> +-# Add additional cflags since some distros bury panel.h
> +-CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"

But the patch also removes some invalid -I path.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
