From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 02:09:09 +0200
Subject: [Buildroot] [PATCH 2/3] nfs_utils: Fix for read-only rootfs
In-Reply-To: <1436626101-3598-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436626101-3598-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1436626101-3598-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150713020909.477633a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 11 Jul 2015 16:48:20 +0200, Maxime Hadjinlian wrote:
> In order to work on a read-only rootfs, nfs_utils would like to write
> stuff to /var/lib/nfs, since it's not a tmpfs, it won't work.
> 
> Instead of doing little dances around the filesystem, tell nfs_utils to
> use /run/nfs for everyone.
> 
> Modify the startup script accordingly.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/nfs-utils/S60nfs       | 14 ++------------
>  package/nfs-utils/nfs-utils.mk |  3 ++-
>  2 files changed, 4 insertions(+), 13 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
