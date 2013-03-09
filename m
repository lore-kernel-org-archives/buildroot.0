From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Mar 2013 15:02:57 +0100
Subject: [Buildroot] [PATCH 0/3] Misc improvements and fixes to 'icu' package
Message-ID: <1362837781-27071-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of 3 patches make a few improvements and fixes to the icu
package.

First patch workarounds an internal compiler error that occurs with
certain toolchains when building icu.

The second and third patch make nice build time improvements when
building the icu package.

Thanks,

Thomas

Thomas Petazzoni (3):
  icu: workaround toolchain bugs
  icu: don't build object files twice
  icu: speed up host build

 .../icu/icu-dont-build-static-dynamic-twice.patch  |   37 ++++++++++++++++++++
 package/icu/icu-workaround-toolchain-bugs.patch    |   36 +++++++++++++++++++
 package/icu/icu.mk                                 |    7 +++-
 3 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 package/icu/icu-dont-build-static-dynamic-twice.patch
 create mode 100644 package/icu/icu-workaround-toolchain-bugs.patch

-- 
1.7.9.5
