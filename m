From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 14:20:51 +0200
Subject: [Buildroot] [PATCH] busybox: don't clobber dangling symlinks
In-Reply-To: <412a4a2df4b4bd31b183dba362dca4a326535624.1531825303.git.baruch@tkos.co.il>
References: <412a4a2df4b4bd31b183dba362dca4a326535624.1531825303.git.baruch@tkos.co.il>
Message-ID: <20180821142051.7020cd34@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Jul 2018 14:01:43 +0300, Baruch Siach wrote:
> We sometimes create dangling symlinks in the target directory. That is
> because we need canonical targets, as relative targets don't work well
> with BR2_ROOTFS_MERGED_USR. For example, the vim package installs the
> /bin/vi symlink to /usr/bin/vim. This symlink might be dangling when the
> build host has no vim installed there.
> 
> Patch the busybox install.sh script to avoid clobber of dangling
> symlinks.
> 
> Fixes:
> http://autobuild.buildroot.net/results/796/796107430db6545401d9926e84f19eaf2040b756/
> 
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Carlos Santos <casantos@datacom.com.br>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...l.sh-don-t-clobber-dangling-symlinks.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/busybox/0003-install.sh-don-t-clobber-dangling-symlinks.patch

Applied to master, thanks.

Carlos: I know you disagreed with this patch, but since it has been
merged by the upstream Busybox developers, I don't see the point of not
merging it in Buildroot as well, since we will anyway get this behavior
at the next Busybox version bump.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
