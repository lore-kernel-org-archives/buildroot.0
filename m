From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 23 Oct 2013 22:28:34 +0200
Subject: [Buildroot] [PATCH v2 2/2] docker: add license info
In-Reply-To: <1382560114-25036-1-git-send-email-arnout@mind.be>
References: <1382560114-25036-1-git-send-email-arnout@mind.be>
Message-ID: <1382560114-25036-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: no change

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/docker/docker.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index c1c8efd..4b597d1 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -7,6 +7,11 @@
 DOCKER_VERSION = 1.5
 DOCKER_SITE = http://icculus.org/openbox/2/docker
 
+DOCKER_DEPENDENCIES = host-pkgconf libglib2 xlib_libX11
+DOCKER_LICENSE = GPLv2+
+# The 'or later' is specified at the end of the README, so include that one too.
+DOCKER_LICENSE_FILES = COPYING README
+
 define DOCKER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		XLIBPATH=$(STAGING_DIR)/usr/lib
-- 
1.8.4.rc3
