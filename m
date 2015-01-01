From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Jan 2015 21:03:53 +0100
Subject: [Buildroot] [PATCH 4/4 v9] package/pkg-download: do not hard-code
	QUIET
In-Reply-To: <cover.1420142462.git.yann.morin.1998@free.fr>
References: <cover.1420142462.git.yann.morin.1998@free.fr>
Message-ID: <8745e57788ef111547ca0a3f4b407b09cafb20f0.1420142462.git.yann.morin.1998@free.fr>
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
