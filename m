From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 21:34:25 +0100
Subject: [Buildroot] [PATCH] berkeleydb: workaround m68k/coldfire issue
In-Reply-To: <20170222125110.GA27092@waldemar-brodkorb.de>
References: <20170222125110.GA27092@waldemar-brodkorb.de>
Message-ID: <20170222213425.4636e8cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 13:51:10 +0100, Waldemar Brodkorb wrote:

>  # build directory can't be the directory where configure are there, so..
>  define BERKELEYDB_CONFIGURE_CMDS
>  	(cd $(@D)/build_unix; rm -rf config.cache; \
>  		$(TARGET_CONFIGURE_OPTS) \
>  		$(TARGET_CONFIGURE_ARGS) \
> +		$(BERKELEYDB_CONF_OPTS) \

Since it's passed in the environment of configure and not as an option,
I renamed this variable to BERKELEYDB_CONF_ENV, which is more
consistent with what we do in the autotools-package infrastructure.

Applied with this fix. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
