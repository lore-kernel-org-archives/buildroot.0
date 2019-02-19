From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Feb 2019 11:38:36 +0100
Subject: [Buildroot] [PATCHv5 6/9] package/pkg-download: export 'SSH' for
 use in the download backends
In-Reply-To: <20190219103839.25409-1-patrickdepinguin@gmail.com>
References: <20190219103839.25409-1-patrickdepinguin@gmail.com>
Message-ID: <20190219103839.25409-6-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Originally, the tools defined in pkg-download.mk were used from Makefiles
and were directly available. Due to the introduction of the download
infrastructure in shell scripts, these variables now need to be exported in
order for the scripts to see them.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v5: new patch

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index dfc4460c6a..17d1ca99ee 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -15,7 +15,7 @@ export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
 export HG := $(call qstrip,$(BR2_HG))
 export SCP := $(call qstrip,$(BR2_SCP))
-SSH := $(call qstrip,$(BR2_SSH))
+export SSH := $(call qstrip,$(BR2_SSH))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
-- 
2.19.2
