From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Sep 2014 18:47:17 +0200
Subject: [Buildroot] Pending "big" patch series
In-Reply-To: <20140923213752.GA5923@itchy>
References: <20140914125321.0d68b842@free-electrons.com>
 <20140923200255.1be119c9@free-electrons.com>
 <20140923213752.GA5923@itchy>
Message-ID: <20140926184717.0c2d6822@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Tue, 23 Sep 2014 23:37:52 +0200, Eric Le Bihan wrote:

> I had a quick look at the webkit patch. Webkit is a strange beast with issues
> when building with parallelism activated. When building version 2.4.3, I
> encountered the bug mentioned in the commit log, and when I bumped to 2.4.5,
> I've found more parallel build issues (and some ARM ASM ones too).

Argh. Not being able to build Webkit in parallel would be quite
annoying: it's a really huge package, so building in parallel brings a
significant build time reduction.

Regarding the bug in 2.4.3, it seems to be potentially a bug in make
itself, because make takes 100% of CPU time and is completely stuck. I
have compiled a host make with debugging symbols, but I haven't had the
time to reproduce the build.

> It looks like version 2.6.0 is on its way. The build system now uses cmake
> instead of autotools. I'll try a bump to 2.5.90 to see if the issues are
> solved.

Great!

> BTW, why is this package still called "webkit" whereas it is in fact
> "webkit-gtk"?

Purely historical reasons I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
