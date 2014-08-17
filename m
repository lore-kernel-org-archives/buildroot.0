From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 17 Aug 2014 14:55:06 +0200
Subject: [Buildroot] [PATCH 01/24 v4] arch: add an option to specify if
	the	arch has atomic ops
In-Reply-To: <7d72fe60f396407b4fbc68ba8f9910cda0fe24a8.1408279142.git.yann.morin.1998@free.fr>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
 <7d72fe60f396407b4fbc68ba8f9910cda0fe24a8.1408279142.git.yann.morin.1998@free.fr>
Message-ID: <bd3543da-f3d3-4236-be5a-d6c85e8305ce@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>The fact that atomic operations are available is not really a
>specificity of the toolchain, but rather of the architecture.
>
>So, add a new option that architectures that have atomic operations
>can select. This in turn selects the current toolchain atomic option,
>until all packages have been converted, at which point the old
>toolchain option can be removed.
>
>Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
>Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>---
> arch/Config.in                | 6 ++++++
> arch/Config.in.arc            | 2 +-
> toolchain/toolchain-common.in | 1 -
> 3 files changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/arch/Config.in b/arch/Config.in
>index 9cd85a5..5cee0d7 100644
>--- a/arch/Config.in
>+++ b/arch/Config.in
>@@ -250,6 +250,12 @@ config BR2_GCC_TARGET_FLOAT_ABI
> config BR2_GCC_TARGET_MODE
> 	string
> 
>+# If the architecture has atomic operations, select this:
>+config BR2_ARCH_HAS_ATOMICS
>+	bool
>+	default y if !BR2_arc
>+	select BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
>+

Is there a specific reason why the option is now
 dubbed ATOMICS iso ATOMIC_INTRINSICS?

The latter may be a bit more descriptive, no?

Best regards,
Thomas
