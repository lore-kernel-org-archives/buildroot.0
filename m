From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Jun 2012 12:16:02 +0200
Subject: [Buildroot] [git commit] mii-diag: link statically if
 configured to do so
In-Reply-To: <20120627200833.E3F7C8E0E8@busybox.osuosl.org>
References: <20120627200833.E3F7C8E0E8@busybox.osuosl.org>
Message-ID: <20120629121602.1b0fecd6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 27 Jun 2012 22:03:59 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> +MII_DIAG_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
> +
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +MII_DIAG_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -static"
> +endif

I am not fully sure I like this. Do we want to have the same stuff in
all packages, or should we think about doing this globally in some way?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
