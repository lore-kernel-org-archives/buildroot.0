From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 16:41:56 +0200
Subject: [Buildroot] [PATCH v2 1/2] coreutils: fix chroot installation
In-Reply-To: <2b42d6f4f947a7423813916cd6f8e5f37c5b113a.1531338679.git.baruch@tkos.co.il>
References: <2b42d6f4f947a7423813916cd6f8e5f37c5b113a.1531338679.git.baruch@tkos.co.il>
Message-ID: <20180716164156.56c56776@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Jul 2018 22:51:18 +0300, Baruch Siach wrote:
> Since commit 256bb383fb7 (coreutils: use single binary in symlink
> method) the chroot move command creates a dangling symlink, because the
> symlink target is 'coreutils' which is not in the /usr/sbin/ directory.
> Instead of moving, remove the coreutils installed symlink, and create a
> new one in $(TARGET_DIR)/usr/sbin with the correct target.
> 
> Should also fix (busybox):
> http://autobuild.buildroot.net/results/6b3/6b39648b466738162516aa50ab328d839ec85448/
> 
> Cc: Carlos Santos <casantos@datacom.ind.br>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: Drop ../usr from symlink target (Arnout, Carlos)
> ---
>  package/coreutils/coreutils.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
