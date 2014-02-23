From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 23 Feb 2014 17:09:31 +0100
Subject: [Buildroot] [PATCH] qt: needs MMU (fork)
In-Reply-To: <482e4e3f114d4396aa21.1393171234@argentina>
References: <482e4e3f114d4396aa21.1393171234@argentina>
Message-ID: <CAAXf6LVcLsvBM6G_XHSiuOFZCOzBmO28_Pz-Gn1Q+OtytGc30g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 23, 2014 at 5:00 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Fixes
> http://autobuild.buildroot.net/results/4f7/4f744595efceba2d5a54151bf5f1802eb1268fac/
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
>  package/qt/Config.in |  2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -1,10 +1,12 @@
>  comment "qt needs a toolchain w/ C++, threads"
>         depends on !BR2_avr32
> +       depends on BR2_USE_MMU
>         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
>
>  menuconfig BR2_PACKAGE_QT
>         bool "Qt"
>         depends on !BR2_avr32 # lacks TLS
> +       depends on BR2_USE_MMU # fork
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         help


Hold on, I haven't yet checked the reverse dependencies, and I assume
there are some. I will send an updated patch later...
