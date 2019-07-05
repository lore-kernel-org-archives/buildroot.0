From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 5 Jul 2019 14:09:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-zeroconf: depends on
 ifaddr instead of netifaces
In-Reply-To: <20190705115712.18252-2-grzegorz@blach.pl>
References: <20190705115712.18252-1-grzegorz@blach.pl>
 <20190705115712.18252-2-grzegorz@blach.pl>
Message-ID: <CAGm1_ktopbHn_8JgJEhCPjmdPpRhXpswPZOy_pp76M0ehReV=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 5, 2019 at 1:57 PM Grzegorz Blach <grzegorz@blach.pl> wrote:
>
> Starting from 0.21.0 zeroconf uses pure-python ifaddr module
> instead of netifaces.
>
> Currently we have zeroconf 0.23.0, so this module raises
> ModuleNotFoundError exception during import.
>
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-zeroconf/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/python-zeroconf/Config.in b/package/python-zeroconf/Config.in
> index ac1acbbd8c..a56bf7c16c 100644
> --- a/package/python-zeroconf/Config.in
> +++ b/package/python-zeroconf/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_PYTHON_ZEROCONF
>         bool "python-zeroconf"
>         depends on BR2_PACKAGE_PYTHON3
> -       select BR2_PACKAGE_PYTHON_NETIFACES # runtime
> +       select BR2_PACKAGE_PYTHON_IFADDR # runtime
>         help
>           Pure Python Multicast DNS Service Discovery Library
>           (Bonjour/Avahi compatible).
> --
> 2.22.0
>
