From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 16 Mar 2020 23:10:50 +0100
Subject: [Buildroot] [PATCH 2/2] package/llvm: remove outdated variables
 disabling bindings
In-Reply-To: <20200316200106.3709163-2-joseph.kogut@gmail.com>
References: <20200316200106.3709163-1-joseph.kogut@gmail.com>
 <20200316200106.3709163-2-joseph.kogut@gmail.com>
Message-ID: <6e064969-62e5-d02e-7c43-ae2eb0ab3c00@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,

Le 16/03/2020 ? 21:01, Joseph Kogut a ?crit?:
> LLVM no longer disables unsupported bindings by overriding OCAMLFIND and
> GO_EXECUTABLE, so remove them.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/llvm/llvm.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index f1034f0365..24d033d124 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -189,11 +189,8 @@ LLVM_CONF_OPTS += -DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME)
>  # This solves "No available targets are compatible for this triple" with llvmpipe
>  LLVM_CONF_OPTS += -DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME)
>  
> -# The Go bindings have no CMake rules at the moment, but better remove the
> -# check preventively. Building the Go and OCaml bindings is yet unsupported.
> +# Building the Go and OCaml bindings is yet unsupported.
>  HOST_LLVM_CONF_OPTS += \
> -	-DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
> -	-DOCAMLFIND=OCAMLFIND-NOTFOUND \
>  	-DLLVM_ENABLE_BINDINGS=OFF

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

>  
>  # Builds a release host tablegen that gets used during the LLVM build.
> 
