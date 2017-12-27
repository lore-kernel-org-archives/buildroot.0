From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 26 Dec 2017 19:02:30 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-12-25
In-Reply-To: <20171226070035.2CF762072B@mail.free-electrons.com>
References: <20171226070035.2CF762072B@mail.free-electrons.com>
Message-ID: <CANQCQpZtU10yqmgxmEHOtwLmRK_7bEfw7nosbD0V_Ffgujf7Tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mario/All,

On Tue, Dec 26, 2017 at 1:00 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Build statistics for 2017-12-25
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>       master | 216 |  74 |   2 | 292 |
>    2017.08.x |  19 |   2 |   1 |  22 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>          host-cryptsetup-2.0.0 | 43
>              libostree-2017.15 | 8
>                     brltty-5.5 | 7

Looked like a couple different failures for brltty, so I ran it
through utils/test-pkg.

Config:
BR2_USE_WCHAR=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_PACKAGE_BRLTTY=y

Builds which failed:
                   br-arm-cortex-a9-musl [ 7/47]: FAILED
                   br-bfin-full [12/47]: FAILED
                   br-sh4-full [28/47]: FAILED
ports_glibc.o: In function `enablePorts':
ports_glibc.c:(.text+0x1c): undefined reference to `ioperm'
ports_glibc.o: In function `disablePorts':
ports_glibc.c:(.text+0x74): undefined reference to `ioperm'
ports_glibc.o: In function `readPort1':
ports_glibc.c:(.text+0xc0): undefined reference to `inb'
ports_glibc.o: In function `writePort1':
ports_glibc.c:(.text+0xd8): undefined reference to `outb'


                   br-arm-cortex-m4-full [ 8/47]: FAILED
                   br-m68k-5208-full [15/47]: FAILED
checking for msgmerge... /usr/bin/msgmerge
checking for msgfmt... /usr/bin/msgfmt
checking for linuxdoc... false
checking for doxygen... false
configure: error: dynamic linkage not supported for uclinux-uclibcgnueabi


                      br-arm-full-static [11/47]: FAILED
/nvme/rc-buildroot-hardening/brltty/br-arm-full-static/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os):
In function `__uClibc_fini':
__uClibc_main.c:(.text+0x164): undefined reference to `__fini_array_end'
__uClibc_main.c:(.text+0x168): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0x16c): undefined reference to `__fini_array_start'


                     br-mips64-n64-full [19/47]: FAILED
                     br-mips64r6-el-hf-glibc [20/47]: FAILED
                     mips64el-ctng_n64-linux-gnu [38/47]: FAILED
                     sourcery-mips64 [43/47]: FAILED
/nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld
-r -o  braille.o eu_braille.o eu_clio.o eu_esysiris.o
/nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
eu_braille.o: ABI is incompatible with that of the selected emulation
/nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
failed to merge target specific data of file eu_braille.o
/nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
eu_clio.o: ABI is incompatible with that of the selected emulation
/nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
failed to merge target specific data of file eu_clio.o
/nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
eu_esysiris.o: ABI is incompatible with that of the selected emulation
/nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
failed to merge target specific data of file eu_esysiris.o
/nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
Attempt to do relocatable link with elf64-tradlittlemips input and
elf32-ntradlittlemips output
/nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
eu_braille.o: file class ELFCLASS64 incompatible with ELFCLASS32
/nvme/rc-buildroot-hardening/brltty/br-mips64-n64-full/host/bin/mips64el-linux-ld:
final link failed: File in wrong format
