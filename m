From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Jul 2020 09:11:33 +0200
Subject: [Buildroot] [PATCH 1/5] package/libwebsockets: remove
 dependency on mmu
In-Reply-To: <20200726022901.295552-2-aduskett@gmail.com>
References: <20200726022901.295552-1-aduskett@gmail.com>
 <20200726022901.295552-2-aduskett@gmail.com>
Message-ID: <20200726091133.0044e25a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jul 2020 19:28:57 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Six years ago, commit b6b5bb518d28850e024b90db1129b7f86e9d416c added the MMU
> dependency for the libwebsockets package. However, according to the git
> history of the CMakeLists.txt file, libwebsockets has supported the vfork
> function for at least the last five years.
> 
> After testing with the qemu_arm_versatile_nommu_defconfig and the
> br-arm-cortex-m4-full.config file, no errors occurred when building
> libwebsockets without MMU support.
> 
> Remove the dependency; it is no longer necessary.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libwebsockets/Config.in | 1 -
>  1 file changed, 1 deletion(-)

You forgot to have a look at the reverse dependencies of libwebsockets,
so I did that and updated the places where BR2_USE_MMU could be
dropped, in ttyd and janus-gateway.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
