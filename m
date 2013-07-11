From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Jul 2013 11:03:37 -0300
Subject: [Buildroot] [PATCH] gcc: remove BR2_GCC_SHARED_LIBGCC option
In-Reply-To: <1373299185-9359-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373299185-9359-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <51DEBB39.3020309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/08/2013 12:59 PM, Thomas Petazzoni wrote:

> Commit 6b48b4803450 ("add a know to enable/disable building a shared
> libgcc"), from october 2006, isn't really as to why a
> BR2_GCC_SHARED_LIBGCC option was needed. However, now that gcc has
> been converted to the package infrastructure, it causes problems
> because the host packages are always being passed --enable-shared
> --disable-static, so re-adding --disable-shared on top of that break
> things.
> 
> Moreover, our tests indicate that both a shared *and* a static version
> of libgcc are built, and that linking dynamically and statically a
> program that uses libgcc_s gives correct results: dynamically linked
> against libgcc_s in the first case, statically linked in the second
> case.
> 
> Therefore, it appears that this option is no longer necessary, and
> removing it has the advantage of fixing the builds of
> qemu_mips64_malta_defconfig and qemu_sparc_ss10_defconfig, both of
> which had BR2_GCC_SHARED_LIBGCC not enabled.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
