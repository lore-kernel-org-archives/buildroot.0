From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 05 Jul 2013 09:57:14 -0300
Subject: [Buildroot] [PATCH] gcc: apply PowerPC patch when needed
In-Reply-To: <1373013652-4162-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373013652-4162-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <51D6C2AA.8070703@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/05/2013 05:40 AM, Thomas Petazzoni wrote:

> When converting gcc to the package infrastructure, a specific thing
> for PowerPC was forgotten: applying the conditional patch
> powerpc-link-with-math-lib.patch.conditional. This breaks the build of
> some PowerPC toolchains, with failures such as:
> 
> <http://jenkins.free-electrons.com/job/buildroot/./config=qemu_ppc_virtex_ml507_defconfig/ws/output/host/usr/lib/gcc/powerpc-buildroot-linux-uclibc/4.7.3/../../../../powerpc-buildroot-linux-uclibc/lib/libgcc_s.so.1>: undefined reference to `copysignl'
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

> Anyone knows why we have this conditional patch? Can't it be made a
> normal patch, with the appropriate modifications? Why isn't that
> upstream since all those years?

http://gcc.gnu.org/ml/gcc-patches/2008-10/msg00292.html for the
history/thread.
A sample failing config without the patch is
qemu_ppc_virtex_ml507_defconfig (a powerpc 440 core, soft float).
Regards.
