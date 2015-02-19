From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:58:18 +0100
Subject: [Buildroot] [PATCH] btrfs-progs: fix static build with gettext
In-Reply-To: <be7f33ed40d541fb09ae8582b83f3b5c39d5dd27.1424175644.git.baruch@tkos.co.il>
References: <be7f33ed40d541fb09ae8582b83f3b5c39d5dd27.1424175644.git.baruch@tkos.co.il>
Message-ID: <20150219225818.63fccb6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 17 Feb 2015 14:20:44 +0200, Baruch Siach wrote:
> gettext needs -pthread. Incidentally this change was also made in the package
> Makefile itself for a different reason.
> 
> Also, drop -lm to match upstream change.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a53/a53f31355e955c734010922b47084605e13708ef/
> http://autobuild.buildroot.net/results/43d/43deeeda31d9750b37e1f1058c3313a387843bee/
> 
> and more.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/btrfs-progs/btrfs-progs.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

> -BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lm -lz -llzo2 -L. -lintl"
> +BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lz -llzo2 -L. -lintl -pthread"

This is really ugly, because we have to duplicate the lib_LIBS value
from the package Makefile, and whenever it gets changed in the package
Makefile, we need to remember to also change it here. Not great :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
