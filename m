From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Sep 2014 22:25:33 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140906203640.09c6d8be@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 6 Sep 2014 20:36:40 +0200")
References: <20140906063010.93F60101336@stock.ovh.net>
 <20140906203640.09c6d8be@free-electrons.com>
Message-ID: <87lhpwmr7m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> arm |                 host-gdb-7.6.2 | NOK | http://autobuild.buildroot.net/results/03b15dde13d804e5b8b0df7f887ce0552c69fa6d/

 > configure: error: no termcap library found
 > Makefile:8229: recipe for target 'configure-gdb' failed

 > Seems like Nathaniel autobuilder does not have the ncurses development
 > libraries installed (also causing build failures in host-mysql, for
 > example). What is our policy regarding ncurses? I have it installed in
 > my autobuilder because I use it to run "make menuconfig". But it's true
 > it's not technically absolutely required to run a Buildroot build.

 > Should we add dependency on host-ncurses where appropriate? Or should
 > we make ncurses development files on the build machine a mandatory
 > dependency? What if the user uses only xconfig or gconfig?

Given how many people use menuconfig, I think we should just make
ncurses a mandatory dependency. Just about anybody doing embedded Linux
development needs them anyway to configure
barebox/linux/busybox/uclibc/ctng/..

If not, then we would also need to add host-ncurses to our
barebox/linux/busybox/uclibc-menuconfig targets.


 >> arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a42c4d1abdee3ee28048e68f28781d5914dcd23b/

 > Peter should move to the autobuild-run script.

Yeah, I'll work on it this weekend.

-- 
Bye, Peter Korsgaard
