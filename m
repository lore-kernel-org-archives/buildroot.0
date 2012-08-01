From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Aug 2012 23:16:35 +0200
Subject: [Buildroot] glibc instead of ulibc ?
In-Reply-To: <1343854870.70701.YahooMailNeo@web164605.mail.gq1.yahoo.com>
References: <1343854870.70701.YahooMailNeo@web164605.mail.gq1.yahoo.com>
Message-ID: <20120801231635.08b7d808@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 1 Aug 2012 14:01:10 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :

> I've built root file system for ARM board and now try to cross
> compile simple (graphical) program, using Lazarus.
> Althouth I'm pretty sure that I correctly configured Lazarus, some
> errors emerged?(eg. libX11.so: undefined reference to strcpy, ... fclose; fseek ...).

These functions are very basic stuff in uClibc, so your problem is
most likely not uClibc here.

> Seems to me?that at least part of?the?problem lies in?having uclibc,
> instead of glibc. 
> So my question is - how (if possible) can I?build root file system 
> with glibc instead of?uclibc.

You have two choices:

 * Use the external toolchain backend, which allows you to use a
   pre-built CodeSourcery or Linaro toolchain for ARM, or build your
   own toolchain with Crosstool-NG, and then use it into Buildroot as
   an external toolchain.

 * Use the Crosstool-NG backend, which will tell Buildroot to use
   Crosstool-NG to build the toolchain.

Both of those solutions will allow you to use the glibc C library.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
