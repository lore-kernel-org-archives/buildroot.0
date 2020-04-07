From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 17:33:16 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/mesa3d: disable v3d support
 for arm if neon is not supported
In-Reply-To: <20200309123432.5943-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 9 Mar 2020 13:34:32 +0100")
References: <20200309123432.5943-1-ps.report@gmx.net>
 <20200309123432.5943-2-ps.report@gmx.net>
Message-ID: <87k12rqpj7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The v3d driver for arm uses neon instructions unconditionally, so
 > depend on BR2_ARM_CPU_HAS_NEON.

 > Fixes:

 >   http://autobuild.buildroot.net/results/66c4df4ee84b73160dde5fe4437b5abdbd2b50d2

 >   [1050/1079] Compiling C object 'src/gallium/drivers/v3d/99241e4@@v3d_neon at sta/v3d_tiling.c.o'.
 >   {standard input}: Assembler messages:
 >   {standard input}:417: Error: selected processor does not support `vldm r6,{q0,q1,q2,q3}' in ARM mode
 >   {standard input}:418: Error: selected processor does not support `vst1.8 d0,[r4],r5' in ARM mode
 >   {standard input}:419: Error: selected processor does not support `vst1.8 d1,[r4],r5' in ARM mode
 >   {standard input}:420: Error: selected processor does not support `vst1.8 d2,[r4],r5' in ARM mode
 >   {standard input}:421: Error: selected processor does not support `vst1.8 d3,[r4],r5' in ARM mode
 >   {standard input}:422: Error: selected processor does not support `vst1.8 d4,[r4],r5' in ARM mode
 >   {standard input}:423: Error: selected processor does not support `vst1.8 d5,[r4],r5' in ARM mode
 >   {standard input}:424: Error: selected processor does not support `vst1.8 d6,[r4],r5' in ARM mode

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
