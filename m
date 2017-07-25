From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 25 Jul 2017 07:12:30 +0200
Subject: [Buildroot] Bump on python service identity is missing python
 attrs dependency
In-Reply-To: <CAAnoztEx0PwsjO6nnG=AADr43xHTf-J2HEFi+SZyYpTCRkOMyA@mail.gmail.com>
References: <CAAnoztEx0PwsjO6nnG=AADr43xHTf-J2HEFi+SZyYpTCRkOMyA@mail.gmail.com>
Message-ID: <CAGm1_kv-30d4dnRqPQA10z3hqssHdZfkbBALph151O9jZ9jUeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 24, 2017 at 9:25 PM, Charles Hardin <ckhardin@exablox.com> wrote:
> commit f28c92f05fd2ffd8e1892a005f994fa41952574b
>
> Author: Charles Hardin <ckhardin@exablox.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

>
> Date:   Sun Jul 23 21:40:52 2017 -0700
>
>
>     package/python-service-identity: the attrs distribution is required
>
>
>
>     Apparently the service identify code requires the python attrs
>
>     to be availabe:
>
>
>
>     Traceback (most recent call last):
>
>       File "/opt/exablox/bin/configsrv", line 5, in <module>
>
>         from pkg_resources import load_entry_point
>
>       File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py",
> line 3138, in <module>
>
>         @_call_aside
>
>       File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py",
> line 3124, in _call_aside
>
>         f(*args, **kwargs)
>
>       File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py",
> line 3151, in _initialize_master_working_set
>
>         working_set = WorkingSet._build_master()
>
>       File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py",
> line 661, in _build_master
>
>         ws.require(__requires__)
>
>       File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py",
> line 962, in require
>
>         needed = self.resolve(parse_requirements(requirements))
>
>       File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py",
> line 849, in resolve
>
>         raise DistributionNotFound(req, requirers)
>
>     pkg_resources.DistributionNotFound: The 'attrs' distribution was not
> found and is required by service-identity
>
>
> diff --git a/package/python-service-identity/Config.in
> b/package/python-service-identity/Config.in
>
> index c9cbb6c..eaabf33 100644
>
> --- a/package/python-service-identity/Config.in
>
> +++ b/package/python-service-identity/Config.in
>
> @@ -1,5 +1,6 @@
>
>  config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
>
>         bool "python-service-identity"
>
> +       select BR2_PACKAGE_PYTHON_ATTRS # runtime
>
>         select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
>
>         select BR2_PACKAGE_PYTHON_PYASN # runtime
>
>         select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
