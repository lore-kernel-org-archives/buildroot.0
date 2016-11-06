From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 15:13:44 +0100
Subject: [Buildroot] [PATCH] package/ser2net: disable threads for
 toolchains without threads support
In-Reply-To: <1478438123-869-1-git-send-email-romain.naour@gmail.com>
References: <1478438123-869-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161106151344.35d9160e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Nov 2016 14:15:23 +0100, Romain Naour wrote:

> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +SER2NET_CONF_OPTS += --with-pthreads=yes
> +else
> +SER2NET_CONF_OPTS += --with-pthreads=no
> +endif

We normally use --with-pthreads / --without-pthreads, so I've updated
your patch accordingly and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
