From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 15:17:44 +0200
Subject: [Buildroot] [pull request] arch/arm: add some new armv8a cores
In-Reply-To: <cover.1504432422.git.yann.morin.1998@free.fr>
References: <cover.1504432422.git.yann.morin.1998@free.fr>
Message-ID: <cover.1504444617.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds all the armv8a cores currently known to any released
version of gcc.

First, we do a bit of cleanups in the existing menu: re-order the cores,
simplify hiding non-64-bit cores, rename armv8 to armv8a.

Second, as all armv8a cores are guaranteed by the ISA to have a VFPv4,
we disallow building a soft-float toolchain on those cores when in
64-bit mode.

Now we add a bunch of armv8a cores, cortex and non-cortex alike, with a
few armv8.1a variants as well.

It is to be noted that we do have at least one armv8a core that is in
fact 32-bit only, while we also do have a few armv8a cores that are
64-bit only (or at least gcc does not recognises them in arm mode).

Eventually, we add a build-only test for all those toolchains, to check
that at least the toolchains do build. This final commit is not meant to
be applied, it adds way too many tests.

This series relies on the previous architecture series I've recently
sent:
    http://lists.busybox.net/pipermail/buildroot/2017-September/201403.html
    http://lists.busybox.net/pipermail/buildroot/2017-September/201409.html

Regards,
Yann E. MORIN.

PS. I've sent this series as a real pull-request, just to see how
the new patchwork handles it: currently, series are sorted by the
first patch, and patchwork misses the cover-letter. Let's see if
a cover-letter that is a pull-request gets noticed.


The following changes since commit 41eeac74f986790fe26f03ebf05322120d2c04da

  package/gcc: slight cleanup and reorg in remaining arch depends (2017-09-03 11:14:53 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to a876f6b64754ba3b96492c57b18654f8ec465ca0

  [DON'T COMMIT] tests for all new arm cores (2017-09-03 15:02:47 +0200)


----------------------------------------------------------------
Yann E. MORIN (9):
      arch/arm: re-order cores choice
      arch/arm: simplify hiding non 64-bit cores
      arch/arm: armv8 is really armv8a
      arch/arm: do not allow soft-float for armv8a
      arch/arm: add cortex-A32
      arch/arm: add some armv8a cortex variants
      arch/arm: add some non-cortex armv8a cores
      arch/arm: add armv8.1a cores
      [DON'T COMMIT] tests for all new arm cores

 arch/Config.in.arm                                 | 297 ++++++++++++++++-----
 package/pkg-cmake.mk                               |   2 +-
 .../tests/toolchain/test_internal_aarch64_all.py   | 162 +++++++++++
 .../tests/toolchain/test_internal_arm_all.py       |  95 +++++++
 .../toolchain-external-codesourcery-arm/Config.in  |   2 +-
 .../toolchain-external-linaro-arm/Config.in        |   2 +-
 .../toolchain-external-linaro-armeb/Config.in      |   2 +-
 7 files changed, 489 insertions(+), 73 deletions(-)
 create mode 100644 support/testing/tests/toolchain/test_internal_aarch64_all.py
 create mode 100644 support/testing/tests/toolchain/test_internal_arm_all.py

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
