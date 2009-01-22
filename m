From: Austin, Brian <Brian.Austin@cirrus.com>
Date: Thu, 22 Jan 2009 11:23:16 -0600
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill
	init!: at	boot time
In-Reply-To: <4978AADF.4000808@walsimou.com>
Message-ID: <C171323BB93CB94897E300CBB6D4537F17D80301@CLMSG-01.ad.cirrus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not quite that we aren't inspired.  It seems to be a common problem.
Usually it's from either EABI/OABI conflicts with the kernel and your ramdisk, or something broken in the build with busybox itself.

Have you run 'file' on your init or busybox binary?

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Gaye Abdoulaye Walsimou
Sent: Thursday, January 22, 2009 11:21 AM
To: buildroot at uclibc.org
Subject: Re: [Buildroot] Kernel panic - not syncing: Attempted to kill init!: at boot time

Gaye Abdoulaye Walsimou wrote:
> Hello list,
> I have worked with a mips (little endian) board for a while without 
> troubles.
> Toolchain and tools components: uclibc-0.9.30, binutils-2.19, 
> gcc-4.3.2,busybox-1.13.x from latest SVN buildroot (see 
> buildroot.config, uclibc and busybox have default config from buildroot)
> Linux-2.6 latest linux-mips git repository.
> nfsroot for a the root filesystem
> All have worked well there are about 2 weeks.
> Two days ago I planed to upgrade linux and buildroot, and now I have a 
> kernel panic (Kernel panic - not syncing: Attempted to kill init!).
> Linux seems to work well (see boot log attached), so I changed 
> /sbin/init with this simple code:
>
> #include <stdio.h>
> int main (int argc, char** argv)
> {
>    printf("Hello world\n");
>    while(1);
>    return 0;
> }
>
> If this code is compiled with mipsel-linux-gcc -o init -Wall -W 
> init-test.c, I have the same result: kernel panic.
> And with mipsel-linux-gcc -o init -Wall -W -static init-test.c, I have 
> my "Hello world".
> I can't figure out what this behavior shows.
>
> Can somebody can tell me where to start to investigate in order to 
> know what's going on?
> Thanks for any comments.
> Regards

Hello list,

Nobody seems to be inspired by the issue I reported, anyway, another 
similar[?] issue leads me to change the toolchain and all works fine now.
toolchain: kernel header 2.6.27.10, gcc-4.2.4, binutils-2.19, uclibc-0.9.30
rootfs with busybox-1.13.2
linux-mips-2.6 git repository (checkout and pull today)

Regards

[1]: http://lists.busybox.net/pipermail/buildroot/2009-January/025051.html

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
