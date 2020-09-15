From: rob.r374 at gmail.com <rob.r374@gmail.com>
Date: Tue, 15 Sep 2020 12:18:48 +0200
Subject: [Buildroot] Weird ping behaviour
Message-ID: <008a01d68b49$9ab9a720$d02cf560$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

I'm following this buildroot build and get quite strange behaviour on
ethernet network.

Ping response times vary quite a lot and then ping crashes at the end.

 

Is there any setting, compile option that would help in this case ?

 

Thanks,

Regards,

Rob.

 

Log :

 .

64 bytes from 192.168.0.2: seq=1282 ttl=64 time=152.114 ms

64 bytes from 192.168.0.2: seq=1283 ttl=64 time=1001.781 ms

64 bytes from 192.168.0.2: seq=1284 ttl=64 time=1.992 ms

64 bytes from 192.168.0.2: seq=1285 ttl=64 time=850.570 ms

[ 2345.039206][    C0] ------------[ cut here ]------------

[ 2345.044434][    C0] WARNING: CPU: 0 PID: 0 at net/sched/sch_generic.c:448
dev_watchdog+0x7f/0xe8

[ 2345.053163][    C0] NETDEV WATCHDOG: eth0 (stm32-dwmac): transmit queue 0
timed out

[ 2345.060813][    C0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.4.10 #2

[ 2345.067216][    C0] Hardware name: STM32 (Device Tree Support)

[ 2345.073110][    C0] [<c000c325>] (unwind_backtrace) from [<c000b33f>]
(show_stack+0xb/0xc)

[ 2345.081330][    C0] [<c000b33f>] (show_stack) from [<c000f053>]
(__warn+0x6f/0x80)

[ 2345.088872][    C0] [<c000f053>] (__warn) from [<c000f095>]
(warn_slowpath_fmt+0x31/0x60)

[ 2345.097035][    C0] [<c000f095>] (warn_slowpath_fmt) from [<c01ade8f>]
(dev_watchdog+0x7f/0xe8)

[ 2345.105722][    C0] [<c01ade8f>] (dev_watchdog) from [<c003992b>]
(call_timer_fn.constprop.6+0xf/0x58)

[ 2345.115003][    C0] [<c003992b>] (call_timer_fn.constprop.6) from
[<c0039d47>] (__run_timers+0x197/0x1b0)

[ 2345.124547][    C0] [<c0039d47>] (__run_timers) from [<c0039d6b>]
(run_timer_softirq+0xb/0x18)

[ 2345.133139][    C0] [<c0039d6b>] (run_timer_softirq) from [<c0009a01>]
(__do_softirq+0x111/0x170)

[ 2345.141998][    C0] [<c0009a01>] (__do_softirq) from [<c0010d03>]
(irq_exit+0x33/0x70)

[ 2345.149901][    C0] [<c0010d03>] (irq_exit) from [<c002cf05>]
(__handle_domain_irq+0x47/0x6a)

[ 2345.158406][    C0] [<c002cf05>] (__handle_domain_irq) from [<c000bb93>]
(__irq_entry+0x53/0x84)

[ 2345.167134][    C0] ---[ end trace 223f53e900000001 ]---

[ 2345.172635][    T7] stm32-dwmac 40028000.ethernet eth0: Reset adapter.

 



-- 
Ta e-po?ta je bila pregledana z Avast protivirusnim programom.
https://www.avast.com/antivirus
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200915/a9fc3e67/attachment.html>
