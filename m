From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Jan 2018 09:36:07 +0100
Subject: [Buildroot] [PATCH] python-txtorcon: needs C++ support
In-Reply-To: <20180121220916.27851-1-peter@korsgaard.com>
References: <20180121220916.27851-1-peter@korsgaard.com>
Message-ID: <CAGm1_ksjN2SM93SOd08HaYKub06mJ40omMfi4yYDHeObTX8o7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 21, 2018 at 11:09 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Python-txtorcon selects python-pyopenssl and python-service-identity, both
> (indirectly) needing C++ support, so propagate that dependency.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-txtorcon/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/python-txtorcon/Config.in b/package/python-txtorcon/Config.in
> index c4081ab0a3..4f91e7b048 100644
> --- a/package/python-txtorcon/Config.in
> +++ b/package/python-txtorcon/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_TXTORCON
>         bool "python-txtorcon"
> +       depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-service-identity
>         select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
>         select BR2_PACKAGE_PYTHON_IDNA # runtime
>         select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
> @@ -13,3 +14,6 @@ config BR2_PACKAGE_PYTHON_TXTORCON
>           configuration abstractions.
>
>           https://github.com/meejah/txtorcon
> +
> +comment "python-txtorcon needs a toolchain w/ C++"
> +       depends on !BR2_INSTALL_LIBSTDCPP

Good catch. Is anyone working on bumping OpenSSL to 1.1.0 series? Then
we could bump python-cryptography and get rid of C++ dependency.

Yegor
