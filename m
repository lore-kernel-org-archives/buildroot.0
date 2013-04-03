From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Apr 2013 07:37:57 -0300
Subject: [Buildroot] [PATCH] gob2: host variant needs host-bison and
	host-flex
Message-ID: <1364985477-2991-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/837ab8dc79f732c2cdf52b9ac6c53d64e841b35f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gob2/gob2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index da208ac..c52f26c 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -7,7 +7,7 @@
 GOB2_VERSION = 2.0.18
 GOB2_SITE = http://ftp.5z.com/pub/gob
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkgconf host-flex
-HOST_GOB2_DEPENDENCIES = host-libglib2
+HOST_GOB2_DEPENDENCIES = host-bison host-flex host-libglib2
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.1.5
