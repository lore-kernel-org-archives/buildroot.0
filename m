From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:28 +0200
Subject: [Buildroot] [PATCH 16/21] ipkg: remove useless configure options
In-Reply-To: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <847a6e792be816bf3d07236168009f73d9a3bceb.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These options are part of the default set of options passed to
./configure by the AUTOTARGETS infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipkg/ipkg.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index 5f640f6..ae0c872 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -11,7 +11,4 @@ IPKG_AUTORECONF = NO
 IPKG_INSTALL_STAGING = YES
 IPKG_INSTALL_TARGET = YES
 
-IPKG_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr --sysconfdir=/etc
-
 $(eval $(call AUTOTARGETS,package,ipkg))
\ No newline at end of file
-- 
1.6.3.3
