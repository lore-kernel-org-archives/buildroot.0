From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 10:35:27 +0200
Subject: [Buildroot] [RFC v1 2/2] libdrm: change to meson build system
In-Reply-To: <fqht1fxpqg.ln2@ID-313208.user.individual.net>
References: <20180713205801.25976-1-ps.report@gmx.net>
 <20180713205801.25976-2-ps.report@gmx.net>
 <fqht1fxpqg.ln2@ID-313208.user.individual.net>
Message-ID: <20180716103527.2e139eb4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Jul 2018 05:59:43 +0200, Bernd Kuhls wrote:

> > I agree that there needs to be an explanation for the switch. Is
> > upstream moving to CMake, and getting rid of autotools support in the
> > future ? Other reason ?  
> 
> From the current discussion of your RFC I am unable to see the 
> "*compelling* reason" for using meson.

I think it all depends on upstream's strategy. Are they adding meson
just as an alternate build system and intend to keep autotools, or are
they adding meson with the plan of phasing out and removing autotools
based build ?

In the latter case, then switching to meson definitely makes sense.

> Instead the mess around python2/python3 imho does not justify the
> few seconds libdrm itself will build faster, so NACK.

The python2/python3 mess has nothing to do with libdrm, it's an
existing and separate meson support issue, which we already have for
other packages using the meson build system.

However, I agree that the need to build host-python3 to build meson
packages is really annoying :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
