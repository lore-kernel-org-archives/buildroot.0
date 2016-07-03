From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jul 2016 11:49:52 +0200
Subject: [Buildroot] [PATCH 04/13] getent: remove VERSION/SOURCE
In-Reply-To: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467539401-3411-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467539401-3411-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the package infrastructure doen't attempt to download a package
that has an empty version string, there's no need to define the VERSION
and SOURCE variables in the getent package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/getent/getent.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/getent/getent.mk b/package/getent/getent.mk
index 18f0991..ed249e8 100644
--- a/package/getent/getent.mk
+++ b/package/getent/getent.mk
@@ -4,10 +4,6 @@
 #
 ################################################################################
 
-# source included in Buildroot
-GETENT_SOURCE =
-
-GETENT_VERSION = buildroot-$(BR2_VERSION)
 GETENT_LICENSE = LGPLv2.1+
 
 # For glibc toolchains, we use the getent program built/installed by
-- 
2.7.4
