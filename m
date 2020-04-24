From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 13:51:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-dataproperty: depend on
 python3
In-Reply-To: <20200424080525.358-1-asafka7@gmail.com>
References: <20200424080525.358-1-asafka7@gmail.com>
Message-ID: <20200424115150.GI5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asaf, All,

On 2020-04-24 11:05 +0300, Asaf Kahlon spake thusly:
> The package has dropped support for python 2.
> Update all the reverse recursive dependencies accordingly.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/c39c0dddef296c9245ff9a6e35911ade8444bdc2/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Could you pleas ereview the patch from Fabrice that he sent two days
ago, and seems to address the wider issue, including python-mbstrdecoder:

    https://patchwork.ozlabs.org/project/buildroot/patch/20200422162418.488244-1-fontaine.fabrice at gmail.com/

Regards,
Yann E. MORIN.

> ---
>  package/python-dataproperty/Config.in  | 4 +---
>  package/python-pytablewriter/Config.in | 3 +--
>  package/python-simplesqlite/Config.in  | 2 +-
>  package/python-sqliteschema/Config.in  | 1 +
>  package/python-tabledata/Config.in     | 3 +--
>  5 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-dataproperty/Config.in b/package/python-dataproperty/Config.in
> index 2d42b02c6c..df83faf46d 100644
> --- a/package/python-dataproperty/Config.in
> +++ b/package/python-dataproperty/Config.in
> @@ -1,8 +1,6 @@
>  config BR2_PACKAGE_PYTHON_DATAPROPERTY
>  	bool "python-dataproperty"
> -	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
> -	select BR2_PACKAGE_PYTHON_FUTURES if BR2_PACKAGE_PYTHON # runtime
> -	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
> +	depends on BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
>  	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
> diff --git a/package/python-pytablewriter/Config.in b/package/python-pytablewriter/Config.in
> index 9fed52c83f..559ab8dc6c 100644
> --- a/package/python-pytablewriter/Config.in
> +++ b/package/python-pytablewriter/Config.in
> @@ -1,8 +1,7 @@
>  config BR2_PACKAGE_PYTHON_PYTABLEWRITER
>  	bool "python-pytablewriter"
> +	depends on BR2_PACKAGE_PYTHON3 # python-dataproperty
>  	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
> -	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
> -	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
>  	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
>  	select BR2_PACKAGE_PYTHON_MSGFY # runtime
>  	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
> diff --git a/package/python-simplesqlite/Config.in b/package/python-simplesqlite/Config.in
> index c03411b90f..0029752741 100644
> --- a/package/python-simplesqlite/Config.in
> +++ b/package/python-simplesqlite/Config.in
> @@ -1,11 +1,11 @@
>  config BR2_PACKAGE_PYTHON_SIMPLESQLITE
>  	bool "python-simplesqlite"
> +	depends on BR2_PACKAGE_PYTHON3 # python-dataproperty
>  	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
>  	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
>  	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
>  	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
>  	select BR2_PACKAGE_PYTHON_SIX # runtime
> -	select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON # runtime
>  	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3 # runtime
>  	select BR2_PACKAGE_PYTHON_SQLITESCHEMA # runtime
>  	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
> diff --git a/package/python-sqliteschema/Config.in b/package/python-sqliteschema/Config.in
> index b9568adbea..0b553f392e 100644
> --- a/package/python-sqliteschema/Config.in
> +++ b/package/python-sqliteschema/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_SQLITESCHEMA
>  	bool "python-sqliteschema"
> +	depends on BR2_PACKAGE_PYTHON3 # python-tabledata
>  	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
>  	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
>  	select BR2_PACKAGE_PYTHON_SIX # runtime
> diff --git a/package/python-tabledata/Config.in b/package/python-tabledata/Config.in
> index bd856d23e4..db46ce25d0 100644
> --- a/package/python-tabledata/Config.in
> +++ b/package/python-tabledata/Config.in
> @@ -1,9 +1,8 @@
>  config BR2_PACKAGE_PYTHON_TABLEDATA
>  	bool "python-tabledata"
> +	depends on BR2_PACKAGE_PYTHON3 # python-dataproperty
>  	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
>  	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
> -	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
> -	select BR2_PACKAGE_PYTHON_FUTURES if BR2_PACKAGE_PYTHON # runtime
>  	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
>  	help
> -- 
> 2.26.2
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
