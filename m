From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jul 2016 14:36:44 +0200
Subject: [Buildroot] [PATCH 4/4] Package netsnmp: Added OK/FAIL output
In-Reply-To: <1456435484-4723-4-git-send-email-universeII@gmx.de>
References: <1456435484-4723-1-git-send-email-universeII@gmx.de>
 <1456435484-4723-4-git-send-email-universeII@gmx.de>
Message-ID: <20160701123644.GB25487@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2016-02-25 22:24 +0100, Andreas Ehmanns spake thusly:
> Reworked output of start(), stop() and reload() functions.
> Return values of start-stop-daemon are now checked and
> a OK or FAIL message is printed out.
> 
> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
> ---
>  package/netsnmp/S59snmpd | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
> index 2d076e0..94773db 100755
> --- a/package/netsnmp/S59snmpd
> +++ b/package/netsnmp/S59snmpd
[--SNIP--]
> @@ -92,6 +98,7 @@ case "$1" in
>      reload|force-reload)
>          reload
>          ;;
> +

Spurious empty line.

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>      *)
>          echo "Usage: $0 {start|stop|restart|reload|force-reload}"
>          exit 1
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
