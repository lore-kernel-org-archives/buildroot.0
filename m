From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jul 2013 15:01:37 +0200
Subject: [Buildroot] [PATCH] gcc: apply PowerPC patch when needed
In-Reply-To: <51D6C2AA.8070703@zacarias.com.ar>
References: <1373013652-4162-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <51D6C2AA.8070703@zacarias.com.ar>
Message-ID: <20130705150137.773e3ad7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 05 Jul 2013 09:57:14 -0300, Gustavo Zacarias wrote:
> On 07/05/2013 05:40 AM, Thomas Petazzoni wrote:
> 
> > When converting gcc to the package infrastructure, a specific thing
> > for PowerPC was forgotten: applying the conditional patch
> > powerpc-link-with-math-lib.patch.conditional. This breaks the build of
> > some PowerPC toolchains, with failures such as:
> > 
> > <http://jenkins.free-electrons.com/job/buildroot/./config=qemu_ppc_virtex_ml507_defconfig/ws/output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/4.7.3/../../../../powerpc-buildroot-linux-uclibc/lib/libgcc_s.so.1>: undefined reference to `copysignl'
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Thanks :)

> > Anyone knows why we have this conditional patch? Can't it be made a
> > normal patch, with the appropriate modifications? Why isn't that
> > upstream since all those years?
> 
> http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00292.html for the
> history/thread.

I remember reading this thread a long time ago. But my question is
more: why hasn't the problem been fixed since 5 years? :-)

> A sample failing config without the patch is
> qemu_ppc_virtex_ml507_defconfig (a powerpc 440 core, soft float).

Indeed, that's the one that was failing in our Jenkins builds, as can be
seen from the URL above.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
