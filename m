From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 18:04:11 +0100
Subject: [Buildroot] [PATCH 1/1] cubieboard2: update board defconfig
In-Reply-To: <1451353925-24429-1-git-send-email-nunes.erico@gmail.com>
References: <1451353925-24429-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20151229180411.496ee52f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Erico Nunes,

On Mon, 28 Dec 2015 23:52:05 -0200, Erico Nunes wrote:
> This patch updates the Cubieboard2 board defconfig to use newer u-boot
> and linux versions, along with a few other improvements.
> The other improvements were mostly backported from the recent Orange Pi
> defconfig inclusion and are related to image generation.
> linux-sunxi.org was used as a reference for both linux and u-boot
> defconfig names.
> 
> In detail:
> - Update linux to vanilla upstream -- currently 4.3.3 is the most
> up-to-date. Although it lacks some features present only in the
> linux-sunxi 3.4 branch, upstream support appears to be relatively mature
> and is already being deployed by default by distributions such as Arch
> Linux ARM.
> - Update u-boot to vanilla upstream 2015.10. According to
> linux-sunxi.org, upstream fully supports major functions (except NAND)
> since 2015.07.
> - Change image format to zImage and drop custom image generation script
> in favour of genimage, as pointed out by reviewers in the Orange Pi
> defconfig submission.
> 
> This was tested in a Cubieboard2 board with boot from mmc and it boots
> fine to login prompt.
> 
> This has not been tested in a Cubieboard (A10) as I don't own any; the
> version bumps probably apply to it although there are some differences
> (lack of VFPv4 support, Cortex-A8 instead of Cortex-A7), so I have kept
> the current Cubieboard defconfig and its scripts. This one has been only
> build-tested.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  board/cubietech/cubieboard2/boot.cmd      |  5 +++
>  board/cubietech/cubieboard2/genimage.cfg  | 36 +++++++++++++++++++++
>  board/cubietech/cubieboard2/post-build.sh | 11 +++++++
>  board/cubietech/cubieboard2/post-image.sh | 16 +++++++++
>  configs/cubieboard2_defconfig             | 54 +++++++++++++------------------
>  5 files changed, 90 insertions(+), 32 deletions(-)
>  create mode 100644 board/cubietech/cubieboard2/boot.cmd
>  create mode 100644 board/cubietech/cubieboard2/genimage.cfg
>  create mode 100755 board/cubietech/cubieboard2/post-build.sh
>  create mode 100755 board/cubietech/cubieboard2/post-image.sh

Thanks a lot, I've applied, after a minor tweak on the commit title.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
