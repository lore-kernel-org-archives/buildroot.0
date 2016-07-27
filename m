From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 23:38:04 +0200
Subject: [Buildroot] [PATCH v11 1/2] package/btrfs-progs: install to
 staging directory
In-Reply-To: <1469394628-19412-1-git-send-email-christian@paral.in>
References: <1469394628-19412-1-git-send-email-christian@paral.in>
Message-ID: <20160727233804.241fee0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 14:10:27 -0700, Christian Stewart wrote:
> Other packages when building against btrfs-progs require headers in the
> staging directory under /usr/include/btrfs. This patch enables
> installing btrfs-progs to the staging directory to enable other packages
> to build against the btrfs-progs headers.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/btrfs-progs/btrfs-progs.mk | 1 +
>  1 file changed, 1 insertion(+)

I've applied after fixing the BR2_STATIC_LIBS=y case, by:

 1/ Adding a BTRFS_PROGS_INSTALL_STAGING_OPTS variable

 2/ Adding a patch that installs the static lib and the headers during
    "make install-static".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
