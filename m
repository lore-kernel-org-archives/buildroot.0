From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2013 15:27:16 +0100
Subject: [Buildroot] [git commit] knock: fix _SITE so the correct git
	version is used
Message-ID: <20131212142809.2EBF99BFD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ef692972447e1d24aaa854440714eca16998cfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And not just the latest commit from master.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/knock/knock.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 41fc0fb..cad7516 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 KNOCK_VERSION = 7666f2e86e18d482eaad5fe1fea46d87d80b0555
-KNOCK_SITE = $(call github,jvinet,knock,master)
+KNOCK_SITE = $(call github,jvinet,$(KNOCK_VERSION))
 KNOCK_LICENSE = GPLv2+
 KNOCK_LICENSE_FILES = COPYING
 KNOCK_AUTORECONF = YES
