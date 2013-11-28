From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Nov 2013 10:56:06 -0300
Subject: [Buildroot] [PATCH] util-linux: tweak sscanf-no-ms-as patch
Message-ID: <1385646966-1401-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch has a minor mistake so fix it.
Credit go to Daniel Mentz <daniel@exxm.de> for the detailed bug report.
Closes bug #6428

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/util-linux-001-sscanf-no-ms-as.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
index 72a060e..c95b755 100644
--- a/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
+++ b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
@@ -124,7 +124,7 @@ ported to util-linux-2.23.2
  			"%jd"		/* (4) used */
  			"%d",		/* priority */
  
-+#ifndef HAVE_SCANF_MS_MODIFIER
++#ifdef HAVE_SCANF_MS_MODIFIER
  			&src,
  			&fs->swaptype,
 +#else
-- 
1.8.3.2
