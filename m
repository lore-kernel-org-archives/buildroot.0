From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 16:32:51 +0200
Subject: [Buildroot] [PATCH 2/2] fwup: link in pthreads for static builds
In-Reply-To: <1470868546-8237-2-git-send-email-fhunleth@troodon-software.com>
References: <1470868546-8237-1-git-send-email-fhunleth@troodon-software.com>
 <1470868546-8237-2-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20161016163251.33b3e357@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 18:35:46 -0400, Frank Hunleth wrote:
> Both libconfuse (via libintl) and libarchive have references to pthreads
> but do not specify pthreads in their pkg-config descriptions. This
> change adds pthreads to the fwup linker options so that the link step
> succeeds.
> 
> Fixes autobuilder failures:
> 
> http://autobuild.buildroot.net/results/ce3793c79d5dc4e296d645c75f22e121f35030d3/
> http://autobuild.buildroot.net/results/0c5ffec5438f766dade951a64ebfa1b734a3c0aa/
> http://autobuild.buildroot.net/results/802/802b6d77e1b77b7c8fcb8f3b394cdabfd406de7a/
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Thanks to the recent uClibc-ng bump, which merges libpthread into libc,
the problem that this patch was trying to fix no longer exists.

I double checked: with an older uClibc-ng toolchain, I could reproduce
the static linking issue. With the newer uClibc-ng toolchain, the built
went fine.

Therefore, I've marked your patch as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
