From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 22:56:29 +0200
Subject: [Buildroot] [PATCH 20/25] package/python3-decorator: add
 _CPE_ID_VENDOR and _CPE_ID_PRODUCT
In-Reply-To: <20210420201146.42858-20-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
 <20210420201146.42858-20-matthew.weber@rockwellcollins.com>
Message-ID: <20210420205629.GH298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-04-20 15:11 -0500, Matt Weber spake thusly:
> cpe:2.3:a:python:decorator:* is a valid CPE identifier for this package:
> 
>  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:python:decorator
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/python3-decorator/python3-decorator.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python3-decorator/python3-decorator.mk b/package/python3-decorator/python3-decorator.mk
> index c14f10fbf4..e6f940a95c 100644
> --- a/package/python3-decorator/python3-decorator.mk
> +++ b/package/python3-decorator/python3-decorator.mk
> @@ -11,6 +11,8 @@ PYTHON3_DECORATOR_SOURCE = decorator-$(PYTHON3_DECORATOR_VERSION).tar.gz
>  PYTHON3_DECORATOR_LICENSE = BSD-2-Clause
>  PYTHON3_DECORATOR_LICENSE_FILES = LICENSE.txt
>  PYTHON3_DECORATOR_SETUP_TYPE = setuptools
> +PYTHON3_DECORATOR_CPE_ID_VENDOR = python
> +PYTHON3_DECORATOR_CPE_ID_PRODUCT = decorator

At the top of the file, there's a comment:

    # Please keep in sync with package/python-decorator/python-decorator.mk

So, could you respin this one with both packages changed at once,
please?

Regards,
Yann E. MORIN.

>  HOST_PYTHON3_DECORATOR_NEEDS_HOST_PYTHON = python3
>  
>  $(eval $(host-python-package))
> -- 
> 2.17.1
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
