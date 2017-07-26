From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 26 Jul 2017 21:11:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-service-identity: the
 attrs distribution is required
In-Reply-To: <20170726185956.49090-1-ckhardin@exablox.com>
References: <20170726185956.49090-1-ckhardin@exablox.com>
Message-ID: <CAGm1_kuEuDg97ddiffggCbiEADQfSWeESOH7Y0xe1OUjdP==pQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 26, 2017 at 8:59 PM, Charles Hardin <ckhardin@exablox.com> wrote:
> Apparently the service identify code requires the python attrs
> to be availabe:
>
> Traceback (most recent call last):
>   File "/opt/exablox/bin/configsrv", line 5, in <module>
>     from pkg_resources import load_entry_point
>   File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3138, in <module>
>     @_call_aside
>   File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3124, in _call_aside
>     f(*args, **kwargs)
>   File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3151, in _initialize_master_working_set
>     working_set = WorkingSet._build_master()
>   File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 661, in _build_master
>     ws.require(__requires__)
>   File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 962, in require
>     needed = self.resolve(parse_requirements(requirements))
>   File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 849, in resolve
>     raise DistributionNotFound(req, requirers)
> pkg_resources.DistributionNotFound: The 'attrs' distribution was not found and is required by service-identity
>
> Signed-off-by: Charles Hardin <ckhardin@exablox.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-service-identity/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
> index 304b38acde..73593b0d61 100644
> --- a/package/python-service-identity/Config.in
> +++ b/package/python-service-identity/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
>         bool "python-service-identity"
>         depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
> +       select BR2_PACKAGE_PYTHON_ATTRS # runtime
>         select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
>         select BR2_PACKAGE_PYTHON_PYASN # runtime
>         select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
> --
> 2.11.0 (Apple Git-81)
>
