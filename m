From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:42:15 +0200
Subject: [Buildroot] [PATCH v1 2/4] package/exfatprogs: fix compile
 failure node may be used uninitialized
In-Reply-To: <20200509162117.8728-2-ps.report@gmx.net>
References: <20200509162117.8728-1-ps.report@gmx.net>
 <20200509162117.8728-2-ps.report@gmx.net>
Message-ID: <20200509224215.59de6aa0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 May 2020 18:21:15 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   - http://autobuild.buildroot.net/results/5c5/5c5d71fde80a4f2f027085bdb0fae9fb76ab9d32
> 
>   fsck.c:1062:18: error: 'node' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>        node->parent = dir;
>                     ^
>   fsck.c:870:22: note: 'node' was declared here
>     struct exfat_inode *node;
>                         ^
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...k-fix-node-may-be-used-uninitialized.patch | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/exfatprogs/0003-fsck-fix-node-may-be-used-uninitialized.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
