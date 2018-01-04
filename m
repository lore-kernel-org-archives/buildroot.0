From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Jan 2018 11:16:41 +0100
Subject: [Buildroot] GNU Bison package
In-Reply-To: <CAEjFr-Z5vQ3uaFmDvh4pBs4VeTCH5Qyn9+CA7ZBHqFQn3vOcsQ@mail.gmail.com>
References: <CAEjFr-Z5vQ3uaFmDvh4pBs4VeTCH5Qyn9+CA7ZBHqFQn3vOcsQ@mail.gmail.com>
Message-ID: <20180104111641.458faec5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 Jan 2018 10:34:05 +0200, Doha Ehab wrote:

>  I have generated uclibc toolchain using buildroot-2017.02-rc3.

Why use a release candidate ? If you're using 2017.02, please use the
latest 2017.02.x release, currently 2017.02.9.

> I am trying to use it to cross compile Gnu GCC for Android.

We do not support building gcc for the target, so I'm not sure how
Buildroot will help you with this.

> I have checked flex and gettext from target packages-> development
> tools but I cannot find bison library and I always get this error:
> 
> /home/Desktop/gcc_5/missing bison -y --name-prefix=__gettext --output
> plural.c ../.././intl/plural.y
> /home/Desktop/gcc_5/missing: 81: /home/Desktop/gcc_5/missing: bison:
> not found
> WARNING: 'bison' is missing on your system.
>          You should only need it if you modified a '.y' file.
>          You may want to install the GNU Bison package:
>          <http://www.gnu.org/software/bison/>
> Makefile:136: recipe for target 'plural.c' failed
> make[2]: *** [plural.c] Error 127
> make[2]: Leaving directory
> '/home/Desktop/gcc_5/host-aarch64-buildroot-linux-uclibc/intl'
> Makefile:5345: recipe for target 'all-intl' failed
> make[1]: *** [all-intl] Error 2
> make[1]: Leaving directory '/home/Desktop/gcc_5'
> Makefile:855: recipe for target 'all' failed
> make: *** [all] Error 2

There is not enough context here to help you. When does this happens?
During the build of which package ? Does this happens during a complete
rebuild (i.e "make clean all") ?

Or perhaps this happens when you try to manually build gcc outside of
Buildroot ? If so, I'd say you're on your own, and if bison is missing,
well, just build host-bison, and add output/host/usr/bin to your PATH.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
