From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 14 Nov 2018 19:49:59 -0600
Subject: [Buildroot] [PATCH 1/1] websocketpp: new package
In-Reply-To: <20181114214325.25574-1-ryan.barnett@rockwellcollins.com>
References: <20181114214325.25574-1-ryan.barnett@rockwellcollins.com>
Message-ID: <CANQCQpaU=JxRGpUKdvXab_RduGNGxrnZjMurhYaji4PEm_8ZSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan,


On Wed, Nov 14, 2018 at 3:43 PM Ryan Barnett
<ryan.barnett@rockwellcollins.com> wrote:
>
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/websocketpp/Config.in        | 15 +++++++++++++++
>  package/websocketpp/websocketpp.hash |  3 +++
>  package/websocketpp/websocketpp.mk   | 15 +++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/websocketpp/Config.in
>  create mode 100644 package/websocketpp/websocketpp.hash
>  create mode 100644 package/websocketpp/websocketpp.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 53467da489..7c21b2f520 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1822,6 +1822,7 @@ F:        package/python-pysnmp/
>  F:     package/python-pysnmp-apps/
>  F:     package/python-pysnmp-mibs/
>  F:     package/python-tornado/
> +F:     package/websocketpp/
>
>  N:     Ryan Coe <bluemrp9@gmail.com>
>  F:     package/inadyn/
> diff --git a/package/Config.in b/package/Config.in
> index b60e7700ad..b6abeee8e2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1582,6 +1582,7 @@ menu "Networking"
>         source "package/sofia-sip/Config.in"
>         source "package/thrift/Config.in"
>         source "package/usbredir/Config.in"
> +       source "package/websocketpp/Config.in"

Alphabetical

>         source "package/wampcc/Config.in"
>         source "package/zeromq/Config.in"
>         source "package/zmqpp/Config.in"
> diff --git a/package/websocketpp/Config.in b/package/websocketpp/Config.in
> new file mode 100644
> index 0000000000..cadb9ff696
> --- /dev/null
> +++ b/package/websocketpp/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_WEBSOCKETPP
> +       bool "websocketpp"
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       help
> +         WebSocket++ is a header only C++ library that implements
> +         RFC6455 The WebSocket Protocol. It allows integrating
> +         WebSocket client and server functionality into C++ programs.
> +         It uses interchangeable network transport modules including
> +         one based on C++ iostreams and one based on Boost Asio.
> +
> +         http://www.zaphoyd.com/websocketpp
> +
> +comment "websocketpp needs a toolchain w/ C++ and gcc >= 4.8"
> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> diff --git a/package/websocketpp/websocketpp.hash b/package/websocketpp/websocketpp.hash
> new file mode 100644
> index 0000000000..8bf671d96e
> --- /dev/null
> +++ b/package/websocketpp/websocketpp.hash
> @@ -0,0 +1,3 @@
> +# Locally Computed:
> +sha256  178899de48c02853b55b1ea8681599641cedcdfce59e56beaff3dd0874bf0286  websocketpp-0.8.1.tar.gz
> +sha256  b31e597bc777d884a39663c11d0557a0af40780e1f451de11ea5103924a69667  COPYING
> diff --git a/package/websocketpp/websocketpp.mk b/package/websocketpp/websocketpp.mk
> new file mode 100644
> index 0000000000..47da4dbe2f
> --- /dev/null
> +++ b/package/websocketpp/websocketpp.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# websocketpp
> +#
> +################################################################################
> +
> +WEBSOCKETPP_VERSION = 0.8.1
> +WEBSOCKETPP_SITE = $(call github,zaphoyd,websocketpp,$(WEBSOCKETPP_VERSION))
> +WEBSOCKETPP_LICENSE = BSD-3c, MIT, Zlib
> +WEBSOCKETPP_LICENSE_FILES = COPYING
> +WEBSOCKETPP_INSTALL_STAGING = YES
> +# Only installs headers
> +WEBSOCKETPP_INSTALL_TARGET = NO
> +
> +$(eval $(cmake-package))
> --
> 2.18.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
