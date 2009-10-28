From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Oct 2009 22:00:18 +0100
Subject: [Buildroot] busybox question
In-Reply-To: <4AE8AED3.9040004@cs.ucsb.edu> (Roman Chertov's message of "Wed\,
	28 Oct 2009 13\:51\:31 -0700")
References: <20091027211438.BEC2B7773A@busybox.osuosl.org>
	<4AE7C7C5.8090001@cs.ucsb.edu> <877hufddx5.fsf@macbook.be.48ers.dk>
	<4AE870AC.6070601@cs.ucsb.edu> <4AE87550.9090603@toumaz.com>
	<4AE89CFE.5050406@cs.ucsb.edu> <87y6mvb6fv.fsf@macbook.be.48ers.dk>
	<4AE8AED3.9040004@cs.ucsb.edu>
Message-ID: <87pr87b5el.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:

Hi,

 >> With uclibc prompt I guess you mean login prompt, right? What happens if
 >> you try to login as root?

 Roman> I can't type anything over the serial so I can't log in.  This is what I
 Roman> see though:

 Roman> Freeing init memory: 120K



 Roman> Welcome to Buildroot
 Roman> uclibc login:

Ok, that looks good atleast.

 >> Have you verified that you have softfloat enabled like I asked yesterday?

 Roman> I do not have softfloat enabled.  Do I also need to enable "Enable C99
 Roman> Floating-point environment" (uclibc-menuconfig)?

If you don't have softfloat enabled (you should), then you'll need to
ensure that you have fpu emulation enabled in the kernel.

And no, you normally don't have to mess with the uclibc config.

Remember that you need to do a clean rebuild after changing
soft/hardfloat (rm -rf output; make if you are using git, rm -rf
*build_*; make if you are using the release).

-- 
Bye, Peter Korsgaard
