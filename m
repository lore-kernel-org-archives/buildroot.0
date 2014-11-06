From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu,  6 Nov 2014 10:13:36 +0100
Subject: [Buildroot] [PATCH v3 2/3] pkg-download: silence the svn download
	helper if it is a silent build
In-Reply-To: <1415265217-18494-1-git-send-email-fabio.porcedda@gmail.com>
References: <1415265217-18494-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1415265217-18494-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If it is a silent build (make -s -> QUIET=-q), silence the svn download
helper using "svn -q" just like others download helpers, e.g. wget.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---

Notes:
    v3:
     - add this patch

 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index f3409bd..92240c0 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -9,7 +9,7 @@
 
 # Download method commands
 export WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
-export SVN := $(call qstrip,$(BR2_SVN))
+export SVN := $(call qstrip,$(BR2_SVN)) $(QUIET)
 export CVS := $(call qstrip,$(BR2_CVS))
 export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
-- 
2.1.3
