From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 21:43:06 +0100
Subject: [Buildroot] [PATCH] boards: add FriendlyARM Nanopi NEO
In-Reply-To: <1478204278-9650-1-git-send-email-yann.morin.1998@free.fr>
References: <1478204278-9650-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161103214306.6d98fb78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 21:17:58 +0100, Yann E. MORIN wrote:
> The FriendlyARM Nanopi NEO is a 4x4cm? board with an Allwiner H3 SoC:
>   - quad-core Cortex-A7 @1.2GHz
>   - 256 or 512MiB of DDR
>   - uSDCard as only storage option
>   - 3x USB 2.0 host (one socket, two on expansion pin-holes)
>   - 1x USB 2.0 OTG (also used as power source)
>   - 10/100 etehrnet MAC
>   - GPIOs, SPI, I2c...
> 
> Support for the Nanopi NEO in U-Boot and Linux is very recent, so much
> so that we have to use an -rc tag for U-Boot and a special Linux tree.
> 
> As for Linux, I pushed a git tree on Github with a single tag that
> matches what is currently queued in the sunxi-next queued for 4.10,
> based on 4.9-rc3. All those commits are from Maxime's tree, the
> maintainer for most sunxi stuff.
> 
> This also means that we can't use the Linux headers from the kernel
> being built (which is what we usually do) because those report 4.9,
> while Buildroot currently knows only of 4.8 at best. So this is what we
> use.
> 
> Unfortunately, support for the ethernet MAC and the USB OTG are not yet
> upstream, but are being actively worked on.
> 
> The Nanopi NEO is very similar to the Orangepi PC, so I was able to
> scanvenge most of its configuration. ;-)
> 
> Thanks Maxime for your help on IRC! :-)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> 
> ---
> Notes:
>   - when support finally lands in upstream and there is a release,
>     I'll update this defconfig as well;
>   - this defconfig should also work for the Nanopi NEO AIR, which
>     carries a WiFi+BT chip in lieue of an ethernet connector plus 8GiB
>     of eMMC; totally untested by lack of the board so far, to come
>     soonish I hope.
> ---
>  board/nanopi-neo/boot.cmd      |  8 ++++++++
>  board/nanopi-neo/genimage.cfg  | 34 +++++++++++++++++++++++++++++++++
>  board/nanopi-neo/post-build.sh | 12 ++++++++++++
>  board/nanopi-neo/post-image.sh | 15 +++++++++++++++
>  board/nanopi-neo/readme.txt    | 43 ++++++++++++++++++++++++++++++++++++++++++
>  configs/nanopi_neo_defconfig   | 42 +++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 154 insertions(+)
>  create mode 100644 board/nanopi-neo/boot.cmd
>  create mode 100644 board/nanopi-neo/genimage.cfg
>  create mode 100755 board/nanopi-neo/post-build.sh
>  create mode 100755 board/nanopi-neo/post-image.sh
>  create mode 100644 board/nanopi-neo/readme.txt
>  create mode 100644 configs/nanopi_neo_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
