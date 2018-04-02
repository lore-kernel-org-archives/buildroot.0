From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 08:10:15 +0200
Subject: [Buildroot] Buildroot hackathon day 2 highlights
Message-ID: <20180402081015.7f2bd1f4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The Buildroot hackathon in Paris continued on its second day, with
more progress being done in a number of areas.

 - Romain Naour reviewed a number of patches adding new packages,
   allowing them to be merged (for most of them), or marked as Changes
   Requested when the changes to be made were too substantial that
   they required the original contributor to be involved. Romain's
   work allowed to merge:

   quotatool: new package
   package/snort: new package
   i2pd: new package
   libcdio-paranoia: new package

 - Thomas reviewed and applied the (large) series from Ricardo
   Martincoski that cleans up a number of .mk files and Config.in
   files in terms of coding style, and enables running our
   check-package tool on many more files.

 - Thomas merged the test-pkg improvements that he had proposed, after
   having the Ack from Yann. Those improvements make test-pkg test
   only a useful set of toolchains by default, rather than all
   toolchains. This makes test-pkg a little bit more usable, as the
   build time and disk space required significantly reduced, and the
   set of "useful" toolchains has been carefully chosen to catch most
   important cases.

 - Some fixes were made to the Golang package infrastructure,
   following its merge the previous day.

 - Arnout looked at all the pending patches related to Qt5, and worked
   on them. It resulted in a number of patches being merged:

   qt5webkit: fix build issue with 32-bits  armv8-a
   sqlite: add option for meta-data about  tables/queries (needed for
   Qt 5.10) package/qt5/qt5scxml: install missing QML  module
   Revert "qt5wayland: fix build issue with  mesa3d w/out xcb"
   Revert "qt5multimedia: fix build issue  with mesa3d w/out xcb"
   Revert "qt5webkit: fix build issue with  mesa3d w/out xcb"
   qt5base: fix build issue with mesa3d w/out  xcb

   Arnout also looked at the Qt 5.10 bump and made some comments on
   how to move forward with it.

 - Yann E. Morin and Maxime Hadjinlian continued the work on the Git
   caching series. Yann E. Morin did an extensive review of it, and
   they then started working together at addressing those comments to
   have a new version ready for the third day of the hackathon.

 - Our quest to take care of the oldest patches in patchwork has
   continued, with good progress being made:

   * The long-standing MIPS build issue with -mno-fused-madd has been
     fixed by "toolchain-wrapper: use -ffp-contract=off on MIPS Xburst
     for gcc >= 4.6"

   * Some GStreamer packages were merged by Peter:
     gst1-interpipe: new package
     gstreamer1-editing-services: new package
     gstreamer1-editing-services: bump version  to 1.12.4
     DEVELOPERS: add an entry for  gstreamer1-editing-services

   * Thomas started looking and merging a few patches from Ricardo
     Martincoski on the testing infrastructure:
     testing/infra/builder: call make with  empty env
     testing/infra/builder: split configure()  from build()

   * Coreutils was switched from using shell wrappers to symlinks:
     coreutils: rewrite for loop with foreach
     coreutils: use single binary in symlink  method

   * Some infrastructure changes were merged:
     support/download: keep files downloaded without hash
     Allow adding per-package override rsync exclusions
     core: rename FOO_BASE_NAME to FOO_BASENAME to avoid clashes

   * Peter reviewed, improved and merged the patch series from Thomas
     improving graph-depends, and adding the
     <pkg>-show-recursive-{depends,rdepends} targets.

   * Arnout reviewed and merged the SolidRun ClearFog defconfig.

 - A number of bugs were closed:

   [Bug 10531] QtWebengine doesn't build if the host  hasn't a 32 bits
   C++ compiler working [Bug 10776] ktap fails to build
   [Bug 10151] toolchain eclipse register : fails with a  custom
   BR2_HOST_DIR [Bug 10886] openssl-1.0.2n fails to build
   [Bug 10851] Patch to handle numpad Enter key properly

 - Thomas did an extensive review of the LLVM patch series from
   Valentin Korenblit.

 - And of course we continued to take care of the influx of new patches.

By the end of the second day, the backlog of patches in patchwork had
dropped to 196 patches, while we started with ~350 patches at the
beginning of the hackathon.

Now starts the third and last day of this hackathon, which will be
shorter than the previous days since most of the participants are
going to head back home at the end of the afternoon.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
