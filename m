From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:11:57 +0200
Subject: [Buildroot] [PATCH] Makefile: Remove KBUILD_VERBOSE and quiet
In-Reply-To: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <20150920151157.7dc9b021@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

C?dric,

On Mon,  7 Sep 2015 22:47:26 +0200, C?dric Marie wrote:
> KBUILD_VERBOSE and quiet variables are set and exported, but they are
> not used. We can safely remove them.
> 
> These variables are inherited from the Makefile of the Linux kernel,
> and are not used in Buildroot.
> 
> In support/scripts/mkmakefile, quiet value is checked, but the test is
> always true (quiet is never set to silent_), so the test can be removed
> as well.
> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
> ---
>  Makefile                   | 20 ++++++--------------
>  support/scripts/mkmakefile |  4 +---
>  2 files changed, 7 insertions(+), 17 deletions(-)

Following the discussion you had with Arnout, and your own report that
this patch was breaking things in the Busybox and Linux kernel build, I
marked this patch as "Changes Requested" in patchwork.

Will you work on a new iteration of this patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
