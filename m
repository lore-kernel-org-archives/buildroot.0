From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:10:55 +0200
Subject: [Buildroot] [PATCH 4/5] rtai: Install modules in
	/lib/modules/<version>/rtai
In-Reply-To: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
Message-ID: <77d33c8251975ea21d09773b6d8ce61c8bf45ff3.1316463052.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The /lib/modules/<version>/kernel/ is completely rewritten by the
kernel module installation, so third party modules should be outside
of this directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtai/rtai.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index abba614..a4a69f9 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -8,7 +8,7 @@ RTAI_CONF_OPT = \
 	--with-linux-dir=$(LINUX_DIR) 	\
 	--disable-leds		      	\
 	--disable-rtailab		\
-	--with-module-dir=/lib/modules/$(LINUX_VERSION_PROBED)/kernel/rtai
+	--with-module-dir=/lib/modules/$(LINUX_VERSION_PROBED)/rtai
 
 RTAI_MAKE = $(MAKE1)
 
-- 
1.7.4.1
