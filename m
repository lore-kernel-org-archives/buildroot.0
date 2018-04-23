From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Apr 2018 22:17:13 +0200
Subject: [Buildroot] Bump ATF version in arm_juno_defconfig ?
Message-ID: <20180423221713.275f1f66@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joao,

You originally contributed the arm_juno_defconfig in Buildroot. It
currently uses v1.2 of ATF, and I encountered a build failure with this
ATF version as part of the Buildroot test suite:

    ./build/juno/release/bl1/context_mgmt.o: In function `cm_prepare_el3_exit':
    context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): undefined reference to `cm_set_next_context'
    context_mgmt.c:(.text.cm_prepare_el3_exit+0x54): relocation truncated to fit: R_AARCH64_JUMP26 against undefined symbol `cm_set_next_context'

This issue has been fixed since ATF v1.3. Do you think you could
provide a patch bumping the ATF version ? The latest version is ATF
v1.5, so if you could bump the defconfig, it would be nice.

In addition, it would be great if you could send a patch adding
yourself in the DEVELOPERS file for this platform, so we easily know who
to contact for questions related to this platform.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
