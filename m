From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:43 +0200
Subject: [Buildroot] [PATCH 57/74] docker: remove useless post install
	stripping hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <523394b782be51ab8490853b2b6e7ec8353d4ca0.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker/docker.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 5e38653..5b4cd3a 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -22,7 +22,3 @@ DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 DOCKER_DEPENDENCIES = host-pkg-config libglib2 xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,docker))
-
-$(DOCKER_HOOK_POST_INSTALL): $(DOCKER_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/docker
-	touch $@
-- 
1.7.0.4
