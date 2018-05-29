From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 May 2018 07:09:17 +0000
Subject: [Buildroot] [Bug 11031] ld-elf2flt: host/bin/ld.real': execvp: No
 such file or directory
In-Reply-To: <bug-11031-163@https.bugs.busybox.net/>
References: <bug-11031-163@https.bugs.busybox.net/>
Message-ID: <bug-11031-163-VNAV3pa2qj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11031

--- Comment #4 from Christophe Priouzeau <christophe.priouzeau@st.com> ---
Hi Yann,
  I have made the test with the hardware and your patch.

  compilation with your patch: OK
  Test on board: KO

  I have made several verification:
    runtime execution with stm32f469 configuration:
      version of buildroot     - status
      2017.11                     OK
      2018.02                     KO
      2018.05-rc2                 KO

Error seen at runtime:
[    1.460000] Unhandled exception: IPSR = 00000006 LR = fffffff1
[    1.460000] CPU: 0 PID: 1 Comm: init Tainted: G        W       4.11.0 #2
[    1.460000] Hardware name: STM32 (Device Tree Support)
[    1.460000] task: 00822000 task.stack: 00828000
[    1.460000] PC is at ret_fast_syscall+0x2/0x4a
[    1.460000] LR is at tty_ioctl+0x327/0x7e4
[    1.460000] pc : [<08009942>]    lr : [<080c1013>]    psr: 4000000b
[    1.460000] sp : 00829fa8  ip : 0000001c  fp : 00a95600
[    1.460000] r10: 00000000  r9 : 00828000  r8 : 08009ae0
[    1.460000] r7 : 00000036  r6 : 00adcee0  r5 : 00000000  r4 : 00adcf3c
[    1.460000] r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
[    1.460000] xPSR: 4000000b
[    1.460000] CPU: 0 PID: 1 Comm: init Tainted: G        W       4.11.0 #2
[    1.460000] Hardware name: STM32 (Device Tree Support)
[    1.460000] [<0800bdc5>] (unwind_backtrace) from [<0800b153>]
(show_stack+0xb/0xc)
[    1.460000] [<0800b153>] (show_stack) from [<0800b717>]
(__invalid_entry+0x4b/0x4c)

I will create a new bugzilla for the runtime issue.

regards
Christophe Priouzeau

-- 
You are receiving this mail because:
You are on the CC list for the bug.
