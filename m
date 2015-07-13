From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 21:03:12 +0200
Subject: [Buildroot] [PATCH v3] board/wandboard: add a genimage config
In-Reply-To: <1436813445-17914-1-git-send-email-arnout@mind.be>
References: <1429305644-9284-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1436813445-17914-1-git-send-email-arnout@mind.be>
Message-ID: <20150713210312.4fc5ec89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Mon, 13 Jul 2015 20:50:45 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> 
> This patch adds a genimage config file and a post-image script for the
> Wandboard, to generate a medium image "sdcard.img", ready to be booted.
> The image contains the layout explained in the board readme.txt file:
> U-Boot, its environment, and an Ext2 rootfs partition.
> 
> The defconfig has been slightly changed to enable this feature. Also
> lighten the readme file since the config file is documented and simpler.
> 
> Tested on a Wandboard Solo.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> [Arnout: change the name of the tmp dir, and remove it before using
> it.]
> ---
> v3 [Arnout]
>  - Change the name of the tmp dir to genimage.tmp, which is more
>    consistent with other names we use e.g. for iso9660.
>  - Remove the tmp dir before running genimage instead of after.
>    We normally don't remove any (partial) build artefacts, but on the
>    other hand genimage barfs if the directory exists already.
> ---
>  board/wandboard/genimage.cfg  | 32 ++++++++++++++++++++++++++++++++
>  board/wandboard/post-image.sh | 16 ++++++++++++++++
>  board/wandboard/readme.txt    | 41 +++++++++--------------------------------
>  configs/wandboard_defconfig   |  2 ++
>  4 files changed, 59 insertions(+), 32 deletions(-)
>  create mode 100644 board/wandboard/genimage.cfg
>  create mode 100755 board/wandboard/post-image.sh

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
