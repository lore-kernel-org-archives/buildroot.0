From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:44:44 -0700
Subject: [Buildroot] [PATCH 3/3] package/procps-ng: enable UTF-8 support
In-Reply-To: <1426715084-24894-1-git-send-email-steven@uplinklabs.net>
References: <1426715084-24894-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426715084-24894-3-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For an example of why to enable this: https://bugs.archlinux.org/task/38614

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/procps-ng/procps-ng.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index f7e3e3c..90289e2 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -39,4 +39,10 @@ PROCPS_NG_CONF_OPTS += \
 	--bindir=/usr/bin \
 	--sbindir=/usr/sbin
 
+# Allows unicode characters to show in 'watch'
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+PROCPS_NG_CONF_OPTS += \
+	--enable-watch8bit
+endif
+
 $(eval $(autotools-package))
-- 
2.3.3
