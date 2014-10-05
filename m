From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 05 Oct 2014 13:48:25 -0300
Subject: [Buildroot] [PATCH 8/8] package/php: Add Apache support
In-Reply-To: <20141005155638.GM4220@free.fr>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
 <1412516718-12597-8-git-send-email-bernd.kuhls@t-online.de>
 <20141005155638.GM4220@free.fr>
Message-ID: <54317659.7090206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/05/2014 12:56 PM, Yann E. MORIN wrote:
> Unrelated to your patch, but this choice is getting ugly. Maybe we should
> switch to something like:
> 
>     config BR2_PACKAGE_PHP
>         bool "php"
>         select BR2_PACKAGE_PHP_SAPI_CGI if !BR2_PACKAGE_PHP_HAS_SAPI
> 
>     config BR2_PACKAGE_PHP_HAS_SAPI
>         bool
> 
>     config BR2_PACKAGE_PHP_SAPI_CGI
>         bool "CGI"
> 
>     config BR2_PACKAGE_PHP_SAPI_CLI
>         bool "CLI"
>         select BR2_PACKAGE_PHP_HAS_SAPI
> 
>     config BR2_PACKAGE_PHP_SAPI_APACHE
>         bool "Apache"
>         select BR2_PACKAGE_PHP_HAS_SAPI
> 
>     config BR2_PACKAGE_PHP_SAPI_FPM
>         bool "FPM"
>         select BR2_PACKAGE_PHP_HAS_SAPI
> 
> That way, we ensure at least one is selected, which was the initial
> reason for the choice, while stil allowing multiple to be selected.

+1 the choice is going wild.

> Then, if some are incompatible, we could do, for example:

AFAIK you can combine anything the way you like as long as the
dependencies are met since the php build system rebuilds for each case.
Regards.
