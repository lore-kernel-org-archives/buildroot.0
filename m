From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 19:01:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/ntp: increase pool server count
 in default config
In-Reply-To: <1432093452-18281-1-git-send-email-imrehg@gmail.com>
References: <1432093452-18281-1-git-send-email-imrehg@gmail.com>
Message-ID: <20150712170101.GC4008@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gergely, All,

On 2015-05-20 03:44 +0000, Gergely Imreh spake thusly:
> To protect agains 1 falsticker NTP server, the client needs to connect
> to at least 4 servers.
> 
> Source:
>  http://support.ntp.org/bin/view/Support/SelectingOffsiteNTPServers
>  5.3.3. Upstream Time Server Quantity
> 
> Signed-off-by: Gergely Imreh <imrehg@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/ntp/ntpd.etc.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/ntp/ntpd.etc.conf b/package/ntp/ntpd.etc.conf
> index 543c8ff..c451aa9 100644
> --- a/package/ntp/ntpd.etc.conf
> +++ b/package/ntp/ntpd.etc.conf
> @@ -1,5 +1,7 @@
>  server 0.pool.ntp.org iburst
>  server 1.pool.ntp.org iburst
> +server 2.pool.ntp.org iburst
> +server 3.pool.ntp.org iburst
>  
>  # Allow only time queries, at a limited rate, sending KoD when in excess.
>  # Allow all local queries (IPv4, IPv6)
> -- 
> 2.1.4
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
