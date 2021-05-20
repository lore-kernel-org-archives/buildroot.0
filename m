From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 May 2021 10:41:37 +0200
Subject: [Buildroot] [PATCH v3 4/4] lmbench: lat_rpc: fix stray pointer
In-Reply-To: <20210510180049.61421-6-vgupta@synopsys.com> (Vineet Gupta via
 buildroot's message of "Mon, 10 May 2021 11:00:49 -0700")
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-6-vgupta@synopsys.com>
Message-ID: <87y2c9ajb2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vineet" == Vineet Gupta via buildroot <buildroot@busybox.net> writes:

 > | # ./lat_rpc -S localhost
 > | potentially unexpected fatal signal 11.
 > | Path: /lmbench/bin/arc64/lat_rpc
 > | CPU: 0 PID: 62 Comm: lat_rpc Not tainted 5.6.0-00224-g8e1b159f529e #39
 > | Invalid Read @ 0x00000001 by insn @ 0x2011f110
 > |   @off 0x6c110 in [/lib/libc-2.32.so]  VMA: 0x200b3000 to 0x201b8000
 > | ECR: 0x00050100 EFA: 0x00000001 ERET: 0x2011f110
 > | STAT32: 0x80081082 [IE U     ]   BTA: 0x2011b87c
 > |  SP: 0x5fffefe8  FP: 0x00000000 BLK: 0x20103242
 > | r00: 0x00000001 r01: 0x00000002 r02: 0x00000001
 > | r03: 0x20101eb0 r04: 0x00000001 r05: 0x00000001
 > | r06: 0x00000000 r07: 0x00000000 r08: 0x00000001
 > | r09: 0x2019d8b0 r10: 0x20039fc4 r11: 0x5ffff0f0
 > | r12: 0x2019d6d0 r13: 0x2019d748 r14: 0x5ffff588
 > | r15: 0x00000000 r16: 0x00000000 r17: 0x5ffff708
 > | r18: 0x20039fc0 r19: 0xffffffff r20: 0x201ba010
 > | r21: 0x00000000 r22: 0x00000000 r23: 0x20039fc0
 > | r24: 0x00000bd0 r25: 0x00000073
 > Segmentation fault

 > Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
