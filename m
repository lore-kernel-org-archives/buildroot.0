From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jul 2016 12:10:42 +0200
Subject: [Buildroot] [PATCH 2/4] Package netsnmp: Removed 'set -e'
In-Reply-To: <1456435484-4723-2-git-send-email-universeII@gmx.de>
References: <1456435484-4723-1-git-send-email-universeII@gmx.de>
 <1456435484-4723-2-git-send-email-universeII@gmx.de>
Message-ID: <20160701101042.GC3659@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2016-02-25 22:24 +0100, Andreas Ehmanns spake thusly:
> set -e has been removed from init script since
> it causes the init script to terminate if an
> error occurs. This prevents the script to create
> an "FAIL" printout in case of an error.

And we're not doing it consistently either. I've looked at the startup
script for busybox (mdev, watchdog, telnet, logging) and none uses
'set -e'.

> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/netsnmp/S59snmpd | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
> index cfda625..2762082 100755
> --- a/package/netsnmp/S59snmpd
> +++ b/package/netsnmp/S59snmpd
> @@ -1,4 +1,4 @@
> -#! /bin/sh -e
> +#! /bin/sh
>  ### BEGIN INIT INFO
>  # Provides:           snmpd snmptrapd
>  # Required-Start:     $network $local_fs
> @@ -11,7 +11,6 @@
>  #
>  # Author:    Jochen Friedrich <jochen@scram.de>
>  #
> -set -e
>  
>  export PATH=/sbin:/usr/sbin:/bin:/usr/bin
>  
> -- 
> 2.1.4
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
