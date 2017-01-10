From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jan 2017 10:05:52 -0600
Subject: [Buildroot] [PATCH 1/1] package/ustr: fix ldconfig for host build
Message-ID: <1484064352-50148-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

The host build of the ustr package also needs to not run the ldconfig to
prevent a build failure caused by the symlink creating a race condition.
Related commit for target build change was 22069232.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/ustr/ustr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index b3de50b..715914c 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -26,6 +26,7 @@ USTR_INSTALL_STAGING = YES
 USTR_MAKE_OPTS = all all-shared
 
 USTR_CONF_OPTS += LDCONFIG=/bin/true
+HOST_USTR_CONF_OPTS += LDCONFIG=/bin/true
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.9.1
