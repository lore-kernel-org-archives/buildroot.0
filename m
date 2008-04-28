From: p <pmeloy@shaw.ca>
Date: Mon, 28 Apr 2008 09:44:56 -0700
Subject: [Buildroot] lockfiles-progs problems
In-Reply-To: <48109359.5010204@logicway.de>
References: <48109359.5010204@logicway.de>
Message-ID: <1209401096.3050.6.camel@rhodan.rho>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lockfile-progs_0.1.11 no longer exists in the repo and has apparently
been replaced by 0.1.11-0.1.

I changed the .mk version to 0.1.11-0.1 and make downloaded the file but
then it aborts at "touch" with a somewhat misleading error message.

toolchain/patch-kernel.sh /home/pat/buildroot/build_arm/lockfile-progs-0.1.11-0.1/ package/lockfile-progs *.patch
Aborting.  '/home/pat/buildroot/build_arm/lockfile-progs-0.1.11-0.1/' is
not a directory.
make: ***
[/home/pat/buildroot/build_arm/lockfile-progs-0.1.11-0.1/.unpacked]
Error 1

pat at rhodan:~/buildroot$ ls build_arm/lockfile-progs-0.1.11/ -a
.  ..  COPYING  debian  .git  .gitignore  lockfile-progs.1
lockfile-progs.c  Makefile  TODO

In reality .unpacked is missing for some reason.

On Thu, 2008-04-24 at 16:04 +0200, Arndt Kritzner wrote:
> Irda-utils's package makefile is a stub without real function at the moment.
> 
> The patch adds functionality to download and compile the package. But on
> avr32 only irattach could be built successfully.
> 
> Gru? und tsch?s
> Arndt
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
