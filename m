From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 19 Dec 2012 10:07:27 -0300
Subject: [Buildroot] [PATCH] ortp: disable Werror
Message-ID: <1355922447-20410-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable -Werror for the ortp build, fixes:
http://autobuild.buildroot.net/results/b869fcfdfdb9d1ec4864b86c6953b0242200c502

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ortp/ortp.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index 65a03bf..c4c900a 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -1,5 +1,6 @@
 ORTP_VERSION = 0.20.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
+ORTP_CONF_OPT = --disable-strict
 ORTP_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.7.8.6
