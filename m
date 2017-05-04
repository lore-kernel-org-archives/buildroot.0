From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 09:30:49 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-05-02
In-Reply-To: <CAOMZO5BbPjn9b6i1uDr01ikFsSHWy9xkzfpk7F7GhssQyCuuJw@mail.gmail.com>
References: <20170503062809.135BB207F9@mail.free-electrons.com>
 <CAOMZO5B9sPeE+_YH4nWykogzB_dq7XUpz0AraMXjgazZjA_DxA@mail.gmail.com>
 <CAOMZO5BbPjn9b6i1uDr01ikFsSHWy9xkzfpk7F7GhssQyCuuJw@mail.gmail.com>
Message-ID: <20170504093049.27618dbf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 May 2017 18:20:20 -0300, Fabio Estevam wrote:

> >>          arc | atest-895b0183a89c15f5e2305... | http://autobuild.buildroot.net/results/f344bbc94344107ef2f0337a4d8f211563d5a3bf

This one is the ARC pre-built toolchain, which we don't have control
over. So for now, we need to add an exclusion.

Waldemar: in fact, re-enabling atest, ifupdown and lvm on uClibc was
wrong, because the ARC external toolchain provided pre-built by
Synopsys does not have wordexp support and does not use uClibc-ng
1.0.24 yet.

Vlad: do you know when the Synopsys toolchain might be rebuilt with
those options enabled?

> >> microblazeel | atest-895b0183a89c15f5e2305... | http://autobuild.buildroot.net/results/b05ef59f1fd20800da2f407f64c369b9b5252328
> >> microblazeel | atest-895b0183a89c15f5e2305... | http://autobuild.buildroot.net/results/35b4a1e2a47f4e169e286fa8d25606821a88cc58  

Those ones are due to me having forgotten to rebuild the Microblaze
toolchain. I've just started the build, I will deploy once the build is
finished.

Thanks for reporting the issue!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
