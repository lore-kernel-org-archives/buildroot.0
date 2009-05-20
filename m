From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 May 2009 07:16:39 +0200
Subject: [Buildroot] Issue with compiling buildroot
In-Reply-To: <e0d1345d0905192135y6a64975eve6d5c83a96a29ae8@mail.gmail.com>
	(Ratheendran Rajeshwaran's message of "Wed\,
	20 May 2009 10\:05\:27 +0530")
References: <e0d1345d0905192135y6a64975eve6d5c83a96a29ae8@mail.gmail.com>
Message-ID: <87ljosl5fs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ratheendran" == Ratheendran Rajeshwaran <ratheendranr@gmail.com> writes:

 Ratheendran> Hi

 Ratheendran> I am compiling buildroot(buildroot-2009.02-rc1) on ARM 9 processor(LN2410
 Ratheendran> board).
 Ratheendran> Now I have used a new cross compiler gcc? 3.4.3.
 Ratheendran> On compiling I get the below error message.

Is this toolchain built in buildroot or are you using an external
toolchain?

 Ratheendran> cc1: error: unrecognized command line option "-fsysroot"
 Ratheendran> cc1: /root/LN2410/buildroot/test/buildroot-2009.02-rc1/build_arm/staging_dir/:
 Ratheendran> No such file or directory
 Ratheendran> make[2]: *** [applets/applets.o] Error 1
 Ratheendran> make[1]: *** [applets] Error 2

It seems like your toolchain doesn't support sysroot. We don't support
non-sysroot external toolchains.

-- 
Bye, Peter Korsgaard
