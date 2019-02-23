From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Feb 2019 09:13:28 +0100
Subject: [Buildroot] raspberrypi3_qt5we_defconfig on mind autobuilder
In-Reply-To: <20190222214817.698f98c6@windsurf>
References: <20190222214817.698f98c6@windsurf>
Message-ID: <492a38b4-9e02-98e5-dbce-be8089096c97@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/02/2019 21:48, Thomas Petazzoni wrote:
> Hello Arnout,
> 
> The build of raspberrypi3_qt5we_defconfig was done today on Mind's
> autobuilder, and it failed. See
> https://gitlab.com/buildroot.org/buildroot/-/jobs/165766158. The issue
> is simply:
> 
> arm-buildroot-linux-gnueabihf-g++.br_real: internal compiler error:
> Killed (program cc1plus)
> 
> Could you check if you had an OOM situation perhaps ?

 Indeed:

Feb 22 18:34:57 belels006 kernel: [1474258.679372] cc1plus invoked oom-killer:
gfp_mask=0x280da, order=0, oom_score_adj=0

 That machine unfortunately only has 12GB of memory, which is a bit tight for
qt5we... It would help if I could lower the JLEVEL (the thing has 22 CPUs), do
you know an easy way to do that?

 Regards,
 Arnout
