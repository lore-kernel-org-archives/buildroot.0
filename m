From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 23:30:50 +0200
Subject: [Buildroot] [git commit] libconfuse: add optional dependency on
	gettext
Message-ID: <20160818213130.68218817EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d68771e5493442443db3956b85ec0083f5facf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When available, libconfuse will use the libintl provided by the gettext
package.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
[Thomas: make it really an optional dependency.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libconfuse/libconfuse.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index fea90f1..2908af3 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -14,5 +14,9 @@ HOST_LIBCONFUSE_DEPENDENCIES = host-flex
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+LIBCONFUSE_DEPENDENCIES += gettext
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
