From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 23:33:33 +0200
Subject: [Buildroot] [PATCH 1/1] valgrind: bump to 3.6.1 and add support
 for ARMv7
In-Reply-To: <87ipr8jys5.fsf@macbook.be.48ers.dk>
References: <cover.1310415416.git.thomas.petazzoni@free-electrons.com>
 <cover.1310415416.git.thomas.petazzoni@free-electrons.com>
 <7ab179c630afa8f3bcafaa99934fed108cf137c5.1310415416.git.thomas.petazzoni@free-electrons.com>
 <87ipr8jys5.fsf@macbook.be.48ers.dk>
Message-ID: <20110711233333.356aaf97@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 11 Jul 2011 23:24:58 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> +VALGRIND_VERSION = 3.6.1
>  Thomas> +VALGRIND_SITE    = http://valgrind.org/downloads/
>  Thomas> +VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
>  Thomas> +
>  Thomas> +VALGRIND_CONF_OPT = --disable-tls
> 
> I know we had this before as well, but is that really needed nowadays
> with NPTL and so on? It seems to compile fine here without that
> option.

I didn't test without this option, as I thought I had a linuxthreads
toolchain. But in fact, my toolchain was NPTL, so probably it works
without this option.

Maybe it needs some conditional on the thread implementation ? Or maybe
the configure script guesses automatically ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
