From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Aug 2020 21:00:49 +0200
Subject: [Buildroot] [PATCH v2 02/12] package/llvm: add the version
 major variable
In-Reply-To: <20190907094027.9537-3-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
 <20190907094027.9537-3-romain.naour@smile.fr>
Message-ID: <a3450479-f50f-f18b-8782-64b254202481@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/09/2019 11:40, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> ---
>  package/llvm/llvm.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index f14b537d94..e885c63f98 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  # LLVM and Clang should be version bumped together
> -LLVM_VERSION = 8.0.1
> +LLVM_VERSION_MAJOR = 8

 I guess this is a leftover from previous iterations, because LLVM_VERSION_MAJOR
is not used anywhere in this series. So this patch can be dropped IMO.

 Regards,
 Arnout

> +LLVM_VERSION = $(LLVM_VERSION_MAJOR).0.1
>  LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
>  LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
>  LLVM_LICENSE = NCSA
> 
