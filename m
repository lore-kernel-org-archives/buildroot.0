From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 9 Jan 2021 16:32:05 +0300
Subject: [Buildroot] [PATCH v3 02/11] boot/mv-ddr-marvell: Bump to HEAD
 as of 20201207
In-Reply-To: <20201218202646.1060123-3-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-3-hi@senzilla.io>
Message-ID: <X/mwVYvTNW+tGYiV@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 18, 2020 at 08:27:15PM +0000, Dick Olsson via buildroot wrote:
> Rebase on the mv-ddr-devel branch as the release branches are no longer
> maintained.
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>
> ---
>  ...raining_leveling.c-uninitialized-var.patch | 31 -------------------
>  boot/mv-ddr-marvell/mv-ddr-marvell.hash       |  2 +-
>  boot/mv-ddr-marvell/mv-ddr-marvell.mk         |  4 +--
>  3 files changed, 3 insertions(+), 34 deletions(-)
>  delete mode 100644 boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch


Hello Dick,

My apologies for the late feedback. This change breaks the build for
MacchiatoBin board. I guess it also breaks the build for ClearFrog
GT 8k board. The reason is straightforward: both boards make use of
Marvell ATF v18.12.x which is compatible with mv-ddr-marvell release
devel-18.12.x. Your change bumps mv-ddr-marvell version, however the
new version is not compatible with older Marvell ATF release since
mv_ddr_topology_map structure has been changed.

Could you please clarify the reason behind this change ? There are no
users for mv-ddr-marvell other than Marvell ATF that is used only for
MacchiatoBin and ClearFrog GT 8k boards. So on the first glance it
looks like this change has been introduced as an accompanying 
update/cleanup during your work on adding EDK2 firmware.

If so, then I would suggest to revert this particular commit. Let me
know if you have any objections for this change.

Regards,
Sergey
