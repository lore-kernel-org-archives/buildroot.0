From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 22:12:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/lsof: fix static build
In-Reply-To: <20191117132636.9709-1-fontaine.fabrice@gmail.com>
References: <20191117132636.9709-1-fontaine.fabrice@gmail.com>
Message-ID: <20191118221235.339ecfde@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Nov 2019 14:26:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> TARGET_LDFLAGS which contains -static is not passed so build fails on:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o lsof dfile.o dmnt.o dnode.o dproc.o dsock.o dstore.o arg.o main.o misc.o node.o print.o proc.o store.o usage.o util.o -L./lib -llsof  -ltirpc
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_registered_FDE':
> /home/buildroot/autobuild/instance-1/output-1/build/host-gcc-final-8.3.0/build/xtensa-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde.c:1040: undefined reference to `dl_iterate_phdr'
> collect2: error: ld returned 1 exit status
> 
> Pass TARGET_LDFLAGS thanks to LSOF_CFGL
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0c228e0d3ea1ff2d728ddc906e242d40ed973222
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lsof/lsof.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
