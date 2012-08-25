From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Aug 2012 12:03:55 +0200
Subject: [Buildroot] Announcement: availability of autobuilder toolchains
In-Reply-To: <20120825110931.5acc6645@skate> (Thomas Petazzoni's message of
 "Sat, 25 Aug 2012 11:09:31 +0200")
References: <20120825110931.5acc6645@skate>
Message-ID: <87a9xjqodw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,

 Thomas> One common complaint about the autobuilders was that the builds
 Thomas> were not reproducible because they were using external
 Thomas> toolchains that were not available to others.

 Thomas> I have fixed this now for all the toolchain configuration used
 Thomas> on the Free Electrons build server, and I guess Peter will
 Thomas> follow with the toolchain configurations he is using on the
 Thomas> gcc10 and gcc14 build machines.

Cool, thanks!

 Thomas> Peter, could you:

 Thomas>  * Give me your base Buildroot configuration that you are using
 Thomas>  on gcc10 and gcc14

The (internal) gcc10 config is present in every build result (grep -v
BR2_PACKAGE defconfig).

gcc14 toolchain config is:
BR2_powerpc=y
BR2_powerpc_603e=y
BR2_HOST_DIR="/home/peko/br/ppc603e-wl6"
BR2_JLEVEL=8
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y

gcc110 toolchain config is:
BR2_x86_i686=y
BR2_HOST_DIR="/home/peko/br/i686-wchar"
BR2_JLEVEL=8
BR2_PTHREAD_DEBUG=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y

But notice that this is a power7 machine, so an x86 toolchain won't work.

uname -a
Linux gcc1-power7.osuosl.org 3.3.1-3.fc16.ppc64 #1 SMP Wed Apr 11 09:05:31 MST 2012 ppc64 ppc64 ppc64 GNU/Linux

-- 
Bye, Peter Korsgaard
