From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 17:27:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/poco: PDF needs XML,
 JSON and Util
In-Reply-To: <20200229101743.2479442-1-fontaine.fabrice@gmail.com>
References: <20200229101743.2479442-1-fontaine.fabrice@gmail.com>
Message-ID: <20200229162752.GM8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-29 11:17 +0100, Fabrice Fontaine spake thusly:
> PDF needs XML, JSON and Util since version 1.9.0 and
> https://github.com/pocoproject/poco/commit/c5acb2ac27a81a429e146780769f965e8284cadc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/294b604a0e37aafbe085f0e6f0d1a83ab110c3a4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/poco/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index 7e1257146c..f8f921de04 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -54,6 +54,9 @@ config BR2_PACKAGE_POCO_CPP_PARSER
>  
>  config BR2_PACKAGE_POCO_PDF
>  	bool "pdf"
> +	select BR2_PACKAGE_POCO_JSON
> +	select BR2_PACKAGE_POCO_UTIL
> +	select BR2_PACKAGE_POCO_XML
>  
>  config BR2_PACKAGE_POCO_REDIS
>  	bool "redis"
> -- 
> 2.25.0
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
