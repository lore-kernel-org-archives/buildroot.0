From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 14 Mar 2018 02:29:46 +0200
Subject: [Buildroot] [PATCH/next 0/3] Update WebKitGTK+ to 2.20.0
Message-ID: <20180314002949.109236-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

This patch series adds a new dependency needed by WebKitGTK+: woff. In turn,
that depends on brotli, which the patch series adds as well.

I am adding myself as maintainer for those two new packages (brotli and woff2)
in the DEVELOPERS file and I will be keeping an eye on their releases.

So far I have only tested making an AArch64 build for the Raspberry Pi 3 and
the update could use a bit more of testing, but I think it is worth to send
the patch series early for review and try making a couple of builds for other
architectures in the meantime.

Best regards,

-Adrian


Adrian Perez de Castro (3):
  brotli: new package
  woff2: new package
  webkitgtk: update to version 2.20.0

 DEVELOPERS                       |  2 ++
 package/Config.in                |  2 ++
 package/brotli/Config.in         | 12 ++++++++++++
 package/brotli/brotli.hash       |  5 +++++
 package/brotli/brotli.mk         | 17 +++++++++++++++++
 package/webkitgtk/Config.in      |  2 ++
 package/webkitgtk/webkitgtk.hash |  8 ++++----
 package/webkitgtk/webkitgtk.mk   |  4 ++--
 package/woff2/Config.in          |  9 +++++++++
 package/woff2/woff2.hash         |  5 +++++
 package/woff2/woff2.mk           | 17 +++++++++++++++++
 11 files changed, 77 insertions(+), 6 deletions(-)
 create mode 100644 package/brotli/Config.in
 create mode 100644 package/brotli/brotli.hash
 create mode 100644 package/brotli/brotli.mk
 create mode 100644 package/woff2/Config.in
 create mode 100644 package/woff2/woff2.hash
 create mode 100644 package/woff2/woff2.mk

-- 
2.16.2
