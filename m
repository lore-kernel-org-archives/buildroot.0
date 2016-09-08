From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 21:55:34 +0200
Subject: [Buildroot] [PATCH] gcc/gcc-final: Disable libcilkrts when
 using static libs
In-Reply-To: <1473345195-10495-1-git-send-email-bos@je-eigen-domein.nl>
References: <1473345195-10495-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20160908215534.2c49d1bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Sep 2016 16:33:15 +0200, Floris Bos wrote:
> Disable libcilkrts when building static, as there is no static version:
> https://software.intel.com/en-us/articles/intel-cilk-plus-runtime-library-libcilkrts-can-only-be-linked-dynamically/
> 
> Fixes the following toolchain build error when building for i386 and
> BR2_STATIC_LIBS=y + BR2_TOOLCHAIN_BUILDROOT_CXX=y is set:
> 
> ../../../libcilkrts/runtime/sysdep-unix.c:603:19:
> fatal error: dlfcn.h: No such file or directory
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/gcc/gcc-final/gcc-final.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
