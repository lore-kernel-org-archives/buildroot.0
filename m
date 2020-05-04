From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 May 2020 07:18:29 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/wayland: bump to version
 1.18.0
In-Reply-To: <20200503230743.112719-1-james.hilliard1@gmail.com>
References: <20200503230743.112719-1-james.hilliard1@gmail.com>
Message-ID: <20200504071829.07c2ed9f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

Thanks for this update. One comment below.


On Sun,  3 May 2020 17:07:43 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> -# 0002-configure-add-option-to-disable-tests.patch
> -WAYLAND_AUTORECONF = YES
> -
> -# wayland-scanner is only needed for building, not on the target
> -WAYLAND_CONF_OPTS = --with-host-scanner --disable-tests
> -HOST_WAYLAND_CONF_OPTS = --disable-tests
> +WAYLAND_CONF_OPTS = -Dtests=false -Ddocumentation=false
> +HOST_WAYLAND_CONF_OPTS = $(WAYLAND_CONF_OPTS)

This is too dangerous: yes today, the CONF_OPTS are the same between
target/host, but with this construct, it is easy in the future to
change the target CONF_OPTS and not realize they affect the host
variant as well.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
