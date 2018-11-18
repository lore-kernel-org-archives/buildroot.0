From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Nov 2018 19:32:09 -0200
Subject: [Buildroot] [PATCH v2 1/6] package/compiler-rt: new package
References: <1542426982-54683-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5bf1da59c7a62_7ce42af15420bd205581@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is not a full review. I just spotted some nits while reviewing/testing the
runtime test in the series.
I guess/hope all of them can be fixed while applying. No need to resend just for
these.

On Sat, Nov 17, 2018 at 01:56 AM, Matt Weber wrote:

> This patch adds support for the compiler-rt (CLANG runtime) libary.

s/libary/library

> It builds a set of static libraries and installs them into the
> CLANG/LLVM toolchain resource folder.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Romain Naour <romain.naour@smile.fr>
> ---
[snip]
> +++ b/package/compiler-rt/compiler-rt.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# compiler-rt
> +#
> +################################################################################
> +
> +# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
> +# tied to the version of those tools

OK, but then shouldn't be better to also mention Compiler-RT in the comments
added to LLVM and Clang in patch 6?

> +COMPILER_RT_VERSION = 7.0.0
> +COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
> +COMPILER_RT_SITE = http://llvm.org/releases/$(COMPILER_RT_VERSION)
> +COMPILER_RT_LICENSE = NCSA MIT
> +COMPILER_RT_LICENSE_FILES = LICENSE.TXT
> +COMPILER_RT_DEPENDENCIES = host-clang llvm
> +
> +COMPILER_RT_INSTALL_STAGING = YES
> +COMPILER_RT_INSTALL_TARGET = NO
> +
> +

I was testing your series and I saw the job check-package in GitLab CI failed:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/121907593
package/compiler-rt/compiler-rt.mk:19: consecutive empty lines

> +# -DCMAKE_INSTALL_PREFIX="" allows the COMPILER_RT_INSTALL_STAGING_CMDS to
> +# provide the complete path to compilier-rt for installation of the runtime

s/compilier/compiler


Regards,
Ricardo
