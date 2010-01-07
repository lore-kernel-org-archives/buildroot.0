From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jan 2010 18:37:09 +0100
Subject: [Buildroot] MTD build failing: undefined ref's  to bcopy, bcmp
In-Reply-To: <hi5437$id4$1@ger.gmane.org>
References: <hi377d$1i5$1@ger.gmane.org>
	<hi5437$id4$1@ger.gmane.org>
Message-ID: <20100107183709.74ba1341@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 7 Jan 2010 17:02:31 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> I patched the bug in the mtd package so it's now building, but
> it won't run:
> 
>    # flash_info
>    flash_info: can't load library 'libgcc_s.so.1'
> 
> libgcc_s.so.1 appears in the staging directory,
> 
>    $ find . -name libgcc_s*
>    ./output/staging/usr/arm-linux-uclibc/lib/libgcc_s.so
>    ./output/staging/usr/arm-linux-uclibc/lib/libgcc_s.so.1
> 
> but it's not present in the target filesystem.

Are you using a buildroot-generated toolchain or an external toolchain ?

> Am I having all of these problem becuase I shouldn't be using
> HEAD, or am I doing something else wrong?

The MTD utils package has very recently been updated into HEAD, which
might explain why you're encountering so many failures.

  http://git.buildroot.net/buildroot/commit/?id=9400c73582326c543fae82120af3904836145655

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
