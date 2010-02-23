From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:47 +0100
Subject: [Buildroot] [PATCH 23/40] gob2: update dependency on flex
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1844bd894194d44472d7e1f41e3e0f52a6359117.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gob2 for the target needs both flex on the host (for running the flex
program at compile time) and flex on the target (so that it can link
against libfl.a).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gob2/Config.in |    1 +
 package/gob2/gob2.mk   |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index 314a1da..2545baf 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GOB2
 	bool "gob2"
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_FLEX_LIBFL
 	select BR2_PACKAGE_BISON
 	help
 	  GOB (GTK+ Object Builder) is a preprocessor which simplifies
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index cdf7961..5d50ed6 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -7,7 +7,7 @@ GOB2_VERSION = 2.0.15
 GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.gz
 GOB2_SITE = http://ftp.5z.com/pub/gob/
 
-GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config
+GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config host-flex
 
 HOST_GOB2_DEPENDENCIES = host-libglib2
 
-- 
1.6.3.3
