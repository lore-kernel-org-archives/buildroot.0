From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:11:30 +0200
Subject: [Buildroot] [PATCH] mesa3d: use -mno-compact-eh for Code
 Sourcery MIPS
In-Reply-To: <1464689755-63804-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464689755-63804-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160531211130.58bd58dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 May 2016 11:15:55 +0100, Vicente Olivert Riera wrote:
> mesa3d doesn't like the new compressed exception handling of the Code
> Sourcery MIPS toolchain and it fails to compile with an error like this
> one:
> 
> /br/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.3.0/../../../../mips-linux-gnu/bin/ld:
> ../../../../src/mesa/.libs/libmesagallium.a(ir_to_mesa.o):
> .eh_frame_entry not in order
> /br/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.3.0/../../../../mips-linux-gnu/bin/ld:
> final link failed: Nonrepresentable section on output
> collect2: error: ld returned 1 exit status
> 
> Using -mno-compact-eh fixes the problem.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/3cd/3cd81c57c51c0963ee6f4d9b814989460bb35316/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/mesa3d/mesa3d.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master after tweaking the comment in the code, as we
discussed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
