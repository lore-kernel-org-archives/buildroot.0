From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 23 Feb 2014 18:06:41 +0100
Subject: [Buildroot] [PATCH] qt: needs MMU (fork)
In-Reply-To: <1a66f6a964fb37f6144d.1393175048@argentina>
References: <1a66f6a964fb37f6144d.1393175048@argentina>
Message-ID: <CAAXf6LU5sqHAFU6iYr87cSyQJPOAv67bQecfjSccRgWti9rzSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 23, 2014 at 6:04 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Fixes
> http://autobuild.buildroot.net/results/4f7/4f744595efceba2d5a54151bf5f1802eb1268fac/
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
>  package/opencv/Config.in        |  1 +
>  package/openpowerlink/Config.in |  2 ++
>  package/qt/Config.in            |  2 ++
>  3 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -169,6 +169,7 @@ config BR2_PACKAGE_OPENCV_WITH_QT
>         bool "qt backend support"
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on !BR2_avr32 # qt
> +       depends on BR2_USE_MMU # qt
>         select BR2_PACKAGE_QT
>         select BR2_PACKAGE_QT_STL
>         default y
> diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
> --- a/package/openpowerlink/Config.in
> +++ b/package/openpowerlink/Config.in
> @@ -1,4 +1,5 @@
>  comment "openpowerlink needs a toolchain w/ C++, threads"
> +       depends on BR2_USE_MMU
>         depends on BR2_i386 || BR2_x86_64
>         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
>
> @@ -7,6 +8,7 @@ config BR2_PACKAGE_OPENPOWERLINK
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on BR2_i386 || BR2_x86_64
> +       depends on BR2_USE_MMU # qt
>         help
>           openPOWERLINK is an Open Source Industrial Ethernet
>           stack implementing the POWERLINK protocol for Managing Node
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

This should have been flagged as 'v2', sorry...
