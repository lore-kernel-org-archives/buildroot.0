From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 23:38:35 +0100
Subject: [Buildroot] [PATCH v2] openswan: do not use -fPIE for static
 builds
In-Reply-To: <1425547337-20035-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1425547337-20035-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150305233835.732f978d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 5 Mar 2015 09:22:17 +0000, Vicente Olivert Riera wrote:
> -fPIE produces shared objects, and shared objects need "/lib/ld.so"
> which won't be present on a statically built target. So, building
> openswan with -static -fPIE is invalid and will fail with an error like
> this one:
> 
> /br/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-ctng-linux-uclibc/4.8.2/../../../../mipsel-ctng-linux-uclibc/bin/ld:
> /br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libgmp.a(lt2-add.o):
> relocation R_MIPS_HI16 against `__gnu_local_gp' can not be used when
> making a shared object; recompile with -fPIC
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/68b/68b2211cc7acfbdfed8d4b161cbdaf1429315017/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
