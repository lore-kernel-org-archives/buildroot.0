From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Jul 2015 23:54:47 +0200
Subject: [Buildroot] [PATCH] postgresql: init script: wait till server
 has started
In-Reply-To: <1432574426-17098-2-git-send-email-bos@je-eigen-domein.nl>
References: <1432574426-17098-1-git-send-email-bos@je-eigen-domein.nl>
 <1432574426-17098-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150710215447.GA5469@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2015-05-25 19:20 +0200, Floris Bos spake thusly:
> Adds "-w" option to init script to wait till the database server
> has fully started and accepts connections before continuing.
> 
> Prevents other applications that depend on PostgreSQL from
> failing to start, if the database server is not ready yet.
> Times out after 60 seconds by default.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/postgresql/S50postgresql | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
> index 86a8d83..a895bcf 100644
> --- a/package/postgresql/S50postgresql
> +++ b/package/postgresql/S50postgresql
> @@ -13,7 +13,7 @@ fi
>  
>  start() {
>  	echo -n "Starting postgresql: "
> -	su - postgres -c '/usr/bin/pg_ctl start -D /var/lib/pgsql -l logfile'
> +	su - postgres -c '/usr/bin/pg_ctl start -w -D /var/lib/pgsql -l logfile'
>  	echo "OK"
>  }
>  stop() {
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
