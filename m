From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jul 2016 11:49:51 +0200
Subject: [Buildroot] [PATCH 03/13] pkg-virtual: remove VERSION/SOURCE
In-Reply-To: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467539401-3411-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the package infrastructure doen't attempt to download a package
that has an empty version string, there's no need to define the VERSION
and SOURCE variables in the virtual package infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-virtual.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 3fbe0a3..bcb2cad 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -43,12 +43,6 @@ endif
 
 $(2)_IS_VIRTUAL = YES
 
-# A virtual package does not have any source associated
-$(2)_SOURCE =
-
-# Fake a version string, so it looks nicer in the build log
-$(2)_VERSION = virtual
-
 # Add dependency against the provider
 $(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
 
-- 
2.7.4
