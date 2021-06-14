From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Jun 2021 22:30:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-dataproperty: drop
 python-six dependency
In-Reply-To: <20210425092931.2390021-1-fontaine.fabrice@gmail.com>
References: <20210425092931.2390021-1-fontaine.fabrice@gmail.com>
Message-ID: <fa2d93b3-7dda-f352-b3c0-e589800d71ac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/04/2021 11:29, Fabrice Fontaine wrote:
> python-six is not a dependency since drop of python 2 in version 0.47.0:
> https://github.com/thombashi/DataProperty/commit/d3fdde41af0151e2f04a3a79bea1fb33a28a98f7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Both applied ot master, thanks.

 Regards,
 Arnout

> ---
>  package/python-dataproperty/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/python-dataproperty/Config.in b/package/python-dataproperty/Config.in
> index 2c5da40ff2..3de9cc685e 100644
> --- a/package/python-dataproperty/Config.in
> +++ b/package/python-dataproperty/Config.in
> @@ -1,8 +1,7 @@
>  config BR2_PACKAGE_PYTHON_DATAPROPERTY
>  	bool "python-dataproperty"
> -	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder
> +	depends on BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
> -	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
>  	help
>  	  Python library for extract property from data.
> 
