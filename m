From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:38:34 +0200
Subject: [Buildroot] [PATCH] busybox: fix musl build issues
In-Reply-To: <1445085778-3358-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445085778-3358-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151018153834.5263ccdc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Oct 2015 14:42:58 +0200, Thomas Petazzoni wrote:
> Musl doesn't implemented wmtp, and its utmp support is not sufficient
> to build the latest versions of Busybox, so let's disable wtmp and
> utmp support in Busybox for musl toolchains.
> 
> We re-use an existing define BUSYBOX_INTERNAL_SHADOW_PASSWORDS that
> was used to do some musl-related tweaks to the Busybox configuration
> around shadow password functions, and extend it to also do the
> utmp/wtmp tweaks. In the process, we rename the define to
> BUSYBOX_MUSL_TWEAKS.
> 
> Note that BUSYBOX_KCONFIG_FIXUP_CMDS continues to call
> BUSYBOX_INTERNAL_SHADOW_PASSWORDS because there is another definition
> of this macro under other conditions.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/b96/b96ffad13bca5e6fbf7ce79538aacbfe27b1eff3/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/busybox/busybox.mk | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
