From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 23 Nov 2016 17:44:46 +0100
Subject: [Buildroot] Bare metal toolchain support?
In-Reply-To: <CAM+bi4sYT51Qc72s1bpsRw8K3mOPRjMtYC171YOms1L_PG0R7g@mail.gmail.com>
References: <CAM+bi4v0iJKAbKV8FvqwJqEw=L+DqTLZhcHWGboYBbPv1oTM0A@mail.gmail.com>
 <20161123113517.04f6ec47@free-electrons.com>
 <CAM+bi4vNKMBr0Dv9_-rsQzU_kPNrze7o9_EcSEA--g2UCVCfzg@mail.gmail.com>
 <20161123130636.5b362a27@free-electrons.com>
 <CAM+bi4ujUpa+BEtU8XAC1sCW2AoM8gUhT-Rtg8xWs-_O8KTF6A@mail.gmail.com>
 <CAM+bi4sYT51Qc72s1bpsRw8K3mOPRjMtYC171YOms1L_PG0R7g@mail.gmail.com>
Message-ID: <CAM+bi4sa9FG+eac3WdciC+rGih7mKk14syiT_O0mwXeyQh_5qA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!


2016-11-23 15:49 GMT+01:00 Alvaro Gamez <alvaro.gamez@hazent.com>:

> Under Xilinx':
> 00000000  0000001e R_MICROBLAZE_32_NONE              c
>
> Under buildroots':
> 00000000  0000001e unrecognized: 1e                 c
>

I've made some progress on this. There was something wrong on my setup
that made it use some toolchain apps from Xilinx but some others from
buildroot,
so it's even a miracle it reached that far. Once solved lots of environment
variables
and the like, there remains just this one error on compilation:

/home/sslayer/Proyectos/ART/ESA/DRVM-software.git/DRVM/output/host/usr/bin/microblazeel-linux-gcc
-Wl,-T -Wl,lscript.ld -L../bsp/lib -mlittle-endian -mxl-barrel-shift
-mxl-pattern-compare -mno-xl-soft-div -mcpu=v9.6 -mno-xl-soft-mul
-mxl-multiply-high -Wl,--no-relax -o "bootloader.elf" bootloader.o
platform.o srec.o  -Wl,--start-group,-lxil,-lgcc,-lc,--end-group
-Wl,--start-group,-lxilisf,-lxil,-lgcc,-lc,--end-group
/home/sslayer/Proyectos/ART/ESA/DRVM-software.git/DRVM/output/host/usr/microblazeel-buildroot-linux-gnu/sysroot/usr/lib/libc_nonshared.a(elf-init.oS):
In function `__libc_csu_init':
(.text+0x44): undefined reference to `__init_array_start'
/home/sslayer/Proyectos/ART/ESA/DRVM-software.git/DRVM/output/host/usr/microblazeel-buildroot-linux-gnu/sysroot/usr/lib/libc_nonshared.a(elf-init.oS):
In function `__libc_csu_init':
(.text+0x4c): undefined reference to `__init_array_end'
collect2: error: ld returned 1 exit status
Makefile:32: recipe for target 'bootloader.elf' failed
make: *** [bootloader.elf] Error 1


So... back to square oneI guess. I don't know what to do with this now.


Best regards


-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161123/dacc87e8/attachment.html>
