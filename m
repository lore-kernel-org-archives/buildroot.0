From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Apr 2014 23:28:14 +0200
Subject: [Buildroot] [PATCH 1/1] libdrm: Explain dependency on xorg in
 Kconfig
In-Reply-To: <1398594913-14255-1-git-send-email-bernd.kuhls@t-online.de>
References: <1398594913-14255-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140427212814.GA3190@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-04-27 12:35 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libdrm/Config.in |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
> index df95eec..e6a7a42 100644
> --- a/package/libdrm/Config.in
> +++ b/package/libdrm/Config.in
> @@ -21,6 +21,9 @@ config BR2_PACKAGE_LIBDRM_INTEL
>  	help
>  	  installs intel graphics driver
>  
> +comment "libdrm intel driver depends on X.org"
> +	depends on !BR2_PACKAGE_XORG7

This should also "depends on BR2_i386 || BR2_x86_64" because it is am
x86-only option, no?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
