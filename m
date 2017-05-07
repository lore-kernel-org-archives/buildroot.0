From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 14:55:48 +0200
Subject: [Buildroot] Buildroot defconfig failures
Message-ID: <20170507145548.336e29ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Fabio, Ren: there are some questions for you below.

I took a look at the Buildroot defconfig failures, which have been
built tested by Gitlab CI this morning. I've fixed a number of them,
but there are a few that still need fixing:

 - The CSKY defconfig does not build, with "SSP support not available
   in this toolchain, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP".
   However, I can't reproduce locally. So I'm not sure what happening.

   There is no hash on the toolchain tarball, but the one I downloaded
   locally has the exact same size as the one that was downloaded by
   Gitlab CI. While not an 100% guaranteed proof that it's the same
   toolchain, it would be unlikely to have the toolchain tarball
   changed in the mean time.

   So the only explanation would be that the SSP check for some reason
   fails in the Gitlab CI infrastructure.

   Arnout, what do you think ?

   Ren, do you have an idea ?

   See https://gitlab.com/buildroot.org/buildroot/builds/15762185

 - All Freescale defconfigs that rely on git.freescale.com are failing
   with "Connection timed out". I'm also not able to clone from
   git.freescale.com from my local machine, at least with git://. I'm
   currently trying with http://. If that works, I'll update the
   defconfigs accordingly.

   Fabio, do you have a suggestion?

The ones that have been fixed:

 - armadeus_apf9328_defconfig

   https://gitlab.com/buildroot.org/buildroot/builds/15762159

   Fixed by:
   https://git.buildroot.org/buildroot/commit/?id=423e1381b426eb63695b1bc36c2d60aaf4001cf0

 - beaglebone_qt5_defconfig

   https://gitlab.com/buildroot.org/buildroot/builds/15762182

   Fixed by:
   https://git.buildroot.org/buildroot/commit/?id=028eb673c8f2c79fb26dfe7287d43bc237441035

 - check-gitlab-cy.yml

   https://gitlab.com/buildroot.org/buildroot/builds/15762148

   Fixed by:
   https://git.buildroot.org/buildroot/commit/?id=6520c06e5b0478e2094a4d61a9b621579cadf0df

 - galileo_defconfig

   https://gitlab.com/buildroot.org/buildroot/builds/15762201

   Fixed by:
   https://git.buildroot.org/buildroot/commit/?id=fcbb098a0c87337752afdd5cb76bd9714a9873eb

 - pc_x86_64_efi_defconfig

   https://gitlab.com/buildroot.org/buildroot/builds/15762234

   Fixed by:
   https://git.buildroot.org/buildroot/commit/?id=a4b8342bbe4761b5e9e5306ff549f0ca8bc166bb

 - snps_archs38_zebu_defconfig

   https://gitlab.com/buildroot.org/buildroot/builds/15762277

   Fixed by
   https://git.buildroot.org/buildroot/commit/?id=ef1ad1fe66a6f55a7d5e1c45c88f665c9470c363

 - stm32f469_disco_defconfig 

   https://gitlab.com/buildroot.org/buildroot/builds/15762279

   Fixed by:
   https://git.buildroot.org/buildroot/commit/?id=c383e8fc8be95deb16032fecd1de00792e2cddb0

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
