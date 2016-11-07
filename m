From: Romain NAOUR <romain.naour@smile.fr>
Date: Mon, 07 Nov 2016 10:39:56 +0100
Subject: [Buildroot] [PATCH v4 00/22] Splitting the toolchain-external
 package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <db81de3a8a8836bdd143ca01f1ed58cf@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 2016-11-07 02:19, Arnout Vandecappelle (Essensium/Mind) a ?crit :

> I reworked Romain's series. I'm too tired now to write a proper cover
> letter, but here it goes anyway :-)
> 
> I may have screwed up authorship or date of some of these patches. Oh
> well, who cares :-P

Thank you for the rework.
I've started to review it yesterday on your github, I'll finish ASAP.

Best regards,
Romain

> 
> Regards,
> Arnout
> 
> ---
> 
> The following changes since commit
> 6bb7430a20871ad4e3ccbc8c1992d60117214be2:
> 
> Makefile: delete default rules (2016-11-05 23:34:26 +0100)
> 
> are available in the git repository at:
> 
> http://github.com/arnout/buildroot [1] external-toolchain
> 
> for you to fetch changes up to 
> ad925c956093b8fcd04d084471b78f9ca074cbb9:
> 
> toolchain-external: remove Arago toolchains (2016-11-07 02:15:06 
> +0100)
> 
> ----------------------------------------------------------------
> Arnout Vandecappelle (6):
> Use already qstripped BR2_TOOLCHAIN_EXTERNAL_PREFIX everywhere
> toolchain-external: reorder the contents of toolchain-external.mk
> toolchain-external: move parts to pkg-toolchain-external.mk
> toolchain-external: introduce toolchain-external-package
> toolchain-external-codesourcery-arm: Cortex-A12 and Cortex-A17 not
> supported
> toolchain-external: remove Arago toolchains
> 
> Romain Naour (1):
> toolchain-external-codesourcery-amd64: new package
> 
> Thomas Petazzoni (15):
> toolchain-external-linaro-aarch64: new package
> toolchain-external-codesourcery-aarch64: new package
> toolchain-external-linaro-arm: new package
> toolchain-external-codesourcery-arm: new package
> toolchain-external-linaro-armeb: new package
> toolchain-external-blackfin-uclinux: new package
> toolchain-external-codesourcery-mips: new package
> toolchain-external-codescape-img-mips: new package
> toolchain-external-codescape-mti-mips: new package
> toolchain-external-codesourcery-niosII: new package
> toolchain-external-codesourcery-sh: new package
> toolchain-external-codesourcery-x86: new package
> toolchain-external-musl-cross: new package
> toolchain-external-custom: new package
> toolchain-external-arc: new package
> 
> Config.in.legacy | 16 +
> package/Makefile.in | 2 +-
> package/wine/wine.mk | 2 +-
> toolchain/toolchain-external/Config.in | 982
> ++++--------------------------------------------------
> toolchain/toolchain-external/pkg-toolchain-external.mk | 674
> +++++++++++++++++++++++++++++++++++++
> 
toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in
> | 17 +
> 
toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options
> | 10 +
> 
toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash
> | 3 +
> 
toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
> | 33 ++
> 
toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
> | 62 ++++
> 
toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
> | 9 +
> 
.../toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
> | 3 +
> 
toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
> | 47 +++
> 
toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
> | 73 ++++
> 
toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options
> | 9 +
> 
.../toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
> | 3 +
> 
toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
> | 47 +++
> 
toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
> | 17 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options
> | 9 +
> 
.../toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
> | 3 +
> 
.../toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
> | 22 ++
> 
toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
> | 24 ++
> 
toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
> | 9 +
> 
.../toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
> | 3 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
> | 12 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> | 35 ++
> 
toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options
> | 9 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
> | 3 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
> | 13 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
> | 93 ++++++
> 
toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
> | 9 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
> | 3 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
> | 13 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
> | 17 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
> | 9 +
> 
.../toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
> | 3 +
> 
.../toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
> | 13 +
> toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
> | 25 ++
> 
toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
> | 9 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
> | 3 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk
> | 13 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
> | 29 ++
> 
toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
> | 9 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
> | 3 +
> 
toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk
> | 12 +
> toolchain/toolchain-external/toolchain-external-custom/Config.in | 5 +
> toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> | 334 +++++++++++++++++++
> 
toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk
> | 15 +
> toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
> | 15 +
> 
toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
> | 9 +
> 
toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
> | 3 +
> 
toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
> | 16 +
> toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in |
> 27 ++
> 
toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
> | 9 +
> 
toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
> | 3 +
> 
toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
> | 16 +
> toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in 
> |
> 26 ++
> 
toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
> | 9 +
> 
toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
> | 3 +
> 
toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
> | 16 +
> toolchain/toolchain-external/toolchain-external-musl-cross/Config.in |
> 30 ++
> 
toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options
> | 19 ++
> 
toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
> | 12 +
> 
toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk
> | 12 +
> toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in 
> |
> 20 ++
> 
toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
> | 10 +
> 
toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
> | 5 +
> 
toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
> | 24 ++
> toolchain/toolchain-external/toolchain-external.hash | 67 ----
> toolchain/toolchain-external/toolchain-external.mk | 792
> +------------------------------------------
> 70 files changed, 2145 insertions(+), 1766 deletions(-)
> create mode 100644
> toolchain/toolchain-external/pkg-toolchain-external.mk
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-arm/toolchain-external-codesourcery-arm.mk
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-mips/toolchain-external-codesourcery-mips.mk
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
> create mode 100644
> toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk
> create mode 100644
> toolchain/toolchain-external/toolchain-external-custom/Config.in
> create mode 100644
> toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk
> create mode 100644
> toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
> create mode 100644
> toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
> create mode 100644
> toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
> create mode 100644
> toolchain/toolchain-external/toolchain-external-musl-cross/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk
> create mode 100644
> toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
> create mode 100644
> 
toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
> delete mode 100644 
> toolchain/toolchain-external/toolchain-external.hash
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot [2]


Links:
------
[1] http://github.com/arnout/buildroot
[2] http://lists.busybox.net/mailman/listinfo/buildroot
