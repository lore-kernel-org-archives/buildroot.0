From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:25:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: fix fsck when using
 systemd
In-Reply-To: <1465661756-11389-1-git-send-email-martin@barkynet.com>
References: <1465661756-11389-1-git-send-email-martin@barkynet.com>
Message-ID: <20160615232559.2540073a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Jun 2016 17:15:56 +0100, Martin Bark wrote:
> Commit a93fc34 modified e2fsprogs to symlink /usr/sbin/fsck to /sbin/fsck
> to keep systemd happy.  However, later on commit c5bd8af6 has forced
> /usr/sbin to be a symlink to /sbin when using systemd.  This means fsck
> gets destroyed as a symlink to itself when using systemd or when setting
> BR2_ROOTFS_MERGED_USR.
> 
> Since commit c5bd8af6 obsoletes commit a93fc34 revert the changes from
> commit a93fc34 to solve the issue.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/e2fsprogs/e2fsprogs.mk | 9 ---------
>  1 file changed, 9 deletions(-)

Applied to master, thanks. Thanks Yann for the review.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
