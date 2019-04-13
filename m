From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 13 Apr 2019 16:36:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/llvm: fix build with gcc < 5.1
In-Reply-To: <20190413084555.2367-1-valentinkorenblit@gmail.com>
References: <20190413084555.2367-1-valentinkorenblit@gmail.com>
Message-ID: <7955ee96-ad39-0554-f6cf-6c50ea8130ad@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentin,

Le 13/04/2019 ? 10:45, Valentin Korenblit a ?crit?:
> Fixes:
> 
> http://autobuild.buildroot.net/results/0c046a1b57a4f0b992333003d41062e1b256eb0d
> 
> Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
> ---
>  package/llvm/llvm.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index cd374d74b4..28c5e89706 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -17,6 +17,9 @@ LLVM_INSTALL_STAGING = YES
>  HOST_LLVM_DEPENDENCIES = host-python
>  LLVM_DEPENDENCIES = host-llvm
>  

Maybe a comment about these options is welcome :)

# LLVM >= 9.0 will soon require C++14 support, building llvm 8.x using a
toolchain using gcc < 5.1 is deprecated but still build with gcc >= 4.8.
# https://reviews.llvm.org/D57264
> +HOST_LLVM_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
> +LLVM_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON

Best regards,
Romain

> +
>  # Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
>  # This flag assumes that projects are checked out side-by-side and not nested
>  HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
> 
