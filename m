From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Jan 2017 22:32:54 +0100
Subject: [Buildroot] [PATCH v2 1/3] python-protobuf: Allow host building
In-Reply-To: <20170112191523.23814-2-wak@google.com>
References: <20161209011313.9549-1-wak@google.com>
 <20170112191523.23814-1-wak@google.com>
 <20170112191523.23814-2-wak@google.com>
Message-ID: <20170115213254.GD4277@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wlliam, All,

On 2017-01-12 11:15 -0800, William A. Kennington III spake thusly:
> Currently python-protobuf does not allow be built as a host package
> during a cross compile. We would like to be able to build nanopb as a
> host package but can't without host-python-protobuf.
> 
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  package/python-protobuf/python-protobuf.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
> index d8be76dd7..d46bda243 100644
> --- a/package/python-protobuf/python-protobuf.mk
> +++ b/package/python-protobuf/python-protobuf.mk
> @@ -13,4 +13,5 @@ PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
>  PYTHON_PROTOBUF_SETUP_TYPE = setuptools
>  PYTHON_PROTOBUF_SUBDIR = python
>  
> +$(eval $(host-python-package))

Oh, I forgot: the dependencies for the host variant must be explicitly
specified:

    HOST_PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf

Regards,
Yann E. MORIN.

>  $(eval $(python-package))
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
