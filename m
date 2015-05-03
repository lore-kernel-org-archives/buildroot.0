From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 May 2015 15:31:34 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/mono: bump to version 4.0.1
In-Reply-To: <1430402595-5355-3-git-send-email-angelo.compagnucci@gmail.com>
References: <1430402595-5355-1-git-send-email-angelo.compagnucci@gmail.com>
 <1430402595-5355-3-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150503153134.5f5764f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 30 Apr 2015 16:03:15 +0200, Angelo Compagnucci wrote:
> This patch:
> 
> * bumps mono version to 4.0.1.
> * Removes no more needed patches included upstream
> * Removes profile switches no more present in configure
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  .../0003-mono-context.h-fix-build-on-MIPS.patch    | 33 --------
>  ...e-ppc-sigctx-monoctx-conversion-code-to-m.patch | 92 ----------------------
>  ...build-errors-in-mono-context.c-on-ppc64el.patch | 84 --------------------
>  package/mono/Config.in                             | 22 ------
>  package/mono/mono.mk                               |  9 +--
>  5 files changed, 1 insertion(+), 239 deletions(-)
>  delete mode 100644 package/mono/0003-mono-context.h-fix-build-on-MIPS.patch
>  delete mode 100644 package/mono/0004-jit-Move-the-ppc-sigctx-monoctx-conversion-code-to-m.patch
>  delete mode 100644 package/mono/0005-Fix-build-errors-in-mono-context.c-on-ppc64el.patch

This commit is causing a build failure:
http://autobuild.buildroot.org/results/b97/b97543b26f8bc25a9e997bb66434ae9660a2f198/build-end.log.
It might be a parallel installation issue:

/usr/bin/install: cannot create regular file `/home/peko/autobuild/instance-0/output/host/usr/lib/mono/xbuild-frameworks/.NETFramework/v3.0/RedistList/FrameworkList.xml': File exists/usr/bin/install: cannot create regular file `/home/peko/autobuild/instance-0/output/host/usr/lib/mono/xbuild/Microsoft/Portable/v4.5/Microsoft.Portable.Common.targets': File exists

Can you investigate?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
