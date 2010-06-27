From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Jun 2010 23:06:56 +0200
Subject: [Buildroot] [PATCH 3/5] toolchain: move makefile includes
In-Reply-To: <1277504132-11184-4-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Sat, 26 Jun 2010 00:15:30 +0200")
References: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1277504132-11184-4-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87wrtk2nin.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Including a bunch of Makefiles with wildcard makes it impossible
 Yann> to add new toolchain backends. Avoid that by namely including
 Yann> needed files.

 Yann> --- /dev/null
 Yann> +++ b/toolchain/toolchain-buildroot.mk
 Yann> @@ -0,0 +1,14 @@
 Yann> +# Include files required for the internal toolchain backend
 Yann> +
 Yann> +# avoid pulling in external toolchain which is broken for toplvl parallel builds
 Yann> +# Explicit ordering:
 Yann> +include toolchain/dependencies/dependencies.mk
 Yann> +include toolchain/binutils/binutils.mk
 Yann> +include toolchain/ccache/ccache.mk
 Yann> +include toolchain/elf2flt/elf2flt.mk
 Yann> +include toolchain/gcc/gcc-uclibc-4.x.mk
 Yann> +include toolchain/gdb/gdb.mk
 Yann> +include toolchain/kernel-headers/kernel-headers.mk
 Yann> +include toolchain/mklibs/mklibs.mk
 Yann> +include toolchain/sstrip/sstrip.mk
 Yann> +include toolchain/uClibc/uclibc.mk
 Yann> diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
 Yann> new file mode 100644
 Yann> index 0000000..6c00330
 Yann> --- /dev/null
 Yann> +++ b/toolchain/toolchain-external.mk
 Yann> @@ -0,0 +1,16 @@
 Yann> +# Required includes for the external toolchain backend
 Yann> +
 Yann> +# Explicit ordering:
 Yann> +include toolchain/helpers.mk
 Yann> +include toolchain/binutils/binutils.mk
 Yann> +include toolchain/ccache/ccache.mk
 Yann> +include toolchain/dependencies/dependencies.mk
 Yann> +include toolchain/elf2flt/elf2flt.mk
 Yann> +include toolchain/gcc/gcc-uclibc-3.x.mk
 Yann> +include toolchain/gcc/gcc-uclibc-4.x.mk
 Yann> +include toolchain/gdb/gdb.mk
 Yann> +include toolchain/toolchain-external/ext-tool.mk
 Yann> +include toolchain/mklibs/mklibs.mk
 Yann> +include toolchain/sstrip/sstrip.mk
 Yann> +include toolchain/toolchain-external/ext-tool.mk
 Yann> +include toolchain/uClibc/uclibc.mk

Why are the order of those includes not the same?
gcc-uclibc-3.x.mk is gone.
2x toolchain-external/ext-tool.mk?
Why do we need to include all these when using an external toolchain?
Most of them doesn't seem to make sense to me.

-- 
Bye, Peter Korsgaard
