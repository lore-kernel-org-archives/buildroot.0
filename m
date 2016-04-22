From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 22 Apr 2016 16:49:48 +0200
Subject: [Buildroot] [PATCH 3/3] python-tornado: add Python 2
	dependencies
In-Reply-To: <1461332190-18340-3-git-send-email-yegorslists@googlemail.com>
References: <1461332190-18340-1-git-send-email-yegorslists@googlemail.com>
 <1461332190-18340-3-git-send-email-yegorslists@googlemail.com>
Message-ID: <CAGm1_kvArs0_DB-7sa40GyjMOc9J6YnPKavN355NcrDFJ0PYXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 22, 2016 at 3:36 PM,  <yegorslists@googlemail.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Some Python programs check dependencies of used Python packages at
> runtime. As both python-backports-ssl-match-hostname and python-certifi
> are not required for Python > 2.7.9, they are not required for tornado
> to work. But tornado's setup.py checks only major and minor Python
> versions, so such packages as python-circus will fail, if those
> packages are not present at runtime.
>
> Fixes #8856
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

This patch depends on http://patchwork.ozlabs.org/patch/613610/

Just didn't want to start a patch series with v2.

Yegor

> ---
>  package/python-tornado/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
> index ac86682..80db2fd 100644
> --- a/package/python-tornado/Config.in
> +++ b/package/python-tornado/Config.in
> @@ -2,8 +2,10 @@ config BR2_PACKAGE_PYTHON_TORNADO
>         bool "python-tornado"
>         select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
>         select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
> -       select BR2_PACKAGE_PYTHON_SINGLEDISPATCH if BR2_PACKAGE_PYTHON # runtime
>         select BR2_PACKAGE_PYTHON_BACKPORTS_ABC # runtime
> +       select BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME if BR2_PACKAGE_PYTHON # runtime
> +       select BR2_PACKAGE_PYTHON_SINGLEDISPATCH if BR2_PACKAGE_PYTHON # runtime
> +       select BR2_PACKAGE_PYTHON_CERTIFI if BR2_PACKAGE_PYTHON # runtime
>         help
>           Tornado is a Python web framework and asynchronous networking
>           library, originally developed at FriendFeed.
> --
> 2.8.0.rc3
>
