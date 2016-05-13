From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:07:41 +0200
Subject: [Buildroot] [PATCH v1] Makefile: fix rootfs overlay with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <1461439109-28101-1-git-send-email-ps.report@gmx.net>
References: <1461439109-28101-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160513220741.4800124c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Apr 2016 21:18:29 +0200, Peter Seiderer wrote:
> Use rsync with '--keep-dirlinks' option to prevent rootfs overlay to
> overwrite /usr, /bin, /sbin and /lib links in case BR2_ROOTFS_MERGED_USR
> option is enabled.
> 
> Steps to reproduce failure:
> 
> - enable BR2_ROOTFS_MERGED_USR
> - mkdir some_path/rootfs-overlay/lib/firmware/some_file.txt
> - enable BR2_ROOTFS_OVERLAY="some_path/rootfs-overlay"
> - run 'make'
> - 'target/lib' contains only the files from 'some_path/rootfs-overlay/lib' instead
>   of the original symlink 'lib -> usr/lib'.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
