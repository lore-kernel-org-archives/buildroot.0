From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 22:07:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/pigpio: add sysv and systemd
 init scripts
In-Reply-To: <20191111150534.1181-1-grzegorz@blach.pl>
References: <20191111150534.1181-1-grzegorz@blach.pl>
Message-ID: <20200903220715.40ef0cd6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Grzegorz,

Sorry for the long delay in not getting back to you. A few comments
below.

On Mon, 11 Nov 2019 15:05:34 +0000
Grzegorz Blach <grzegorz@blach.pl> wrote:

> diff --git a/package/pigpio/S50pigpio b/package/pigpio/S50pigpio
> new file mode 100644
> index 0000000000..7b2e979600
> --- /dev/null
> +++ b/package/pigpio/S50pigpio
> @@ -0,0 +1,40 @@
> +#!/bin/sh
> +#
> +# Starts pigpio daemon.
> +#

Could you use package/busybox/S01syslogd as a template for this init
script, and model yours to be as similar as possible ?

> +
> +# Allow a few customizations from a config file
> +test -r /etc/default/pigpio && . /etc/default/pigpio
> +
> +start() {
> +	printf "Starting pigpio daemon: "
> +	umask 077

Why do you need this umask ?

> +	pigpiod $PIGPIOD_ARGS

Could you use start-stop-daemon for starting the daemon?

Other than these comments, the whole thing looks pretty good. If you
respin soon, I promise to apply quickly!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
