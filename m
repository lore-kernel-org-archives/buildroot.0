From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 14:24:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-12
In-Reply-To: <dc955255-c483-c69b-588f-be53ad896fe3@gmail.com>
References: <20170513063125.BA761220BB@mail.free-electrons.com>
 <dc955255-c483-c69b-588f-be53ad896fe3@gmail.com>
Message-ID: <20170513142403.739e63bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 May 2017 14:20:58 +0200, Romain Naour wrote:

> >        nios2 | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/d61c8d169fc070271114a515159650f7a0f333c0 |     
> >          arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/22295711046c519df44d5d976e0bfcae1f006e5a |       
> 
> uclibc-ng broken with glibc 2.25 due to pthread_cond_t changes introduced by [1].
> Waldemar has disabled this test (tst-cond22) with glibc based toolchain [2] but
> the current uclibc-ng-test package doesn't contain this patch.
> 
> [1]
> https://sourceware.org/git/?p=glibc.git;a=commit;h=ed19993b5b0d05d62cc883571519a67dae481a14
> [2]
> https://gogs.waldemar-brodkorb.de/linux/uclibc-ng-test/commit/787e584f18afc967d91cfe1a8443df2657579ecb

Thanks for the analysis. Could you send a patch that backports
https://gogs.waldemar-brodkorb.de/linux/uclibc-ng-test/commit/787e584f18afc967d91cfe1a8443df2657579ecb
into our uclibc-ng-test package ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
