From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 15:29:10 +0200
Subject: [Buildroot] [PATCH] external-toolchain: Allow MIPS64 for
 Codesourcery MIPS toolchains
In-Reply-To: <1368627740-4094-1-git-send-email-markos.chandras@gmail.com>
References: <1368627740-4094-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <20130526152910.2a32ecbb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Wed, 15 May 2013 15:22:20 +0100, Markos Chandras wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
> 
> The n64 ABI which is supported by the Codesourcery MIPS toolchains,
> is only available with MIPS64 so allow these cores to be selected
> and used with these toolchains.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  toolchain/toolchain-external/Config.in |   20 ++++++++++----------
>  1 files changed, 10 insertions(+), 10 deletions(-)

I've just tested this one, and with the following defconfig:

BR2_mips64el=y
BR2_MIPS_NABI64=y
BR2_TOOLCHAIN_EXTERNAL=y

the Busybox compilation fails with:

In file included from libbb/pw_encrypt.c:89:0:
libbb/pw_encrypt_des.c: In function 'pw_encrypt':
libbb/pw_encrypt_des.c:289:27: internal compiler error: in gen_rtx_SUBREG, at emit-rtl.c:769
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://support.codesourcery.com/GNUToolchain/> for instructions.
make[2]: *** [libbb/pw_encrypt.o] Erreur 1

It does not appear with the same toolchain in MIPS32 mode. I agree it's
a toolchain bug, but I'm just wondering in which conditions you tested
your patch and/or if something can be done to avoid the toolchain
breakage.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
