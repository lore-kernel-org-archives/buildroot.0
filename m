From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Sep 2011 08:46:24 +0200
Subject: [Buildroot] Antw: Antw:Re:  libgcc build fails on Fedora15
In-Reply-To: <7340d14feedea.4e7eccc3@home.nl>
References: <7340d14feedea.4e7eccc3@home.nl>
Message-ID: <20110926084624.0851437a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 25 Sep 2011 06:40:03 +0200,
"MARCEL JANSSEN" <korgull@home.nl> a ?crit :

> The log doesn't show the error, but it's printed in the terminal :
> /bin/sh: error while loading shared
> libraries: /admesy/arm/buildroot/output/toolchain/gcc-4.4.6-intermediate/./gcc/libgcc_s.so.1:
> ELF file OS ABI invalid

You're building for the OABI ARM ABI, which almost nobody uses, and
indeed breaks in the configuration you gave. Unless you have strong
reasons to keep working with OABI (legacy binaries that you can't
recompile), I would strongly suggest to use EABI. This is what
everybody uses these days.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
