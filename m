From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:44:43 -0700
Subject: [Buildroot] [PATCH 2/3] package/procps-ng: use more complete
	installation prefix
In-Reply-To: <1426715084-24894-1-git-send-email-steven@uplinklabs.net>
References: <1426715084-24894-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426715084-24894-2-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise we get a /lib/pkgconfig/libprocps.pc for example.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/procps-ng/procps-ng.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 1483662..f7e3e3c 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -31,6 +31,12 @@ endif
 
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
-- 
2.3.3
