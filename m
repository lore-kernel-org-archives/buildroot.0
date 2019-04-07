From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 15:11:47 +0200
Subject: [Buildroot] [PATCH] Revert "package/gettext-tiny: bump version
 to add --template option"
In-Reply-To: <20190407073708.11205-1-yann.morin.1998@free.fr>
References: <20190407073708.11205-1-yann.morin.1998@free.fr>
Message-ID: <20190407151147.02ada3fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Apr 2019 09:37:08 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> This reverts commit 758ea0e518492c703482a323653c3d20520b599b.
> 
> 758ea0e bumped gettext-tiny to the latest (at the time) head of the
> upstream git tree. In so doing, it included an upstream change of
> behaviour that eventually broke the build of packages that use
> -Werror=format-string.
> 
> Even though in Buildroot we usually try to avoid building with -Werror,
> it is sometimes hard to go against such flags, especially when the
> package uses an expicit, long list of such -Werror=foo flags.
> 
> Revert the bump.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/dec/decbbcad11fbf312f6e5fbe0bf32143bedb6610b/
>     [and many more...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Giulio Benetti <giulio.benetti@micronovasrl.com>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/gettext-tiny/gettext-tiny.hash | 2 +-
>  package/gettext-tiny/gettext-tiny.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I applied Vadim's patch instead, in order to give a chance to solve
both the rygel issue and the libglib2 issue. Let's see how it goes.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
