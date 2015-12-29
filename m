From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 17:55:58 +0100
Subject: [Buildroot] [PATCH] unionfs: add patch to revert to old pre-1.0
 meta directory
In-Reply-To: <1450424821-30691-1-git-send-email-peter@korsgaard.com>
References: <1450424821-30691-1-git-send-email-peter@korsgaard.com>
Message-ID: <20151229175558.1a7dd6f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Fri, 18 Dec 2015 08:47:01 +0100, Peter Korsgaard wrote:
> Unionfs changed its meta directory from .unionfs to .unionfs-fuse with the
> unionfs -> unionfs-fuse rename.  The rename later got reverted everywhere
> but the meta directory, so now unionfs doesn't find the whiteout files from
> older releases.
> 
> Revert back to the pre-1.0 behaviour to fix this.
> 
> Patch sent upstream: https://github.com/rpodgorny/unionfs-fuse/pull/38
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...0001-Revert-to-old-pre-1.0-meta-directory.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/unionfs/0001-Revert-to-old-pre-1.0-meta-directory.patch

Applied, thanks. Since your patch was applied upstream, I've adjusted
the commit log accordingly, and added a note in the patch itself with a
reference to the upstream commit.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
