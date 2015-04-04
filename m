From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 17:42:59 +0200
Subject: [Buildroot] [git commit] package/procps-ng: use more complete
	installation prefix
Message-ID: <20150404154941.C0561807A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6ce70341a85c60fd90e4d8446c9cd2bd22c81df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise we get a /lib/pkgconfig/libprocps.pc for example.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/procps-ng/procps-ng.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index b1c17c0..4e5c876 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -33,6 +33,12 @@ endif
 
 # We need this to make procps-ng binaries installed in $(TARGET_DIR)/usr
 # instead of $(TARGET_DIR)/usr/usr
-PROCPS_NG_CONF_OPTS += --exec-prefix=
+PROCPS_NG_CONF_OPTS += \
+	--prefix=/usr \
+	--exec-prefix=/ \
+	--sysconfdir=/etc \
+	--libdir=/usr/lib \
+	--bindir=/usr/bin \
+	--sbindir=/usr/sbin
 
 $(eval $(autotools-package))
