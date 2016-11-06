From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 22:22:14 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-05
In-Reply-To: <20161106193346.GA27313@waldemar-brodkorb.de>
References: <20161106073024.E75F820798@mail.free-electrons.com>
 <20161106150623.2b7fd549@free-electrons.com>
 <20161106193346.GA27313@waldemar-brodkorb.de>
Message-ID: <20161106222214.72b12e78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 6 Nov 2016 20:33:46 +0100, Waldemar Brodkorb wrote:

> This commit adds musl support via a patch:
> 0b6b67f34d6d4aeb340bbca579dbf85363c3f4ea
> 
> For fenv.h UCLIBC_HAS_FENV should be enabled in uClibc-ng config.
> That is not the case.
> 
> I can't see why fenv.h would be installed in the past without
> UCLIBC_HAS_FENV.
> 
> Without the patch, jamvm compiles fine.

Thanks for the investigation! I've pushed
https://git.buildroot.org/buildroot/commit/?id=a1ca3dcb590852880770fe879ea59b6d8222b010,
which makes the patch smarter: it now detects if <fenv.h> is available
or not, and acts accordingly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
