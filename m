From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:03:17 +0100
Subject: [Buildroot] [PATCH v1] wiringpi: fix static linking
In-Reply-To: <20170211220408.2835-1-ps.report@gmx.net>
References: <20170211220408.2835-1-ps.report@gmx.net>
Message-ID: <20170212150317.34be8d55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Feb 2017 23:04:08 +0100, Peter Seiderer wrote:
> Update patch 0001-Adjust-for-buildroot-build.patch to
> use real static linking (command line flag '-static' for
> target gpio-static).
> 
> Fixes [1]:
> 
>   [Link]
>   .../output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-fde-dip.o): In function `_Unwind_Find_FDE':
>   ...output/build/host-gcc-final-5.4.0/build/powerpc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:465: undefined reference to `dl_iterate_phdr'
>   collect2: error: ld returned 1 exit status
>   make[1]: *** [gpio-static] Error 1
>   make[1]: Leaving directory `.../output/build/wiringpi-2.32/gpio'
> 
> [1] http://autobuild.buildroot.net/results/b905617dda0e120d04c54daf7cae2bad236ac767
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../wiringpi/0001-Adjust-for-buildroot-build.patch | 30 ++++++++++++----------
>  1 file changed, 17 insertions(+), 13 deletions(-)

Applied to master, thanks. Don't forget to send your patch upstream.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
