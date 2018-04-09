From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:41:20 +0200
Subject: [Buildroot] [PATCH v3 1/2] cramfs: change to new site location
In-Reply-To: <20180407133543.90767-2-chris.brandt@renesas.com>
References: <20180407133543.90767-1-chris.brandt@renesas.com>
 <20180407133543.90767-2-chris.brandt@renesas.com>
Message-ID: <20180409114120.6d63f18e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Apr 2018 08:35:42 -0500, Chris Brandt wrote:
> As of Linux-4.15, cramfs now has a official maintainer again.
> Additionally, that person is hosting and maintaining a new version of
> cramfs-tools.
> 
> Patches 0001-endian.patch and 0003-fix-missing-types.patch are no longer
> needed because they have been upstreamed.
> 
> However, since patch 0002-cygwin_IO.patch is so old, it is being
> removed until someone that needs it can reapply and test it. At
> that point, they should submit the changes to the new cramfs-tools
> maintainer instead of adding the patches back here.
> 
> Please note that cross-endian support for cramfsck is not supported
> at this time.
> 
> Cc: Nicolas Pitre <nico@linaro.org>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
> v3:
>  - Added note about cramfsck not supporting endian swap
>  - Added Reviewed-by
> v2:
>  - Update hash to include new endian support
> ---
>  fs/cramfs/Config.in                         |   2 +-
>  fs/cramfs/cramfs.mk                         |   4 +-
>  package/cramfs/0001-endian.patch            | 288 ----------------------------
>  package/cramfs/0002-cygwin_IO.patch         |  15 --
>  package/cramfs/0003-fix-missing-types.patch |  17 --
>  package/cramfs/Config.in                    |   2 +-
>  package/cramfs/Config.in.host               |   2 +-
>  package/cramfs/cramfs.hash                  |   2 +-
>  package/cramfs/cramfs.mk                    |   4 +-
>  9 files changed, 8 insertions(+), 328 deletions(-)
>  delete mode 100644 package/cramfs/0001-endian.patch
>  delete mode 100644 package/cramfs/0002-cygwin_IO.patch
>  delete mode 100644 package/cramfs/0003-fix-missing-types.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
