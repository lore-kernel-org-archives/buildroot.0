From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 30 Sep 2020 07:39:15 +0300
Subject: [Buildroot] [PATCH] package/python-tinyrpc: not available for
 python 2.x
In-Reply-To: <20200929204557.28901-1-peter@korsgaard.com>
References: <20200929204557.28901-1-peter@korsgaard.com>
Message-ID: <CALFsTFWL=xqpqCgsj=+pjm4GU5QzHKTaS3wRvn_UEZiuK8jdFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Sep 29, 2020 at 11:46 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> Fixes:
> http://autobuild.buildroot.net/results/eef0969bac04800cec51fa27f1e1ecd3a4c8211e/
>
> tinyrpc 1.x is not compatible with python 2.x, leading to errors during the
> pycompile step:
>
> error:   File "/usr/lib/python2.7/site-packages/tinyrpc/client.py", line 37
>     self, protocol: RPCProtocol, transport: ClientTransport
>                   ^
> SyntaxError: invalid syntax
>
> As also documented in the README:
> The current version will support Python3 only.  Have a look at the 0.9.x
> version if you need Python2 support
>
> https://github.com/mbr/tinyrpc/blob/1.0.4/README.rst
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-tinyrpc/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/python-tinyrpc/Config.in b/package/python-tinyrpc/Config.in
> index 3c643c754a..3194b7825a 100644
> --- a/package/python-tinyrpc/Config.in
> +++ b/package/python-tinyrpc/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_TINYRPC
>         bool "python-tinyrpc"
> +       depends on BR2_PACKAGE_PYTHON3
>         select BR2_PACKAGE_PYTHON_SIX # runtime
>         help
>           A small, modular, transport and protocol neutral RPC
> --
> 2.20.1
>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>

Regards,
Asaf.
