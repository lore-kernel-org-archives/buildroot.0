From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 22:26:57 +0200
Subject: [Buildroot] [PATCH 03/14] handle MMU configuration
In-Reply-To: <b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	(Bernhard Reutner-Fischer's message of "Wed\,
	7 Oct 2009 22\:08\:26 +0200")
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
	<cover.1254945750.git.rep.dot.nop@gmail.com>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <87r5tfj6ge.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard>   some arches do not have an MMU at all, some do but it may be
 Bernhard>   desirable not to use it.

How's our nommu support? Does anything besides busybox support nommu?

 Bernhard> +++ b/toolchain/gcc/Makefile.in
 Bernhard> @@ -49,6 +49,11 @@ SOFT_FLOAT_CONFIG_OPTION:=
 Bernhard>  TARGET_SOFT_FLOAT:=
 Bernhard>  ARCH_FPU_SUFFIX:=
 Bernhard>  endif
 Bernhard> +ifeq ($(BR2_USE_MMU),y)
 Bernhard> +ARCH_MMU_SUFFIX:=
 Bernhard> +else
 Bernhard> +ARCH_MMU_SUFFIX:=_nommu
 Bernhard> +endif

Weren't we getting rid of those suffixes?

-- 
Bye, Peter Korsgaard
