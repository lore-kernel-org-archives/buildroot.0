From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 21:59:05 +0200
Subject: [Buildroot] [PATCH 1/3] package/lttng-libust: bump version to
 2.11.0
In-Reply-To: <20191022144805.591535-1-eeppeliteloop@gmail.com>
References: <20191022144805.591535-1-eeppeliteloop@gmail.com>
Message-ID: <20191022215905.6eb2f5f4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Oct 2019 10:48:03 -0400
Philippe Proulx <eeppeliteloop@gmail.com> wrote:

> +ifneq ($(BR2_PACKAGE_NUMACTL),y)
> +LTTNG_LIBUST_CONF_OPTS += --disable-numa
> +endif

This is not good: what happens when numactl is enabled ?

So, I changed this to:

ifeq ($(BR2_PACKAGE_NUMACTL),y)
LTTNG_LIBUST_DEPENDENCIES += numactl
LTTNG_LIBUST_CONF_OPTS += --enable-numa
else
LTTNG_LIBUST_CONF_OPTS += --disable-numa
endif

which is the typical way to handle optional dependencies.

I've applied after fixing this. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
