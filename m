From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 22:51:25 +0200
Subject: [Buildroot] [PATCH 3/3] package/binutils: remove version 2.31.1
In-Reply-To: <20200625121302.2286527-3-romain.naour@gmail.com>
References: <20200625121302.2286527-1-romain.naour@gmail.com>
 <20200625121302.2286527-3-romain.naour@gmail.com>
Message-ID: <20200629225125.45784206@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Jun 2020 14:13:02 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Now that binutils 2.34 has been introduced, and we have moved to
> 2.33.1 as the default version, it is time to drop support for binutils
> 2.31.1.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  Config.in.legacy                              |   8 +
>  package/binutils/2.31.1/0001-sh-conf.patch    |  48 --
>  .../0005-poison-system-directories.patch      | 306 ---------
>  ...ion-where-GOT-information-is-collect.patch | 198 ------
>  ...ess.-Return-FALSE-in-case-of-NULL-po.patch |  35 --
>  ...-symbol-is-not-an-indirect-or-warnin.patch |  43 --
>  ...was-still-being-generated-when-symbo.patch |  37 --
>  ...ation-of-undefined-weak-references-i.patch |  48 --
>  ...mic-relocations-sections-consistency.patch |  90 ---
>  ...OPERTY_X86_ISA_1_USED-note-if-needed.patch | 568 -----------------
>  ...ly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch | 588 ------------------
>  ...operly-add-X86_ISA_1_NEEDED-property.patch | 140 -----
>  ...hrink_dynamic_reloc_sections-for-exp.patch |  41 --
>  ...s-const16-for-xtensa-loop-relaxation.patch | 294 ---------
>  ...t-.literal_position-at-section-start.patch |  96 ---
>  .../0018-bfd-xtensa-fix-PR-ld-25630.patch     |  37 --
>  .../2.31.1/0019-xtensa-fix-PR-ld-25861.patch  | 376 -----------
>  ...TENSA_NDIFF-handling-for-PR-ld-25861.patch | 128 ----
>  package/binutils/Config.in.host               |   5 -
>  package/binutils/binutils.hash                |   1 -
>  package/gcc/Config.in.host                    |   4 -
>  21 files changed, 8 insertions(+), 3083 deletions(-)
>  delete mode 100644 package/binutils/2.31.1/0001-sh-conf.patch
>  delete mode 100644 package/binutils/2.31.1/0005-poison-system-directories.patch
>  delete mode 100644 package/binutils/2.31.1/0006-Refactored-location-where-GOT-information-is-collect.patch
>  delete mode 100644 package/binutils/2.31.1/0007-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
>  delete mode 100644 package/binutils/2.31.1/0008-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
>  delete mode 100644 package/binutils/2.31.1/0009-PLT-information-was-still-being-generated-when-symbo.patch
>  delete mode 100644 package/binutils/2.31.1/0010-xtensa-fix-relaxation-of-undefined-weak-references-i.patch
>  delete mode 100644 package/binutils/2.31.1/0011-xtensa-move-dynamic-relocations-sections-consistency.patch
>  delete mode 100644 package/binutils/2.31.1/0012-x86-Add-a-GNU_PROPERTY_X86_ISA_1_USED-note-if-needed.patch
>  delete mode 100644 package/binutils/2.31.1/0013-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch
>  delete mode 100644 package/binutils/2.31.1/0014-x86-Properly-add-X86_ISA_1_NEEDED-property.patch
>  delete mode 100644 package/binutils/2.31.1/0015-bfd-xtensa-fix-shrink_dynamic_reloc_sections-for-exp.patch
>  delete mode 100644 package/binutils/2.31.1/0016-gas-use-literals-const16-for-xtensa-loop-relaxation.patch
>  delete mode 100644 package/binutils/2.31.1/0017-xtensa-gas-put-.literal_position-at-section-start.patch
>  delete mode 100644 package/binutils/2.31.1/0018-bfd-xtensa-fix-PR-ld-25630.patch
>  delete mode 100644 package/binutils/2.31.1/0019-xtensa-fix-PR-ld-25861.patch
>  delete mode 100644 package/binutils/2.31.1/0020-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
