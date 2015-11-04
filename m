From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 22:50:12 +0100
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: prevent undesired cleanup
 with a usr merged target
In-Reply-To: <1446068186-13524-1-git-send-email-james.knight@rockwellcollins.com>
References: <1446068186-13524-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151104225012.0535c4ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Wed, 28 Oct 2015 17:36:26 -0400, James Knight wrote:
> The following commit prevents the e2fsprogs package from inadvertently
> removing its own binaries when a target includes BusyBox and is
> targeting a usr-merged environment.
> 
> While an action has been added to cleanup BusyBox-provided (if any)
> ext2-related tools when including e2fsprogs, the action will delete
> desired e2fsprogs binaries in an already prepared usr-merged target.
> Adjusting the cleanup to occur before installing e2fsprogs binaries so
> that if a usr-merged target exists, it will first delete the previous
> binaries (if any) followed by installing new binaries.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/e2fsprogs/e2fsprogs.mk | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
