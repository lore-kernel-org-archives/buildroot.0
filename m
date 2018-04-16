From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 16 Apr 2018 16:07:52 +0200
Subject: [Buildroot] [PATCH 08/26] modem-manager: don't test if the
 binary exists in the init script
In-Reply-To: <20180416022944.13644-9-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
 <20180416022944.13644-9-casantos@datacom.ind.br>
Message-ID: <20180416140751.tak7uodrofojmccc@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> The test doesn't make sense. It just exits without any error if the
> binary doesn't exist, which is silly.

> Drop the MODEMMANAGER_BIN variable, which was never initialized.

> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
Acked-by: Petr Vorel <petr.vorel@gmail.com>


...
> +++ b/package/modem-manager/S44modem-manager
> @@ -5,8 +5,6 @@

>  PIDFILE=/var/run/ModemManager.pid

> -[ -x $MODEMMANAGER_BIN ] || exit 0
> -
>  start() {
>  	printf "Starting ModemManager: "
>  	umask 077


Kind regards,
Petr
