From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 21:38:54 +0200
Subject: [Buildroot] [PATCH] mpir: fix ARM,
 PowerPC and mips builds failure
In-Reply-To: <1494178984-19821-2-git-send-email-semenak94@mail.ru>
References: <mpir: fix ARM, PowerPC64 and MIPS build failure>
 <1494178984-19821-1-git-send-email-semenak94@mail.ru>
 <1494178984-19821-2-git-send-email-semenak94@mail.ru>
Message-ID: <20170507213854.413cfc6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 May 2017 20:43:04 +0300, Semyon Kolganov wrote:

> +# Prefer generic build
> +MPIR_CONF_ENV += MPN_PATH=generic

I think this is really wrong, because it will use in all cases the
non-optimized generic code, instead of the more optimized assembly code
available for a number of architectures:

$ ls mpn/
alpha  arm  asm-defs.m4  cpp-ccas  generic  ia64  m4-ccas  Makeasm.am  Makefile.am  Makefile.in  mips32  mips64  powerpc32  powerpc64  README  sparc32  sparc64  x86  x86_64  x86_64w  x86w

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
