From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 17:26:00 +1100
Subject: [Buildroot] [PATCH] package/mpd: disable on SPARCV8, NIOS2,
 ARMV{4, 5}
In-Reply-To: <20170121161100.3142-1-joerg.krause@embedded.rocks>
References: <20170121161100.3142-1-joerg.krause@embedded.rocks>
Message-ID: <20170122172600.333588cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Jan 2017 17:11:00 +0100, J?rg Krause wrote:
> Since version 0.20 mpd uses the C++11 feature `std::exception_ptr` which
> is not available on architectures that do not have always-lock-free
> atomics for int.
> 
> The issue [1,2] has been fixed in GCC trunk r244051 [3] and will be
> available in GCC 7. However, as GCC 7 is not released yet and will not
> be before the next release of Buildroot, we disable the following
> architectures, which caused build errors on the autobuilders:
>   * SPARCV8
>   * NIOS2
>   * ARMV4
>   * ARMV5
> 
> Fixes:
> http://autobuild.buildroot.net/results/1c5/1c5090fe361b08c60277e54be1bfa7e80d5d31d8/
> http://autobuild.buildroot.net/results/076/07621b958a3a35066790543586549aa41f2effa9/
> http://autobuild.buildroot.net/results/7b1/7b12d41bee83ad20251dbc7026e0fc665d5abe0c/
> .. and many more

How many packages are potentially affected by this?

The reason I'm asking is because I believe a
BR2_TOOLCHAIN_HAS_GCC_BUG_xyz hidden option would be a bit better:

 1. It would document what this is for

 2. It would avoid repeating the architecture conditions

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
