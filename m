From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 16:33:07 +0200
Subject: [Buildroot] [git commit] cpio: install to /bin and after busybox
Message-ID: <20151002143558.7F6A281DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63eaed6498d2ee668c24c220d602c9188ed05a9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the usual rule consider full-blown packages superior to busybox,
hence build after it.
Also install cpio to /bin to override the busybox-provided one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cpio/cpio.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index ca8463e..1576127 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -6,6 +6,8 @@
 
 CPIO_VERSION = 2.12
 CPIO_SITE = http://ftp.gnu.org/gnu/cpio
+CPIO_CONF_OPTS = --bindir=/bin
+CPIO_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 CPIO_LICENSE = GPLv3+
 CPIO_LICENSE_FILES = COPYING
 
