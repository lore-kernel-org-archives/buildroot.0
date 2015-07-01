From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jul 2015 11:16:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: init script for
 systemV-like init systems
In-Reply-To: <1434485488-27833-1-git-send-email-petr.vorel@gmail.com>
References: <1434485488-27833-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150701111602.7b42bf45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr Vorel,

On Tue, 16 Jun 2015 22:11:28 +0200, Petr Vorel wrote:

> +PID=`pidof ModemManager`
> +case "$1" in
> +	start)
> +		echo -n "Starting ModemManager ... "
> +		[ ! -d /var/run/ModemManager ] && install -d /var/run/ModemManager
> +		if [ -z "$PID" ]; then
> +			$MODEMMANAGER_BIN &

Can you use start-stop-daemon instead?

See many other init scripts in Buildroot. For example
package/dropbear/S50dropbear.

> +define MODEM_MANAGER_INSTALL_INIT_SYSV
> +$(INSTALL) -m 0755 -D package/modem-manager/S44modem-manager $(TARGET_DIR)/etc/init.d/S44modem-manager
> +endef

The command should be intended with one tab.

In the mean time, I'll mark your patch as Changes Requested in
patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
