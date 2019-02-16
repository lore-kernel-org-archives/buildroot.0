From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 16 Feb 2019 15:45:27 +0200
Subject: [Buildroot] [PATCH 0/3] Disable brotli for Microblaze and propagate
 dependecies
Message-ID: <20190216134530.14717-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As discussed on the mailing list, here's a patch set to disable the
brotli package on Microblaze because it triggers a compiler bug. Only
libcurl uses it optionally, and the other direct user is woff2, which
itself is only needed by webkitgtk. Luckily, there is a build option
to disable WOFF2 support, so this disables the feature only for the
Microblaze architecture.

Adrian Perez de Castro (3):
  package/brotli: disable for microblaze
  package/woff2: propagate microblaze dependecy
  package/webkitgtk: propagate microblaze dependency

 package/brotli/Config.in       |  5 +++++
 package/webkitgtk/Config.in    |  2 +-
 package/webkitgtk/webkitgtk.mk | 12 +++++++++---
 package/woff2/Config.in        |  1 +
 4 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.20.1
