From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Feb 2014 21:38:34 +0100
Subject: [Buildroot] [PATCH 0/7] Misc set of fixes
In-Reply-To: <CAAXf6LUT9iL353aWjybhjJoQJmfD_iKGm842Au71137q1u9B1A@mail.gmail.com>
References: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LUT9iL353aWjybhjJoQJmfD_iKGm842Au71137q1u9B1A@mail.gmail.com>
Message-ID: <20140224213834.0e79d1c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 24 Feb 2014 09:11:40 +0100, Thomas De Schampheleire wrote:

> > The first three patches are fixes for build failures. The last four
> > patches are fixes for missing dependency propagation of BR2_USE_MMU.
> 
> It would be great if someone could create a script (for example based
> on kconfiglib) that automatically verifies whether all needed
> dependencies are in place. Since the logic to determine this is pretty
> straightforward, it should not be th?t hard. It may take a while to
> execute, but that shouldn't be a problem.

Maybe there's no need for a tool. Just take some configuration of
architecture, toolchain, static lib, and other "global configurations",
and then run "make randpackageconfig" a number of times. You might get
some warnings telling you that there are dependency violations.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
