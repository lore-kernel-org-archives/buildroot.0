From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 17:36:13 +0200
Subject: [Buildroot] [PATCH v8 2/4] package/libclc: new package
In-Reply-To: <1540046091-13736-3-git-send-email-valentinkorenblit@gmail.com>
References: <1540046091-13736-1-git-send-email-valentinkorenblit@gmail.com>
 <1540046091-13736-3-git-send-email-valentinkorenblit@gmail.com>
Message-ID: <20181020173613.246b2cd6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Oct 2018 16:34:49 +0200, Valentin Korenblit wrote:
> This patch provides libclc, an open source implementation of the
> library requirements of the OpenCL C programming language, as
> specified by the OpenCL 1.1 Specification. It is intended to be used
> with Clover (Mesa3D's OpenCL implementation for AMD GPUs.
> 
> It needs to be compiled with host-clang, as it generates LLVM IR bitcode
> files containing device builtin functions for each target.
> 
> Currently, libclc supports AMDGCN, R600 and NVPTX targets.
> 
> As OpenCL kernels can be built dynamically on the target using libclang and
> libLLVM, it is necessary to have clc headers installed on the target. Buildroot
> removes /usr/include in its target-finalize step, so clc headers are installed to
> /usr/share/clc.
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/libclc/Config.in   | 10 ++++++++++
>  package/libclc/libclc.hash |  3 +++
>  package/libclc/libclc.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 57 insertions(+)
>  create mode 100644 package/libclc/Config.in
>  create mode 100644 package/libclc/libclc.hash
>  create mode 100644 package/libclc/libclc.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
