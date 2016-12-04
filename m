From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:03:10 +0100
Subject: [Buildroot] [git commit] lttng-libust: needs autoreconf
Message-ID: <20161204140356.A389F80DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=715498b1ee5072fda8a8f132bb80895d817f2bad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recently introduced
0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch touches
Makefile.am, so lttng-libust needs to be autoreconfed.

Fixes:

  http://autobuild.buildroot.net/results/e917552ea1069da74c4e392556914d05c010a250/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-libust/lttng-libust.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 23cc745..5667abb 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -12,6 +12,8 @@ LTTNG_LIBUST_LICENSE_FILES = COPYING
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 LTTNG_LIBUST_CONF_OPTS += --disable-man-pages
+# 0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch
+LTTNG_LIBUST_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
