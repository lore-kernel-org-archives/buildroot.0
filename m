From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 16:09:00 +0100
Subject: [Buildroot] [PATCH 3/3] flex: needs host-m4
In-Reply-To: <1364137740-21652-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364137740-21652-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364137740-21652-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/9f5c2ad2b3d268dd82985a3a386530a12e5681ef/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flex/flex.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 834f0b5..59551f2 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -10,9 +10,9 @@ FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
 FLEX_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext)
+	$(if $(BR2_PACKAGE_GETTEXT),gettext) host-m4
 # we don't have a host-gettext/libintl
-HOST_FLEX_DEPENDENCIES =
+HOST_FLEX_DEPENDENCIES = host-m4
 
 ifeq ($(BR2_PACKAGE_FLEX_BINARY),y)
 # lex -> flex
-- 
1.7.9.5
