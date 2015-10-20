From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 12:34:06 +0200
Subject: [Buildroot] [git commit] arch/x86: add support for Intel X1000
In-Reply-To: <1445337070.3204.25.camel@intel.com> (Ray Kinsella's message of
 "Tue, 20 Oct 2015 10:31:10 +0000")
References: <20151020080505.82B8581E83@busybox.osuosl.org>
 <874mhl25rl.fsf@dell.be.48ers.dk> <1445337070.3204.25.camel@intel.com>
Message-ID: <87zizdzv4x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kinsella," == Kinsella, Ray <ray.kinsella@intel.com> writes:

 > Hi Peter,
 > I handle this in the defconfig for Galileo, explicitly setting binutils to 2.5
 > Presume you feel that binutils  < 2.5 shouldn't be selectable by the user?

Yes, indeed - Simply add a depends on !BR2_x86_x1000 to the older
binutils versions in package/binutils/Config.in.host and the affected
preconfigured external toolchains (presumably all of them as I take it
you also need the C library to be built with that option?)

-- 
Venlig hilsen,
Peter Korsgaard 
