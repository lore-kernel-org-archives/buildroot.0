From: Christian Stewart <christian@paral.in>
Date: Wed, 9 Sep 2020 23:35:08 -0700
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <20200909195549.6aa402bd@gmx.net>
References: <cc86bfd55f944197bcd610626edecf2f@go-sys.de>
 <52-5f356200-5-2c492440@36238474>
 <4d943f9a8e974a60a5167db44bce6cd1@go-sys.de>
 <CA+h8R2oi0GRLYdumQOYxwON=xd7p_8pn+WoknjRd5N24Vr_5KQ@mail.gmail.com>
 <20200816220620.65159d1d@windsurf.home>
 <CA+h8R2qO01wwrEJdTx2puEbDv6mv31YxyAjG5nCn6hosPAW_aQ@mail.gmail.com>
 <CA+h8R2pjvm7Wr_hkS2wtqhzqESmgqTtxivkdTLdEr07ngJLTbQ@mail.gmail.com>
 <20200906193958.2b4199a4@gmx.net>
 <CA+h8R2pdJExc9v7AeGAfvon1sVY-G2iYk7EzjdZFBLBRd9ApVQ@mail.gmail.com>
 <20200909195549.6aa402bd@gmx.net>
Message-ID: <CA+h8R2qrRd-Wxh8aVdHe_p=yzvEemZrktTTB3dr88rDrm88r-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,


On Wed, Sep 9, 2020 at 10:55 AM Peter Seiderer <ps.report@gmx.net> wrote:
> > Thanks for checking on this. Is there any known fix anywhere yet? I'll
> > do some searching.

> Could you do the same for your failing 'Odroid HC2 with kernel 5.8
> + kernel-headers 5.8' case (and send my your defconfig)?

I'm not sure what changed to fix the problem (unfortunately) but with
kernel 5.8.6, headers 5.8.6, OpenSSH 8.3p1, OpenSSL 1.1.1g, glibc
2.30-73, binutils 2.32 (perhaps the binutils change did it) - it
works.

This is against an odroid hc2, armv7l.

Working case, as requested:

./host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/asm-generic/unistd.h:#define
__NR_clock_nanosleep_time64 407
./host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/asm-generic/unistd.h:__SYSCALL(__NR_clock_nanosleep_time64,
sys_clock_nanosleep)
./host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/syscall.h:#ifdef
__NR_clock_nanosleep_time64
./host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/syscall.h:#
define SYS_clock_nanosleep_time64 __NR_clock_nanosleep_time64
./host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/asm/unistd-common.h:#define
__NR_clock_nanosleep_time64 (__NR_SYSCALL_BASE + 407)


Best,
Christian
