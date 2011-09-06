From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2011 23:24:16 +0200
Subject: [Buildroot] [PATCH] intltool: use built host libexpat during
 configure
In-Reply-To: <20110906191020.GA29969@berrier.lan>
References: <20110906191020.GA29969@berrier.lan>
Message-ID: <20110906232416.077d2091@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 6 Sep 2011 13:10:23 -0600,
Wade Berrier <wberrier@gmail.com> a ?crit :

>  HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
>  HOST_INTLTOOL_CONF_OPT = \
> -  PERLLIB=$(HOST_DIR)/usr/lib/perl
> +  PERLLIB=$(HOST_DIR)/usr/lib/perl \
> +  LD_LIBRARY_PATH=$(HOST_DIR)/usr/lib

Could you give some more details about the problem you're having?

There may well be a problem, but I don't really like the
LD_LIBRARY_PATH solution, because the solution we have chosen to allow
binaries installed in $(HOST_DIR) to find their libraries is to use the
rpath mechanism, not to use LD_LIBRARY_PATH. I'd prefer to stick to
this mechanism.

So we just need to figure out which host binary has been compiled
without the correct rpath.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
