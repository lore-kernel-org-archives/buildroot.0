From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 9 Jun 2017 21:35:44 +0200
Subject: [Buildroot] [PATCH v3 10/11] package/python-ipython: Add
 dependecy list
In-Reply-To: <20170602235653.4655-11-andrew.smirnov@gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170602235653.4655-11-andrew.smirnov@gmail.com>
Message-ID: <CAGm1_ktZaacBWNkQ1Ehs_HKaagnSwE31wfODxYbu=53uzipe9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 3, 2017 at 1:56 AM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> List minimal set of packages needed to be installed alongside to be able
> to run IPython with Python 2/3.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  package/python-ipython/Config.in | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
> index b87f2bc..6a5bf8d 100644
> --- a/package/python-ipython/Config.in
> +++ b/package/python-ipython/Config.in
> @@ -1,5 +1,14 @@
>  config BR2_PACKAGE_PYTHON_IPYTHON
>         bool "python-ipython"
> +       select BR2_PACKAGE_PYTHON_PEXPECT
> +       select BR2_PACKAGE_PYTHON_PATHLIB2 if BR2_PACKAGE_PYTHON
> +       select BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE if BR2_PACKAGE_PYTHON
> +       select BR2_PACKAGE_PYTHON_TRAITLETS
> +       select BR2_PACKAGE_PYTHON_SIMPLEGENERIC
> +       select BR2_PACKAGE_PYTHON_PYGMENTS
> +       select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
> +       select BR2_PACKAGE_PYTHON_PICKLESHARE
> +       select BR2_PACKAGE_PYTHON_DECORATOR

# runtime tag missing

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

>         help
>           IPython is a command shell for interactive computing in
>           multiple programming languages, originally developed for the
> --
> 2.9.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
