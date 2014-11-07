From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 7 Nov 2014 10:19:26 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-06
In-Reply-To: <20141107073016.0C55F1018AC@stock.ovh.net>
References: <20141107073016.0C55F1018AC@stock.ovh.net>
Message-ID: <545C9CAE.3070303@imgtec.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

On 11/07/2014 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-11-06

>       mipsel |                     ola-0.8.33 | TIM | http://autobuild.buildroot.net/results/edb374fba996973c21b7b4ed13d5d07c457793a0/

[3m>>> ola 0.8.33 Autoreconfiguring[23m
make: ***
[/home/tmp/buildroot-test/instance-0/output/build/ola-0.8.33/.stamp_configured]
Terminated

No error message. It looks like the autobuilder stopped suddenly.

>       mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/445bbbb0e6370cc2d1caf4ca66f59b8441f9dcda/
>       mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/88b67de17d7059b2aeb41c483e4c275e5d2f2ee1/
>       mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e6cb3215fcefd76805abee98b277b810366e456c/

I keep reporting this every day. The autobuilder which is reporting
these failures is not updated with the latest version of the
autobuilder-run script.

I don't know who owns this autobuilder, but please, fix it so we will
not see the same useless reports gain and again.

>         mips |                    systemd-216 | NOK | http://autobuild.buildroot.net/results/5764a0f71b5678701c2d4e4bd37516d8aae06f6b/

I fixed this upstream and then backported the patch to Buildroot. The
patch series is waiting in the queue:

http://patchwork.ozlabs.org/patch/406583/
http://patchwork.ozlabs.org/patch/406584/

>     mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/e4ee0ae40ac9d58b3182db52d5a39e6ac3692f60/

"Fatal error: can't create obj/esfilter.o: No such file or directory"

I think this is a race condition problem due to the "obj" directory not
being created in time. I have reported the issue upstream.

https://code.google.com/p/tstools/issues/detail?id=29

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
