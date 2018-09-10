From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:41:57 +0200
Subject: [Buildroot] [PATCH v2] parted: fix minor()/major() build
 failure due to glibc 2.28
In-Reply-To: <20180910140420.125870-1-giulio.benetti@micronovasrl.com>
References: <20180910140420.125870-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180910174157.3de39b5d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Sep 2018 16:04:20 +0200, Giulio Benetti wrote:
> glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
> and therefore <sys/sysmacros.h> must be included explicitly when
> major()/minor() are used.
> 
> This commit adds a patch to directly include <sys/sysmacros.h> into
> libparted/arch/linux.c files where minor() and major() macros are used.
> 
> Patch has been taken from parted upstream commit:
> http://git.savannah.gnu.org/cgit/parted.git/commit/?id=ba5e0451b51c983e40afd123b6e0d3eddb55e610
> 
> Fixes:
> http://autobuild.buildroot.net/results/323/3230abaf78b8df8d23310b37b4099050fdc76eb0//
> http://autobuild.buildroot.net/results/d3a/d3a3cd9963e5a2be1cec8fb553f5b20fc2e3c85c//
> http://autobuild.buildroot.net/results/ecf/ecfb634b5e6dac2c88b399fc1f1adc68ca42504c//
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> Changes V1->V2:
> * use upstream patch instead of creating new one
> * add entry into Fixes: list

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
