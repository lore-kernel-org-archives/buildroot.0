From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 09:41:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-19
In-Reply-To: <20140520092513.0ad98a62@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 20 May 2014 09:25:13 +0200")
References: <20140520063007.ACE63100F8E@stock.ovh.net>
 <20140520092513.0ad98a62@free-electrons.com>
Message-ID: <87mwecj3re.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 20 May 2014 08:30:07 +0200 (CEST), Thomas Petazzoni wrote:

 >> x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3ecb780be9e7912dac9670d9e7ad9a810c6243af/

 > Multiple definitions of vfork in libc.a and libpthread.a. To me, this
 > looks like a uClibc bug. Do other agree about this? Should we mark
 > alsa-lib as not available on pure static builds with uClibc? Is there a
 > uClibc patch that fixes that?

It looks like it. I am no aware of any patches (but I haven't really
looked either).


 >> i686 |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/725962e174198f0b26b7cbd335691d9a23be73f5/

 > A build error in Busybox? Really weird:

 > libbb/appletlib.c:164:13: error: ???NUM_APPLETS??? undeclared (first use in this function)
 > libbb/appletlib.c:164:13: note: each undeclared identifier is reported only once for each function it appears in
 > libbb/appletlib.c: In function ???install_links???:
 > libbb/appletlib.c:595:18: error: invalid application of ???sizeof??? to incomplete type ???int (* const[])(int,  char **)???

 > Peter, any idea?

Very odd. Glitch in the matrix? I would say just ignore it unless it
happens again.


 >> arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/5cde56a0bf8dfac22d01752a98d399f71f664e07/

 > The usual gcc issue. Last night, I've restarted the build of the
 > Buildroot external toolchains used in the autobuilders with Buildroot
 > 2014.05-rc1. When I'll deploy them, it should hopefully fix the issue
 > since we now have the gcc patch that fixes this problem.


Thanks!


 >> avr32 |                   samba-3.6.23 | NOK | http://autobuild.buildroot.net/results/0142b1d5b8c3f20f1bff76ece646d901407f7490/

 > Could be fixed by applying http://patchwork.ozlabs.org/patch/350543/.

Will apply now.

-- 
Bye, Peter Korsgaard
