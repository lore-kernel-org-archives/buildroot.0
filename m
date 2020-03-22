From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 15:45:26 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/mesa3d: fix vc4 neon related
 compile failure
In-Reply-To: <20200309123432.5943-1-ps.report@gmx.net>
References: <20200309123432.5943-1-ps.report@gmx.net>
Message-ID: <20200322154526.604906e5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  9 Mar 2020 13:34:31 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Add mesa3d patch to add a vc4 option to disable
> the optional neon support and set it dependent
> on BR2_ARM_CPU_HAS_NEON.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/6387b0a99e1a0922811919623d9a10b0943988df
> 
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
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...tion-to-disable-optional-neon-suppor.patch | 82 +++++++++++++++++++
>  package/mesa3d/mesa3d.mk                      |  6 ++
>  2 files changed, 88 insertions(+)
>  create mode 100644 package/mesa3d/0007-vc4-add-meson-option-to-disable-optional-neon-suppor.patch

I've applied both patches. I understand that the first patch is under
discussion upstream, it might end up being different, but I merged your
proposal nevertheless for the time being.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
