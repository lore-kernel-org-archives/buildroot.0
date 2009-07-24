From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2009 23:30:13 +0200
Subject: [Buildroot] [PATCH 12/13] xorg: remove references to non-existing
	configuration options
In-Reply-To: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b36a5894809b71b65da3fcfa8ba4b2a645c01194.1248471011.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option BR2_PACKAGE_TINY, BR2_PACKAGE_XORG and BR2_PACKAGE_XGGI
don't exist, so do not use them to find the value of the $(XSERVER)
variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 7daa3b4..32aa259 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -384,18 +384,9 @@ endif
 # X Windowing system
 
 XSERVER:=
-ifeq ($(BR2_PACKAGE_TINYX),y)
-XSERVER+=tinyx
-endif
-ifeq ($(BR2_PACKAGE_XORG),y)
-XSERVER+=xorg
-endif
 ifeq ($(BR2_PACKAGE_XORG7),y)
 XSERVER+=xserver_xorg-server
 endif
-ifeq ($(BR2_PACKAGE_XGGI),y)
-XSERVER+=xggi
-endif
 
 X11_PREFIX:=$(strip $(subst ",, $(BR2_X11_PREFIX)))
 #"))
-- 
1.6.0.4
