From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 14:36:08 +0100
Subject: [Buildroot] [git commit] package/systemd: fix build with fallback
 hostname
Message-ID: <20180129133653.499D387F67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2b85b48097b2ff2785644b3c43521cb04a733a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit aebabb2780da4c5f85fec00b56f4690feb646073 used an automoake
configuration option. Replace it with the meson version.

Fixes #10716

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b56c6c6b26..f58e037943 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -319,7 +319,7 @@ endif
 
 SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
-SYSTEMD_CONF_OPTS += --with-fallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
+SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
 endif
 
 define SYSTEMD_INSTALL_INIT_HOOK
