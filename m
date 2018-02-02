From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Feb 2018 11:56:35 +0100
Subject: [Buildroot] [PATCH v2 1/2] network-manager: Bump to version
 1.10.2
In-Reply-To: <20180201234516.5031-1-petr.vorel@gmail.com>
References: <20180201234516.5031-1-petr.vorel@gmail.com>
Message-ID: <20180202115635.0fdaab93@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Feb 2018 00:45:15 +0100, Petr Vorel wrote:

> +ifeq ($(BR2_PACKAGE_JANSSON),y)
> +NETWORK_MANAGER_CONF_OPTS += --enable-ovs
> +NETWORK_MANAGER_DEPENDENCIES += jansson
> +else
> +NETWORK_MANAGER_CONF_OPTS += --disable-ovs
> +endif

It is somewhat weird to introduce this here, and then add an explicit
option in a second patch.

Perhaps PATCH 1/2 could just do --disable-ovs unconditionally, and
PATCH 2/2 add the rest. If you agree, I can rework locally before
applying, I understand it's a lot of nitpicking for such a small
change :)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
