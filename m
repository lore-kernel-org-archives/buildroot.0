From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Sep 2014 09:21:58 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <87lhpwmr7m.fsf@dell.be.48ers.dk>
References: <20140906063010.93F60101336@stock.ovh.net>
 <20140906203640.09c6d8be@free-electrons.com>
 <87lhpwmr7m.fsf@dell.be.48ers.dk>
Message-ID: <20140907092158.600154db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 06 Sep 2014 22:25:33 +0200, Peter Korsgaard wrote:

>  > Seems like Nathaniel autobuilder does not have the ncurses development
>  > libraries installed (also causing build failures in host-mysql, for
>  > example). What is our policy regarding ncurses? I have it installed in
>  > my autobuilder because I use it to run "make menuconfig". But it's true
>  > it's not technically absolutely required to run a Buildroot build.
> 
>  > Should we add dependency on host-ncurses where appropriate? Or should
>  > we make ncurses development files on the build machine a mandatory
>  > dependency? What if the user uses only xconfig or gconfig?
> 
> Given how many people use menuconfig, I think we should just make
> ncurses a mandatory dependency. Just about anybody doing embedded Linux
> development needs them anyway to configure
> barebox/linux/busybox/uclibc/ctng/..
> 
> If not, then we would also need to add host-ncurses to our
> barebox/linux/busybox/uclibc-menuconfig targets.

Well not sure we want to go down this road: it would mean we should add
host-qt as a dependency of the linux-xconfig target for example. We
could also decide that the *-menuconfig targets need to have curses-dev
installed on the build machine, but that the package that we build and
that need host-curses will depend on host-curses.

But well, menuconfig is indeed widely used, so maybe the easiest
solution would be to make ncurses-dev a mandatory dependency.

>  >> arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a42c4d1abdee3ee28048e68f28781d5914dcd23b/
> 
>  > Peter should move to the autobuild-run script.
> 
> Yeah, I'll work on it this weekend.

Cool! For now, only migrate your x86/x86-64 machines. Note that instead
of using your toolchain, it will be randomly chosing from the toolchain
configurations available at
http://autobuild.buildroot.org/toolchains/configs/. If you think there
is some useful configuration that is missing, let me know.

We'll work on moving the PowerPC machine at a later point (that will
require building a toolchain on it, and then putting it on
http://autobuild.buildroot.org/toolchains/tarballs/).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
