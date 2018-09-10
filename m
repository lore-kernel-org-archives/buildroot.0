From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 09:21:22 +0200
Subject: [Buildroot] [PATCH] motion: fix build failure due to missing
 drmGetVersion() and drmFreeVersion()
In-Reply-To: <20180909193343.117159-1-giulio.benetti@micronovasrl.com>
References: <20180909193343.117159-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180910092122.188e26ed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 21:33:43 +0200, Giulio Benetti wrote:
> During static linking -ldrm is listed too early respect -lavutil.
> This cause build failure.
> 
> Append extra -ldrm at the tail of $(LIBS) list.
> 
> Fixes:
> http://autobuild.buildroot.net/results/395/395be1a9cab824b82ef34c2ebd84d54243029b33//
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

This fix should not be needed: the configure.ac script is using
pkg-config to detect ffmpeg libraries, and pkg-config should return the
right libraries.

In addition, your patch will badly break the build: ffmpeg is only an
optional dependency of motion, and DRM support in ffmpeg itself is
optional, so the patch is clearly wrong.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
