From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 9 Dec 2008 11:23:32 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
In-Reply-To: <20081209100915.896263C6D4@busybox.net>
References: <20081209100915.896263C6D4@busybox.net>
Message-ID: <20081209102332.GB12660@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 09, 2008 at 02:09:15AM -0800, egtvedt at uclibc.org wrote:
>Author: egtvedt
>Date: 2008-12-09 02:09:15 -0800 (Tue, 09 Dec 2008)
>New Revision: 24343
>
>Log:
>binutils: fix typo for detecting if BINUTILS_NO_MPFR is not set
>
>Make the ifndef check the actual variable, typo bug.

What are you trying to do or "fix"?
>
>
>
>Modified:
>   trunk/buildroot/toolchain/binutils/binutils.mk
>
>
>Changeset:
>Modified: trunk/buildroot/toolchain/binutils/binutils.mk
>===================================================================
>--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-09 10:04:47 UTC (rev 24342)
>+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-09 10:09:15 UTC (rev 24343)
>@@ -54,7 +54,7 @@
> BINUTILS_NO_MPFR:=y
> endif
> 
>-ifndef BINUTILS_NO_MPFR
>+ifndef $(BINUTILS_NO_MPFR)
> BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp$(HOST_SHREXT) \
> 	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr$(HOST_SHREXT)
> 
