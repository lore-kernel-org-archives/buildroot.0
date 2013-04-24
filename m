From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 24 Apr 2013 12:08:58 +0200
Subject: [Buildroot] [RFC 4/4] package: fix generic install for top-level
	parallel make
In-Reply-To: <1366798138-30722-1-git-send-email-fabio.porcedda@gmail.com>
References: <1366798138-30722-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1366798138-30722-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-generic.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 09ddd81..c4ef0fb 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -360,28 +360,28 @@ else
 $(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
 endif
 
+$$($(2)_TARGET_INSTALL_TARGET) $$($(2)_TARGET_INSTALL_STAGING) \
+	$$($(2)_TARGET_INSTALL_IMAGES) $$($(2)_TARGET_INSTALL_HOST): $(1)-build
+
 ifeq ($$($(2)_INSTALL_TARGET),YES)
-$(1)-install-target:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_TARGET)
+$(1)-install-target:	$$($(2)_TARGET_INSTALL_TARGET)
 else
 $(1)-install-target:
 endif
 
 ifeq ($$($(2)_INSTALL_STAGING),YES)
-$(1)-install-staging:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_STAGING)
+$(1)-install-staging:	$$($(2)_TARGET_INSTALL_STAGING)
 else
 $(1)-install-staging:
 endif
 
 ifeq ($$($(2)_INSTALL_IMAGES),YES)
-$(1)-install-images:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_IMAGES)
+$(1)-install-images:	$$($(2)_TARGET_INSTALL_IMAGES)
 else
 $(1)-install-images:
 endif
 
-$(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
+$(1)-install-host:      $$($(2)_TARGET_INSTALL_HOST)
 
 $$($(2)_TARGET_BUILD): $(1)-configure
 $(1)-build:		$$($(2)_TARGET_BUILD)
-- 
1.8.1.4
