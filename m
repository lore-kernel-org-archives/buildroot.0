From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 May 2013 23:22:57 +0200
Subject: [Buildroot] [PATCH v4 09/12] toolchain/gcc: Only enable
	--with-float when it makes sense
In-Reply-To: <1367524293-32081-10-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Thu, 2 May 2013 21:51:30 +0200")
References: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
 <1367524293-32081-10-git-send-email-mjonker@synopsys.com>
Message-ID: <87y5buphhq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

 Mischa> According to gcc/config.gcc, only ARM, MIPS and SPARC have the
 Mischa> "--with-float" option when configuring gcc.

 Mischa> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
 Mischa> ---
 Mischa>  toolchain/gcc/gcc-uclibc-4.x.mk |    3 +++
 Mischa>  1 files changed, 3 insertions(+), 0 deletions(-)

 Mischa> diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
 Mischa> index 2993697..7b77fb0 100644
 Mischa> --- a/toolchain/gcc/gcc-uclibc-4.x.mk
 Mischa> +++ b/toolchain/gcc/gcc-uclibc-4.x.mk
 Mischa> @@ -65,7 +65,10 @@ endif
 
 Mischa>  # Determine soft-float options
 Mischa>  ifeq ($(BR2_SOFT_FLOAT),y)
 Mischa> +# only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
 Mischa> +ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_sparc)$(BR2_mips64)$(BR2_mips64el),y)

sparc should come after all the mips* options. Committed with that
fixed, thanks.

-- 
Bye, Peter Korsgaard
