From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 13 Feb 2015 10:31:36 +0100
Subject: [Buildroot] [PATCH] package/python: enable xml libraries
In-Reply-To: <1423818347-3390-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1423818347-3390-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <CAGm1_ktnh-NfHS4mXQuE6gk+thaAyT1MB6xE38Km+jqKgW0Jog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 13, 2015 at 10:05 AM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> This patch adds the option to include xml libraries in python.
>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/python/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/python/Config.in b/package/python/Config.in
> index 87defad..682a324 100644
> --- a/package/python/Config.in
> +++ b/package/python/Config.in
> @@ -114,6 +114,12 @@ config BR2_PACKAGE_PYTHON_SQLITE
>         help
>           SQLite database support
>
> +config BR2_PACKAGE_PYTHON_XML
> +       bool "xml module"
> +       select BR2_PACKAGE_PYTHON_PYEXPAT
> +       help
> +         Xml libraries for Python
> +

What about this existing option?

config BR2_PACKAGE_PYTHON_PYEXPAT
        select BR2_PACKAGE_EXPAT
        bool "pyexpat"
        help
          pyexpat module for Python.

Yegor

>  config BR2_PACKAGE_PYTHON_ZLIB
>         bool "zlib module"
>         select BR2_PACKAGE_ZLIB
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
