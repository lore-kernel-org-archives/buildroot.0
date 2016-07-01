From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jul 2016 14:34:16 +0200
Subject: [Buildroot] [PATCH 3/4] Package netsnmp: Added missing reload
 of snmptrapd
In-Reply-To: <1456435484-4723-3-git-send-email-universeII@gmx.de>
References: <1456435484-4723-1-git-send-email-universeII@gmx.de>
 <1456435484-4723-3-git-send-email-universeII@gmx.de>
Message-ID: <20160701123416.GA25487@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All

[not sure why, but my previous reply did not make it to the list...]

On 2016-02-25 22:24 +0100, Andreas Ehmanns spake thusly:
> In case of a reload command the snmpdtrapd wasn't
> restarted.
> 
> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/netsnmp/S59snmpd | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
> index 2762082..2d076e0 100755
> --- a/package/netsnmp/S59snmpd
> +++ b/package/netsnmp/S59snmpd
> @@ -65,6 +65,11 @@ reload() {
>          start-stop-daemon -q -K -s 1 -p /var/run/snmpd.pid -x /usr/sbin/snmpd
>          printf " snmpd"
>      fi
> +
> +    if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
> +        start-stop-daemon -q -K -s 1 -p /var/run/snmptrapd.pid -x /usr/sbin/snmptrapd
> +        printf " snmptrapd"
> +    fi
>      echo "."
>  }
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
