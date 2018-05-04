From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 May 2018 17:05:37 +0200
Subject: [Buildroot] [PATCH] package/clang: link libclang against
 libLLVM.so
In-Reply-To: <20180504122743.13589-1-valentin.korenblit@smile.fr>
References: <20180504122743.13589-1-valentin.korenblit@smile.fr>
Message-ID: <20180504170537.0a7a9c09@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 May 2018 14:27:43 +0200, Valentin Korenblit wrote:
> libclang.so is statically linking against all LLVM static libraries
> instead of linking dynamically against libLLVM.so.
> 
> This patch fixes this problem partially: libclang links against libLLVM.so
> but the following LLVM libraries are still being linked statically:
> 
> libLLVMOption.a
> libLLVMMCParser.a
> libLLVMProfileData.a
> libLLVMBitReader.a
> libLLVMBinaryFormat.a
> libLLVMCore.a
> libLLVMMC.a
> libLLVMSupport.a
> libLLVMDemangle.a
> 
> This problem comes out when clang is not built as a subproject of
> LLVM (llvm/tools/clang).

Is this a problem you have discussed with upstream ? Has the patch
you did on the clang CMakeLists.txt any chance from being accepted
upstream ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
