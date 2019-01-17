From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Thu, 17 Jan 2019 21:53:36 +0100
Subject: [Buildroot] [PATCH] package/llvm: set the path to llvm-config
In-Reply-To: <20190116213921.2280-1-romain.naour@smile.fr>
References: <20190116213921.2280-1-romain.naour@smile.fr>
Message-ID: <c025da98-8005-7eeb-bff1-9bc60b36803a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

> While building llvm for the target (x86_64), the build failded due to
> path poisoning (-I/usr/include/libxml2) while building NATIVE tools
> (i.e for the host). The llvm package try to build a tool for the host
> with the cross-compiler which doesn't work when the paranoid toolchain
> wrapper (BR2_COMPILER_PARANOID_UNSAFE_PATH) is enabled.
>
> We know that llvm (target) needs llvm-tablegen and llvm-config build by
> host-llvm, but only LLVM_TABLEGEN is provided by llvm.mk. Adding
> LLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config for llvm (target)
> fixes the path poisoining issue since llvm doesn't build the NATIVE
> variant.
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Valentin, I'm not sure why we don't set LLVM_CONFIG_PATH in llvm.mk for
> the target variant? We provide it for clang and libclc, why not for
> llvm ?

It was not set because the only necessary tool to build target llvm
was llvm-tblgen.

Valentin

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190117/59eab66c/attachment.html>
