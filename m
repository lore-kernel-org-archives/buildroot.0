From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:34:51 +0100
Subject: [Buildroot] [PATCH v6 1/2] package/netdata: new package
In-Reply-To: <20200320152517.3108669-1-m.niestroj@grinn-global.com>
References: <20200320152517.3108669-1-m.niestroj@grinn-global.com>
Message-ID: <20200324223451.529ca95c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcin,

On Fri, 20 Mar 2020 16:25:16 +0100
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Always provide --disable-dbengine configuration option, because we do
> not support libjudy dependency that is required otherwise.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Thanks, I've applied to master, with some small changes. See below.

> +# Create needed directories.
> +[ -d "/var/cache/$DAEMON" ] || mkdir -p "/var/cache/$DAEMON"
> +[ -d "/var/lib/$DAEMON" ] || mkdir -p "/var/lib/$DAEMON"
> +[ -d "/var/log/$DAEMON" ] || mkdir -p "/var/log/$DAEMON"

I've simplified to just

mkdir -p /var/cache/$DAEMON /var/lib/$DAEMON /var/log/$DAEMON

indeed, there's no need to test before doing mkdir -p, mkdir -p will
exit successfully if the folder already exists.

> +NETDATA_VERSION = 1.20.0
> +NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
> +NETDATA_LICENSE = GPL-3.0

The license really is GPL-3.0+.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
