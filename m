From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue,  3 May 2011 16:40:53 +0200
Subject: [Buildroot] RFC: toolchain wrapper for external toolchains
Message-ID: <1304433655-1629-1-git-send-email-jacmet@sunsite.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds a toolchain wrapper for external toolchains as
discussed during the Buildroot dev day after FOSDEM.

This brings two advantages:
 - External toolchains are easier to use outside of Buildroot as no
   special compiler arguments have to be used. They behave just
   like the internal toolchain.
 - The code to ensure --sysroot was used everywhere (and the workarounds
   for packages like Qt and cmake) can be removed.

It has so far been tested with Codesourcery toolchains and a number of
package combinations.

 Makefile                                           |   12 +--
 package/Makefile.in                                |   53 ++-----------
 package/qt/qt.mk                                   |    8 +-
 toolchain/toolchain-external/ext-tool.mk           |   88 ++++++++++++++++++--
 .../toolchain-external/ext-toolchain-wrapper.c     |   75 +++++++++++++++++
 5 files changed, 171 insertions(+), 65 deletions(-)


--
Bye, Peter Korsgaard
