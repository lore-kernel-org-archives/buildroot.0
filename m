From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Sep 2014 15:41:19 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external: Improve lib
 subdirectory matching
In-Reply-To: <1409750954-3636-1-git-send-email-byj.tea@gmail.com>
References: <1409750954-3636-1-git-send-email-byj.tea@gmail.com>
Message-ID: <20140903154119.5f501095@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bai Yingjie,

On Wed,  3 Sep 2014 21:29:14 +0800, Bai Yingjie wrote:
> Some external toolchain provides lib32-fp which supports FPU instructions
> as well as lib32 in sys-root/usr, but lib32-fp can't be matched and
> in consequence causes a compile error.
> 
> The toolchain in this case is OCTEON mips64 toolchain, and the CFLAGS
> cause the issue is -march=octeon3.
> 
> This patch improves the matching by accepting lib(32|64)?([^/]*)? as lib
> name.
> 
> Signed-off-by: Bai Yingjie <byj.tea@gmail.com>

Thanks for this contribution! Is this toolchain available publicly? The
problem I have is that if the toolchain is not available, then we have
no way to test if future changes to the external toolchain logic will
not break the support for this toolchain.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
