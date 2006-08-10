From: Drew Cohan <drewcohan@gmail.com>
Date: Thu, 10 Aug 2006 15:08:38 -0400
Subject: [Buildroot] Packages that error out during build
In-Reply-To: <20060810175113.GA20615@codepoet.org>
References: <bf61e79a0608100739p4899b15brb988f9063f044978@mail.gmail.com>
	<20060810175113.GA20615@codepoet.org>
Message-ID: <bf61e79a0608101208v69dfe8ban49e8fd39ec28b19e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, thanks.

using gcc version 3.4.5 20051201 (Red Hat 3.4.5-2) with buildroot 15795:

NTP:

tickadj.c:183:22: sys/var.h: No such file or directory
tickadj.c: In function `main':
tickadj.c:436: error: `txc' undeclared (first use in this function)
tickadj.c:436: error: (Each undeclared identifier is reported only once
tickadj.c:436: error: for each function it appears in.)
make[3]: *** [tickadj.o] Error 1
make[3]: Leaving directory `/home/user/buildroot/build_i686/ntp-4.2.0/util'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/user/buildroot/build_i686/ntp-4.2.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/user/buildroot/build_i686/ntp-4.2.0'
make: *** [/home/user/buildroot/build_i686/ntp-4.2.0/ntpdate/ntpdate] Error 2

Hotplug:

wget --passive-ftp -q -P /home/user/buildroot/dl
http://www.kernel.org/pub/linux/utils/kernel/hotplug//diethotplug-0.4.tar.gz
zcat /home/user/buildroot/dl/diethotplug-0.4.tar.gz | tar -C
/home/user/buildroot/build_i686   -xf -
toolchain/patch-kernel.sh
/home/user/buildroot/build_i686/diethotplug-0.4 package/hotplug/
hotplug\*.patch

Applying hotplug.patch using plaintext:
patching file pci.c
patching file Makefile
make -j1 CROSS=/home/user/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-
DEBUG=false KLIBC=false \
    KERNEL_INCLUDE_DIR=/home/user/buildroot/build_i686/staging_dir/include \
    TARGET_DIR=/home/user/buildroot/build_i686/root -C
/home/user/buildroot/build_i686/diethotplug-0.4;
make[1]: Entering directory `/home/user/buildroot/build_i686/diethotplug-0.4'
perl convert_usb.pl <
/home/user/buildroot/build_i686/root/lib/modules/2.4.31/modules.usbmap
> usb_modules.h
/bin/sh: /home/user/buildroot/build_i686/root/lib/modules/2.4.31/modules.usbmap:
No such file or directory
make[1]: *** [usb_modules.h] Error 1
make[1]: Leaving directory `/home/user/buildroot/build_i686/diethotplug-0.4'
make: *** [/home/user/buildroot/build_i686/diethotplug-0.4/hotplug] Error 2

-- Drew


On 8/10/06, Erik Andersen <andersen@codepoet.org> wrote:
> On Thu Aug 10, 2006 at 10:39:13AM -0400, Drew Cohan wrote:
> > Hi,
> >
> > Is there any recourse for packages like ntp and hotplug not
> > building properly and erroring out?
> >
> > The "basic" packages compile fine, like released busybox and
> > bash etc.  I'd be happy to supply build logs but I didn't know
> > if this was the right forum for those sort of packages.
>
> If things in buildroot don't build, this is clearly
> the correct forum for reporting it.  With details...
>
>  -Erik
>
> --
> Erik B. Andersen             http://codepoet-consulting.com/
> --This message was written using 73% post-consumer electrons--
>
