From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 11:58:58 +0200
Subject: [Buildroot] [PATCH 1/1] cutelyst: link with libatomic when
 needed
In-Reply-To: <20180827164102.21147-1-fontaine.fabrice@gmail.com>
References: <20180827164102.21147-1-fontaine.fabrice@gmail.com>
Message-ID: <20180828115858.51e36981@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Aug 2018 18:41:02 +0200, Fabrice Fontaine wrote:
> On some architectures, atomic binutils are provided by the libatomic
> library from gcc. Linking with libatomic is therefore necessary,
> otherwise the build fails with:
> 
> sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
> 
> This is often for example the case on sparcv8 32 bit.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/9e307ab9c7067b26d7b33a572204394808e25772
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

If this package unconditionally needs atomic intrinsics, then it also
needs to depends on BR2_TOOLCHAIN_HAS_ATOMIC. Indeed, libatomic is not
available in gcc < 4.8.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
