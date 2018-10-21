From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 13:54:12 +0200
Subject: [Buildroot] [PATCH 0/3] Misc gcc fixes/improvements
Message-ID: <20181021115415.21471-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The first patch fixes the build of no-thread toolchains: the
libcilkrts cannot build without threads. This was not noticed until
now, because we don't regularly build no-thread toolchain, except for
ARM, and libcilkrts was only enabled for ARM in gcc 7.x. This patch
was made as minimal as possible so that it can be backported to the
LTS branch.

The second patch reworks a bit the licilkrts handling so that we know
we can drop it at some point in the future (libcilkrts was removed
starting from gcc 8.x).

The third patch drops an unneeded option.

Best regards,

Thomas

Thomas Petazzoni (3):
  package/gcc: disable libcilkrts when there is no thread support
  package/gcc: introduce BR2_GCC_SUPPORTS_LIBCILKRTS
  package/gcc: remove BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE

 package/gcc/Config.in.host             |  6 ++++--
 package/gcc/gcc-final/gcc-final.mk     | 17 +++++++++++++++--
 package/gcc/gcc-initial/gcc-initial.mk |  9 ++-------
 package/gcc/gcc.mk                     |  5 +----
 4 files changed, 22 insertions(+), 15 deletions(-)

-- 
2.14.4
