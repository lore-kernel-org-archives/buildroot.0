From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 08:56:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/musl: bump to version 1.2.0
In-Reply-To: <20200226220348.247869-1-joerg.krause@embedded.rocks>
References: <20200226220348.247869-1-joerg.krause@embedded.rocks>
Message-ID: <20200227085635.61c809db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Feb 2020 23:03:48 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Also:
>  * Drop patch 0003 which is included in the new version.
>  * Update hash value of the COPYRIGHT file as the copyright year was
>    updated.
> 
> From the release history [1]:
> 
> This release moves all 32-bit archs to 64-bit time_t, enabling them
> to represent times beyond January of 2038.
> 
> There are no new requirements on kernel version, and this is not a
> hard ABI break, but the type changes do impact compatibility between
> code built against previous versions of musl and code built against
> musl 1.2. Users upgrading 32-bit systems should read the detailed
> time64 release notes [2]. 64-bit systems are not affected.
> 
> In addition, character data has been updated to align with Unicode
> 12.1.0, along with fixes for some errors in the data and a replacement
> for inefficient and unmaintainable case-mapping code. Correctness of
> results has been improved in the math library, particularly some complex
> functions and 32-bit x86 asm. Various arch-specific bugs have also been
> fixed.
> 
> [1] https://musl.libc.org/releases.html
> [2] https://musl.libc.org/time64.html
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...register-index-constants-to-signal.h.patch | 54 -------------------
>  package/musl/musl.hash                        |  6 +--
>  package/musl/musl.mk                          |  2 +-
>  3 files changed, 4 insertions(+), 58 deletions(-)
>  delete mode 100644 package/musl/0003-move-riscv64-register-index-constants-to-signal.h.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
