From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2020 21:13:18 +0200
Subject: [Buildroot] [PATCH] package/python-tinyrpc: not available for
 python 2.x
In-Reply-To: <20200929204557.28901-1-peter@korsgaard.com>
References: <20200929204557.28901-1-peter@korsgaard.com>
Message-ID: <20200930191318.GR11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-09-29 22:45 +0200, Peter Korsgaard spake thusly:
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

Applied to master, thanks.

Regards,
Yann E. MORIN.

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
>  	bool "python-tinyrpc"
> +	depends on BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	help
>  	  A small, modular, transport and protocol neutral RPC
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
