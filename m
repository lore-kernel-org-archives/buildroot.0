From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 19 Aug 2009 14:32:24 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I switch from an external OABI toolchain to an external EABI toolchain
awhile back.  I had to do this in order to build the more recent kernels
since my old toolchain was 4.1.1 and the kernel will not build with
that version.

I haven't had any problems with the toolchain building my kernel but
realized the other day that my rootfs was actually still based on the
older OABI toolchain.  So I deleted all the old directories (build_arm,
toolchain_build_arm, binaries, etc.) and rebuilt everything with the
EABI toolchain.

Now when I try to boot the kernel comes up fine but I get the following
when run_init_process("/sbin/init") trys to execute:

Kernel panic - not syncing: Attempted to kill init!
[<c002ca8c>] (unwind_backtrace+0x0/0xdc) from [<c02943dc>] (panic+0x48/0x120)
[<c02943dc>] (panic+0x48/0x120) from [<c0048430>] (do_exit+0x64/0x608)
[<c0048430>] (do_exit+0x64/0x608) from [<c0048a84>] (do_group_exit+0xb0/0xe4)
[<c0048a84>] (do_group_exit+0xb0/0xe4) from [<c0052cc4>] (get_signal_to_deliver+0x384/0x3dc)
[<c0052cc4>] (get_signal_to_deliver+0x384/0x3dc) from [<c00295f8>] (do_signal+0x50/0x528)
[<c00295f8>] (do_signal+0x50/0x528) from [<c0026eac>] (work_pending+0x1c/0x20)

I haven't been able to figure out what the problem is.  Does anyone have
an idea?  I'm using buildroot version 2009.08-rc2 and kernel 2.6.30.5 if
that's any help.

Thanks,
Hartley
