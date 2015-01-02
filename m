From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 Jan 2015 16:53:41 +0100
Subject: [Buildroot] [PATCH 3/3 v10] package/pkg-download: do not hard-code
	QUIET
In-Reply-To: <cover.1420213948.git.yann.morin.1998@free.fr>
References: <cover.1420213948.git.yann.morin.1998@free.fr>
Message-ID: <9b12978224418fe368d83e1ca7988619a18e9b74.1420213948.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not hard-code QUIET in our download commands, since it is handled in
the backends.

Suggested by Fabio.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-download.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 9c782fe..5e74519 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -8,14 +8,14 @@
 ################################################################################
 
 # Download method commands
-export WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
+export WGET := $(call qstrip,$(BR2_WGET))
 export SVN := $(call qstrip,$(BR2_SVN))
 export CVS := $(call qstrip,$(BR2_CVS))
 export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
-export HG := $(call qstrip,$(BR2_HG)) $(QUIET)
-export SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
-SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
+export HG := $(call qstrip,$(BR2_HG))
+export SCP := $(call qstrip,$(BR2_SCP))
+SSH := $(call qstrip,$(BR2_SSH))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
-- 
1.9.1
