From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 30 Jan 2012 00:43:08 +0100
Subject: [Buildroot] [PATCH v2] boost: New package added. Version 1.47
In-Reply-To: <87vcnuglfx.fsf@macbook.be.48ers.dk>
References: <4E96BFD0.2050706@visionsystems.de>
 <87vcnuglfx.fsf@macbook.be.48ers.dk>
Message-ID: <CAGm1_ktkHZ5ihrKEyb0pBVWL+uDzpo4___O253400HhQkadaGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 30, 2012 at 12:04 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:
>
> ?Yegor> Signed-off-by: Allan W. Nielsen <a@awn.dk>
> ?Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Committed with minor tweaks, sorry for the slow response.
>
> ?Yegor> ---
> ?Yegor> changes:
> ?Yegor> 1. convert GENTARGETS to the latest syntax
> ?Yegor> 2. add all dependencies in one line
> ?Yegor> ?package/Config.in ? ? ? | ? ?1
> ?Yegor> ?package/boost/Config.in | ? 99 ++++++++++++++++++++++++++++++++++++++++++++++++
> ?Yegor> ?package/boost/boost.mk ?| ? 83 ++++++++++++++++++++++++++++++++++++++++
> ?Yegor> ?3 files changed, 183 insertions(+)
> ?Yegor> ?create mode 100644 package/boost/Config.in
> ?Yegor> ?create mode 100644 package/boost/boost.mk
>
> ?Yegor> Index: b/package/Config.in
> ?Yegor> ===================================================================
> ?Yegor> --- a/package/Config.in
> ?Yegor> +++ b/package/Config.in
> ?Yegor> @@ -346,6 +346,7 @@
> ?Yegor> ?source "package/fftw/Config.in"
> ?Yegor> ?source "package/libargtable2/Config.in"
> ?Yegor> ?source "package/argp-standalone/Config.in"
> ?Yegor> +source "package/boost/Config.in"
> ?Yegor> ?source "package/libatomic_ops/Config.in"
> ?Yegor> ?source "package/libcap/Config.in"
> ?Yegor> ?source "package/libdaemon/Config.in"
> ?Yegor> Index: b/package/boost/Config.in
> ?Yegor> ===================================================================
> ?Yegor> --- /dev/null
> ?Yegor> +++ b/package/boost/Config.in
> ?Yegor> @@ -0,0 +1,99 @@
> ?Yegor> +config BR2_PACKAGE_BOOST
> ?Yegor> + ? ? ? bool "boost"
> ?Yegor> + ? ? ? select BR2_PACKAGE_BZIP2
> ?Yegor> + ? ? ? select BR2_PACKAGE_ZLIB
>
> You're forgetting a 'depends on BR2_INSTALL_LIBSTCPP'
>
> ?Yegor> + ? ? ? help
> ?Yegor> + ? ? ? ? A general purpose c++ library
>
> s/c++/C++/
>
> ?Yegor> +
> ?Yegor> + ? ? ? ? http://www.boost.org/
> ?Yegor> +
> ?Yegor> +menu "Boost libraries"
> ?Yegor> + ? ? ? depends on BR2_PACKAGE_BOOST
> ?Yegor> +
>
> It makes more sense to put all these options in a
> if BR2_PACKAGE_BOOST
> ..
>
> endif
>
>
> ?Yegor> +config BR2_PACKAGE_BOOST_MULTITHREADED
> ?Yegor> + ? ? ? depends on BR2_PACKAGE_BOOST
> ?Yegor> + ? ? ? bool "boost-multithreaded"
>
> Should depend on BR2_TOOLCHAIN_HAS_THREADS
>
> ?Yegor> +config BR2_PACKAGE_BOOST_THREAD
> ?Yegor> + ? ? ? depends on BR2_PACKAGE_BOOST
> ?Yegor> + ? ? ? bool "boost-thread"
>
> This one as well.

Thanks. Now I almost have my environment.

Yegor
