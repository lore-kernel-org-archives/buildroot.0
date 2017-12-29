From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 22:38:45 +0100
Subject: [Buildroot] [PATCH 4/4] hostapd: drop default netlink dependency
In-Reply-To: <20171223190617.3981-5-alexander.i.mukhin@gmail.com>
References: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
 <20171223190617.3981-5-alexander.i.mukhin@gmail.com>
Message-ID: <20171229223845.7be434d4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Dec 2017 22:06:17 +0300, Alexander Mukhin wrote:

> -# libnl-3 needs -lm (for rint) and -lpthread if linking statically
> -# And library order matters hence stick -lnl-3 first since it's appended
> -# in the hostapd Makefiles as in LIBS+=-lnl-3 ... thus failing
> -ifeq ($(BR2_STATIC_LIBS),y)
> -HOSTAPD_LIBS += -lnl-3 -lm -lpthread
> -endif
> +HOSTAPD_USE_NL =

Instead of this, just use:

ifeq ($(BR2_PACKAGE_LIBNL),y)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
