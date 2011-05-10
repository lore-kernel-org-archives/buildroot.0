From: Allan W. Nielsen <a@awn.dk>
Date: Tue, 10 May 2011 11:32:53 +0200
Subject: [Buildroot] [PATCH] Makefile.package.in: Fixing problem with
	relative in BR2_DL_DIR
In-Reply-To: <1305019973-16043-1-git-send-email-a@awn.dk>
References: <1305019973-16043-1-git-send-email-a@awn.dk>
Message-ID: <1305019973-16043-2-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using DOWNLOAD_GIT and BR2_DL_DIR is assigned to an relative path
build root will store the generated tar file in the wrong location

Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/Makefile.package.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 1e87256..51d3341 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -84,6 +84,7 @@ DL_DIR=$(call qstrip,$(BR2_DL_DIR))
 ifeq ($(DL_DIR),)
 DL_DIR:=$(TOPDIR)/dl
 endif
+DL_DIR:=$(shell readlink -f $(DL_DIR))
 
 ################################################################################
 # The DOWNLOAD_{GIT,SVN,BZR} helpers are in charge of getting a
-- 
1.7.3.4
