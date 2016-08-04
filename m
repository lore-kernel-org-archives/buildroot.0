From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 16:38:44 +0200
Subject: [Buildroot] [PATCH] eudev: add patch to fix getrandom() system
 call on ARM64
In-Reply-To: <7h7fbwk3l2.fsf@baylibre.com>
References: <1470301486-1223-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <7h7fbwk3l2.fsf@baylibre.com>
Message-ID: <20160804163844.68287f49@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 04 Aug 2016 07:31:53 -0700, Kevin Hilman wrote:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> > When the kernel headers in the toolchain don't provide __NR_getrandom,
> > eudev has a predefined set of values. However, the provided value for
> > ARM64 is incorrect, and causes a runtime problem on this architecture
> > when old kernel headers (not providing __NR_getrandom) are used.
> >
> > This commit adds a patch to eudev to fix this issue.
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
> 
> Thanks for the patch, I tested it and the syscall splat goes away.
> 
> Tested-by: Kevin Hilman <khilman@baylibre.com>

Thanks. FWIW, the patch has been submitted upstream:
https://github.com/gentoo/eudev/pull/134.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
