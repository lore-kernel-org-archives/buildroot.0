From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 12:08:12 +0200
Subject: [Buildroot] [PATCH] gcc: add upstream patch to fix build of
 GCC6 with GCC7
In-Reply-To: <20170601073758.9833-1-joerg.krause@embedded.rocks>
References: <20170601073758.9833-1-joerg.krause@embedded.rocks>
Message-ID: <20170605120812.46c4496f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Jun 2017 09:37:58 +0200, J?rg Krause wrote:
> Building host-gcc-initial with GCC7 on the host fails due to the
> comparison of a pointer to an integer in ubsan_use_new_style_p, which
> is forbidden by ISO C++:
> 
> ubsan.c:1474:23: error: ISO C++ forbids comparison between pointer and
> integer [-fpermissive]
>        || xloc.file == '\0' || xloc.file[0] == '\xff'
> 
> Backported from:
> https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=239971
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../6.3.0/942-ubsan-fix-check-empty-string.patch   | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/gcc/6.3.0/942-ubsan-fix-check-empty-string.patch

Applied to master, thanks. Peter: do we want this patch in the LTS
branch? We already had gcc 6.x available in the LTS branch, do we want
to make sure it builds properly for people using gcc 7.x as their host
compiler?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
