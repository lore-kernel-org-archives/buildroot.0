From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 1 May 2017 23:28:11 +0200
Subject: [Buildroot] [PATCH v2] daemon: new package
In-Reply-To: <a92dc5869d0e5e3868f928293c8d68f2558728ef.1493668995.git.baruch@tkos.co.il>
References: <a92dc5869d0e5e3868f928293c8d68f2558728ef.1493668995.git.baruch@tkos.co.il>
Message-ID: <47ac8a79-3586-a052-77df-3a4759c5e8d8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 01/05/2017 ? 22:03, Baruch Siach a ?crit :
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: add target installation (thanks Romain)
> ---

> new file mode 100644
> index 000000000000..30954e77edc7
> --- /dev/null
> +++ b/package/daemon/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_DAEMON
> +	bool "daemon"
> +	depends on BR2_USE_MMU # fork()

It also needs thread support:

In file included from libslack/coproc.c:56:0:
libslack/std.h:102:21: fatal error: pthread.h: No such file or directory

Best regards,
Romain

> +	help
> +	  Daemon turns other process into daemons.
> +
> +	  http://www.libslack.org/daemon/

> 
