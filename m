From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Dec 2018 21:59:30 +0100
Subject: [Buildroot] [PATCH v4 0/3] Misc fs/common.mk improvements
In-Reply-To: <20181203210508.27831-1-thomas.petazzoni@bootlin.com>
References: <20181203210508.27831-1-thomas.petazzoni@bootlin.com>
Message-ID: <519cd033-a04d-bfee-a12d-02b631e6b181@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/12/2018 22:05, Thomas Petazzoni wrote:
> Hello,
> 
> This small patch series is a new iteration of the few remaining
> patches from Yann's series "[PATCH 0/6 v2] fs: fix and better handle
> capabilities".
> 
> In Yann series, patches 1 to 3 have already been applied.
> 
> Patch 4 was not liked by Arnout, with some good explanation.
> 
> In this patch series, I propose:
> 
>  - An additional patch to rename FULL_DEVICE_TABLE to
>    ROOTFS_FULL_DEVICES_TABLE to be consistent with
>    ROOTFS_FULL_USERS_TABLE.
> 
>  - Yann's original PATCH 5/6, but reworked to apply without what was
>    his PATCH 4/6.
> 
>  - A patch that reimplements PATCH 6/6 from Yann, but in a different
>    way, due to the fact that his PATCH 4/6 was not taken, and
>    therefore there is no permisson/device table split.

 Applied series to master, thanks.


 Regards,
 Arnout

> 
> Changes since v3:
> 
>  - Reintegrate the idea of Yann's PATCH 6/6 (which was correct after
>    all!), but in a way that works without splitting permission/device
>    tables, since PATCH 4/6 from Yann was not accepted.
> 
> Thanks,
> 
> Thomas
> 
> 
> Thomas Petazzoni (2):
>   fs/common.mk: rename FULL_DEVICE_TABLE to ROOTFS_FULL_DEVICES_TABLE
>   fs/common.mk: make sure that static devices from packages are created
> 
> Yann E. MORIN (1):
>   fs/common.mk: allow user provided permissions to override packages
>     permissions
> 
>  fs/common.mk | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
