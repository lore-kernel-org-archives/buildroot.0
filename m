From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Nov 2014 13:15:05 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-06
In-Reply-To: <545C9CAE.3070303@imgtec.com> (Vicente Olivert Riera's message of
 "Fri, 7 Nov 2014 10:19:26 +0000")
References: <20141107073016.0C55F1018AC@stock.ovh.net>
 <545C9CAE.3070303@imgtec.com>
Message-ID: <87d28zw6k5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > On 11/07/2014 07:30 AM, Thomas Petazzoni wrote:
 >> Build statistics for 2014-11-06

 >> mipsel |                     ola-0.8.33 | TIM | http://autobuild.buildroot.net/results/edb374fba996973c21b7b4ed13d5d07c457793a0/

 >>>> ola 0.8.33 Autoreconfiguring
 > make: ***
 > [/home/tmp/buildroot-test/instance-0/output/build/ola-0.8.33/.stamp_configured]
 > Terminated

 > No error message. It looks like the autobuilder stopped suddenly.

Yes, it apparently timed out. Maxime, any idea why?


 >> mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/445bbbb0e6370cc2d1caf4ca66f59b8441f9dcda/
 >> mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/88b67de17d7059b2aeb41c483e4c275e5d2f2ee1/
 >> mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e6cb3215fcefd76805abee98b277b810366e456c/

 > I keep reporting this every day. The autobuilder which is reporting
 > these failures is not updated with the latest version of the
 > autobuilder-run script.

 > I don't know who owns this autobuilder, but please, fix it so we will
 > not see the same useless reports gain and again.

Yeah. You can see the owner in the submitter file (in this case Thomas,
Richard and Maxime). I believe Thomas is currently travelling - But
Richard and Maxime, please update your autobuilders.

I've just checked and ensured the autobuilders I use are uptodate.


 >> mips |                    systemd-216 | NOK | http://autobuild.buildroot.net/results/5764a0f71b5678701c2d4e4bd37516d8aae06f6b/

 > I fixed this upstream and then backported the patch to Buildroot. The
 > patch series is waiting in the queue:

 > http://patchwork.ozlabs.org/patch/406583/
 > http://patchwork.ozlabs.org/patch/406584/

I'll have a look - Thanks!


 >> mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/e4ee0ae40ac9d58b3182db52d5a39e6ac3692f60/

 > "Fatal error: can't create obj/esfilter.o: No such file or directory"

 > I think this is a race condition problem due to the "obj" directory not
 > being created in time. I have reported the issue upstream.

 > https://code.google.com/p/tstools/issues/detail?id=29

Yes, looks like it. Thanks for reporting it!

-- 
Bye, Peter Korsgaard
