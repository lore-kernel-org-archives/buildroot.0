From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 19 Apr 2016 16:52:31 -0400
Subject: [Buildroot] [PATCH 0/4] match headers with latest kernel source
Message-ID: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the configuration menu, it is hard for a user to make the distinction
between the two methods offered by Buildroot to fetch the kernel headers for
the toolchain: either download an independent kernel source to use its headers,
or get them from the configured Linux source that Buildroot is about to build.

It is also confusing to choose the latest kernel version known to Buildroot and
its kernel headers, and still have to specify a custom headers series. This
breaks the idea of maintaining an up-to-date board support since after a few
kernel bumps, the "Custom kernel headers series" would need to be bumped too...

This patchset aims to document this distinction and avoid confusion before
matching the headers series with kernel source when using the latest kernel.

Vivien Didelot (4):
  linux: explicit latest kernel version
  linux-headers: indent custom choices
  linux-headers: rename _AS_KERNEL to _FROM_KERNEL
  linux-headers: match headers for the latest kernel

 linux/Config.in                        |   2 +-
 package/linux-headers/Config.in.host   | 187 ++++++++++++++++++---------------
 package/linux-headers/linux-headers.mk |   8 +-
 3 files changed, 105 insertions(+), 92 deletions(-)

-- 
2.8.0
