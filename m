From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 May 2021 22:04:05 +0200
Subject: [Buildroot] [PATCHv6 1/5] package/llvm: add BPF backend
In-Reply-To: <20201220151203.2206747-1-romain.naour@gmail.com>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
Message-ID: <a524d545-db15-2beb-84c7-0796ec71bc72@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/12/2020 16:11, Romain Naour wrote:
> From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> 
> bcc is a front-end tool for eBPF :
> https://github.com/iovisor/bcc/blob/master/README.md.
> eBPF is the most powerful Linux tracer, and bcc
> allows to write eBPF scripts in C and PYTHON3.
> 
> BCC requires enabling LLVM backend BPF support.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Tested-by: Qais Yousef <qais.yousef@arm.com>
> Reviewed-by: Qais Yousef <qais.yousef@arm.com>
> Cc: Qais Yousef <qais.yousef@arm.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/llvm/Config.in | 6 ++++++
>  package/llvm/llvm.mk   | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/llvm/Config.in b/package/llvm/Config.in
> index 1d21d879da..6ec2ffcfe6 100644
> --- a/package/llvm/Config.in
> +++ b/package/llvm/Config.in
> @@ -47,6 +47,12 @@ config BR2_PACKAGE_LLVM_RTTI
>  
>  	  https://llvm.org/docs/HowToSetUpLLVMStyleRTTI.html
>  
> +config BR2_PACKAGE_LLVM_BPF
> +	bool "BPF backend"
> +	help
> +	  Build BPF target. Select this option if you are going
> +	  to install bcc on the target.
> +
>  endif
>  
>  comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index 24d033d124..48a298191c 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -61,6 +61,11 @@ ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
>  LLVM_TARGETS_TO_BUILD += AMDGPU
>  endif
>  
> +# Build BPF backend
> +ifeq ($(BR2_PACKAGE_LLVM_BPF),y)
> +LLVM_TARGETS_TO_BUILD += BPF
> +endif
> +
>  # Use native llvm-tblgen from host-llvm (needed for cross-compilation)
>  LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
>  
> 
