From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 16 Feb 2014 21:08:54 +0100
Subject: [Buildroot] [PATCH 04/10] toolchain/external: add choice to
	select 'AT_LEAST_XXX' header version
In-Reply-To: <74d76e7816e2de0eccb9a24acd0b768c22078dfa.1392571021.git.yann.morin.1998@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <74d76e7816e2de0eccb9a24acd0b768c22078dfa.1392571021.git.yann.morin.1998@free.fr>
Message-ID: <8fdcf8b3-c275-4250-be9c-11bcf4feaa11@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
>Select the appropriate BR2_TOOLCHAIN_HEADERS_AT_LEAST_XXX options for the
>external, custom toolchain backend.
>
>We try to be conservative here, and default to kernel headers 2.6.x.
>
>Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>Cc: Arnout Vandecappelle <arnout@mind.be>
>Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>---
> toolchain/toolchain-external/Config-headers.in | 65 ++++++++++++++++++++++++++
> toolchain/toolchain-external/Config.in         |  2 +
> 2 files changed, 67 insertions(+)
> create mode 100644 toolchain/toolchain-external/Config-headers.in
>
>diff --git a/toolchain/toolchain-external/Config-headers.in b/toolchain/toolchain-external/Config-headers.in
>new file mode 100644
>index 0000000..60ac384
>--- /dev/null
>+++ b/toolchain/toolchain-external/Config-headers.in
>@@ -0,0 +1,65 @@
>+choice
>+	bool "External toolchain kernel headers"
>+	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>+	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
>+

Shouldn't there be a help text explaining what this is used for, so as to remove confusion about the fact that the kernel header version was already chosen when the toolchain was built?

Best regards,
Thomas
