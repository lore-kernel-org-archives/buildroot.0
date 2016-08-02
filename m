From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 22:14:38 +0200
Subject: [Buildroot] [PATCH] lldpd: add sysv init script
In-Reply-To: <20160802162411.19412-1-vivien.didelot@savoirfairelinux.com>
References: <20160802162411.19412-1-vivien.didelot@savoirfairelinux.com>
Message-ID: <20160802221438.4711f2c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Aug 2016 12:24:11 -0400, Vivien Didelot wrote:

> +case $1 in
> +  start)
> +    printf "Starting lldpd..."
> +    start-stop-daemon -S -q -p /var/run/lldpd.pid --exec /usr/sbin/lldpd

We normally do:

	printf "Starting foo: "
	...
	[ $? -eq 0 ] && echo "OK" || echo "FAIL"

so I've changed this and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
