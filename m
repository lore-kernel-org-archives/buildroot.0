From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 23:27:59 +0200
Subject: [Buildroot] [PATCH 1/1] i2pd: new package
In-Reply-To: <20180315195012.12760-1-fontaine.fabrice@gmail.com>
References: <20180315195012.12760-1-fontaine.fabrice@gmail.com>
Message-ID: <20180325232759.51802cb4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Mar 2018 20:50:12 +0100, Fabrice Fontaine wrote:
> i2pd (I2P Daemon) is a full-featured C++ implementation of I2P
> client.
> 
> I2P (Invisible Internet Protocol) is a universal anonymous
> network layer.
> All communications over I2P are anonymous and end-to-end
> encrypted, participants don't reveal their real IP addresses.
> 
> http://i2pd.website
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Generally looks good. Just a few questions.

>  ...ix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch | 28 +++++++++
>  package/i2pd/0002-Install-libi2pdclient.patch      | 69 +++++++++++++++++++++

Did you send those patches upstream ?


> diff --git a/package/i2pd/S99i2pd b/package/i2pd/S99i2pd
> new file mode 100644
> index 0000000000..68ba792dd2
> --- /dev/null
> +++ b/package/i2pd/S99i2pd
> @@ -0,0 +1,38 @@
> +#!/bin/sh
> +
> +NAME=i2pd
> +PIDFILE=/var/run/$NAME.pid
> +DAEMON=/usr/bin/$NAME
> +DAEMON_ARGS="--conf=/etc/i2pd/i2pd.conf --tunconf=/etc/i2pd/tunnels.conf --pidfile=/var/run/i2pd.pid --logfile=/var/log/i2pd.log --daemon --service"
> +
> +start() {
> +	printf "Starting $NAME: "
> +	$DAEMON $DAEMON_ARGS
> +	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +stop() {
> +	printf "Stopping $NAME: "
> +	kill $PIDFILE
> +	[ $? = 0 ] && echo "OK" || echo "FAIL"

Any reason not to use start-stop-daemon in this init script ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
