From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 15:18:31 +0200
Subject: [Buildroot] [PATCH V2 1/2] pkg-kconfig: support alternative
 .config location
In-Reply-To: <1473795934-27033-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1473795934-27033-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1473795934-27033-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160917151831.3dbafd9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Sep 2016 21:45:33 +0200, Eric Le Bihan wrote:
> Kconfig clones, such as openconf used by xvisor [1], do not look for
> .config at the root of the build directory, but in a subdirectory (e.g.
> build/openconf).
> 
> This patch introduces a new Makefile variable named
> $(2)_KCONFIG_DOTCONFIG, which contains the path to .config relative to
> the source directory of the package. It defaults to .config and can be
> overridden in the package Makefile.
> 
> It also creates the full directory hierarchy where the .config file is
> stored, in case it does not exist (e.g. in xvisor).
> 
> This allows the use of the kconfig-package infrastructure with packages
> relying on such clones.
> 
> [1] https://github.com/xvisor/xvisor/tree/master/tools/openconf
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/pkg-kconfig.mk | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

I've applied after changing the mkdir+cp combination to a call to
install -D, as suggested by Yann.

I've also added a follow-up commit that documents this new variable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
