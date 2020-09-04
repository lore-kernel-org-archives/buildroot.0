From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 4 Sep 2020 16:22:43 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/iproute2: bump version to
 5.8.0
In-Reply-To: <20200904091309.00ef486b@windsurf.home>
References: <20200903155728.19448-1-petr.vorel@gmail.com>
 <20200903155728.19448-2-petr.vorel@gmail.com>
 <20200904091309.00ef486b@windsurf.home>
Message-ID: <20200904142243.GA19924@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> On Thu,  3 Sep 2020 17:57:28 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > For uclibc it requires v1.0.35, which contains 8bc41f131 ("Add {name,
> > open}_to_handle_at() implementation").

> Since it requires uClibc 1.0.35, we need to hold a little bit on this
> one, until we rebuild all toolchains.
+1

> > I tested this and it looks like the patch didn't apply, when tested with ./utils/test-pkg:

> The patch didn't apply ? This doesn't make much sense. Perhaps you
> wanted to say "doesn't build" ?
Yes, sorry for confusing. Patch is ok, I just didn't realize that failures were
due pre-built uClibc toolchains.

> >                              andes-nds32 [ 1/45]: OK
> >                              arm-aarch64 [ 2/45]: OK
> >                     bootlin-x86-64-glibc [ 3/45]: OK
> >                         br-aarch64-glibc [ 4/45]: OK
> >                            br-arcle-hs38 [ 5/45]: FAILED
> >                             br-arm-basic [ 6/45]: FAILED
> >                   br-arm-cortex-a9-glibc [ 7/45]: OK
> >                    br-arm-cortex-a9-musl [ 8/45]: OK
> >                    br-arm-cortex-m4-full [ 9/45]: SKIPPED
> >                              br-arm-full [10/45]: FAILED
> >                     br-arm-full-nothread [11/45]: FAILED
> >                       br-arm-full-static [12/45]: FAILED
> >                 br-i386-pentium-mmx-musl [13/45]: OK
> >                    br-i386-pentium4-full [14/45]: FAILED
> >                     br-microblazeel-full [15/45]: OK
> >                       br-mipsel-o32-full [16/45]: FAILED
> >                  br-mips32r6-el-hf-glibc [17/45]: OK
> >                       br-mips64-n64-full [18/45]: FAILED
> >                  br-mips64r6-el-hf-glibc [19/45]: OK
> >                        br-m68k-5208-full [20/45]: SKIPPED
> >                       br-m68k-68040-full [21/45]: FAILED
> >                           br-nios2-glibc [22/45]: OK
> >                       br-openrisc-uclibc [23/45]: OK
> >                   br-powerpc-e500mc-full [24/45]: FAILED
> >                br-powerpc-603e-basic-cpp [25/45]: FAILED
> >              br-powerpc64le-power8-glibc [26/45]: OK
> >                br-powerpc64-power7-glibc [27/45]: OK
> >                               br-riscv32 [28/45]: OK
> >                               br-riscv64 [29/45]: OK
> >                          br-riscv64-musl [30/45]: OK
> >                              br-sh4-full [31/45]: FAILED
> >                          br-sparc-uclibc [32/45]: FAILED
> >                         br-sparc64-glibc [33/45]: OK
> >                           br-xtensa-full [34/45]: FAILED
> >                     br-x86-64-core2-full [35/45]: FAILED
> >                           br-x86-64-musl [36/45]: OK
> >                        linaro-aarch64-be [37/45]: OK
> >                           linaro-aarch64 [38/45]: OK
> >                               linaro-arm [39/45]: OK
> >                      sourcery-arm-armv4t [40/45]: OK
> >                             sourcery-arm [41/45]: OK
> >                      sourcery-arm-thumb2 [42/45]: OK
> >                            sourcery-mips [43/45]: OK
> >                          sourcery-mips64 [44/45]: OK
> >                           sourcery-nios2 [45/45]: OK

> All the build failures here are with pre-built uClibc toolchains...
> which are therefore using an older uClibc version than 1.0.35, which
> explains the failure.
+1.

> Thomas

Kind regards,
Petr
