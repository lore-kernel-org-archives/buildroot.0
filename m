From: Roland Franke <fli4l@franke-prem.de>
Date: Tue, 8 Mar 2016 20:53:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/owfs: Install owfs in staging
	directory
Message-ID: <B68AA701312B47E08D135DD8EDFAA4E6@ROLANDAMD64>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install package in staging directory, so that this package can be linked 
together with other packages (By me with collectd and the onewire plugin)

Signed-off-by: Roland Franke <fli4l@franke-prem.de>
---
package/owfs/owfs.mk  | 1 +
1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 23167f4..083939a 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -15,6 +15,7 @@ OWFS_AUTORECONF = YES
# owtcl license is declared in module/ownet/c/src/include/ow_functions.h
OWFS_LICENSE = GPLv2+, LGPLv2 (owtcl)
OWFS_LICENSE_FILES = COPYING COPYING.LIB
+OWFS_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_LIBFUSE),y)
OWFS_DEPENDENCIES += libfuse
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160308/9ef913e5/attachment.html>
