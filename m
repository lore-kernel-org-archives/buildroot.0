From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 17:32:36 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/mesa3d: fix vc4 neon related
 compile failure
In-Reply-To: <20200309123432.5943-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 9 Mar 2020 13:34:31 +0100")
References: <20200309123432.5943-1-ps.report@gmx.net>
Message-ID: <87o8s3qpkb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add mesa3d patch to add a vc4 option to disable
 > the optional neon support and set it dependent
 > on BR2_ARM_CPU_HAS_NEON.

 > Fixes:

 >   http://autobuild.buildroot.net/results/6387b0a99e1a0922811919623d9a10b0943988df

 >   [1086/1254] Compiling C object 'src/gallium/drivers/vc4/691f666@@vc4_neon at sta/vc4_tiling_lt_neon.c.o'.
 >   {standard input}: Assembler messages:
 >   {standard input}:334: Error: selected processor does not support `vldm r4,{q0,q1,q2,q3}' in ARM mode
 >   {standard input}:335: Error: selected processor does not support `vst1.8 d0,[r3],r2' in ARM mode
 >   {standard input}:336: Error: selected processor does not support `vst1.8 d1,[r3],r2' in ARM mode
 >   {standard input}:337: Error: selected processor does not support `vst1.8 d2,[r3],r2' in ARM mode
 >   {standard input}:338: Error: selected processor does not support `vst1.8 d3,[r3],r2' in ARM mode
 >   {standard input}:339: Error: selected processor does not support `vst1.8 d4,[r3],r2' in ARM mode
 >   {standard input}:340: Error: selected processor does not support `vst1.8 d5,[r3],r2' in ARM mode
 >   {standard input}:341: Error: selected processor does not support `vst1.8 d6,[r3],r2' in ARM mode

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
