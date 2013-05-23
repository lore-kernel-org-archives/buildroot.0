From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 May 2013 08:54:06 +0200
Subject: [Buildroot] [PATCH 2/5] tvheadend: needs threads
In-Reply-To: <1369268647-13128-2-git-send-email-gilles.talis@gmail.com>
References: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
 <1369268647-13128-2-git-send-email-gilles.talis@gmail.com>
Message-ID: <20130523065406.GC3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2013-05-22 17:24 -0700, Gilles Talis spake thusly:
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  package/tvheadend/Config.in |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
> index 19ab276..7083b01 100644
> --- a/package/tvheadend/Config.in
> +++ b/package/tvheadend/Config.in
> @@ -1,9 +1,10 @@
> -comment "tvheadend requires a toolchain with LARGEFILE and IPv6 support"
> -    depends on !BR2_LARGEFILE || !BR2_INET_IPV6
> +comment "tvheadend needs a toolchain with LARGEFILE, IPv6 and THREADS support"
> +    depends on !BR2_LARGEFILE || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
>  
>  config BR2_PACKAGE_TVHEADEND
>  	bool "tvheadend"
>  	depends on BR2_LARGEFILE && BR2_INET_IPV6
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Is it because tvheadend selects dvb-apps that it requires threads, or
does it itself require threads?

If the former, then:
	depends on BR2_TOOLCHAIN_HAS_THREADS # dvb-apps

If the latter, then OK.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
