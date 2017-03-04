From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 14:01:01 +0100
Subject: [Buildroot] [PATCH] qemu: disable Qemu user-land emulation for
 uClibc toolchains
In-Reply-To: <CAB0FRsv9jWu7fJe+XU4gb9OTBeywNU=WGsrhrMise+wOBxB=DQ@mail.gmail.com>
References: <1488619059-1499-1-git-send-email-francois.perrad@gadz.org>
 <20170304115409.0e798143@free-electrons.com>
 <CAB0FRsv9jWu7fJe+XU4gb9OTBeywNU=WGsrhrMise+wOBxB=DQ@mail.gmail.com>
Message-ID: <20170304140101.589b00be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Mar 2017 13:48:13 +0100, Fran?ois Perrad wrote:

> When the issue with 'struct sigcontext' is fixed, another one occurs:
> build/qemu-2.8.0/linux-user/syscall.c:6865:23: error: 'struct timex'
> has no member named 'tai'
>      __put_user(host_tx->tai, &target_tx->tai);
>                        ^
> The member 'tai' exists in linux/timex.h but not in sys/timex.h
> with the toolchain from
> http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2017.02-rc1-70-g7612a7d.tar.bz2

Thanks for testing. This one is indeed a uClibc issue, where the
'struct timex' in uClibc-ng is not completely in sync with the one from
the kernel.

I'm sure this is something that Waldemar can fix up :)

Thanks for testing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
