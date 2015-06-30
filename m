From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:26:49 +0200
Subject: [Buildroot] [git commit] monkey: fix building with debugging symbols
Message-ID: <20150630122721.796877FAED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75689d2ab250720a4d3e165a4d4380daebdbeac9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a typo in the monkey package - should be MONKEY_CONF_OPTS
instead of MONKEY_CONF_OPT.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/monkey/monkey.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 2344f8c..419750e 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -47,7 +47,7 @@ MONKEY_POST_INSTALL_TARGET_HOOKS += MONKEY_REMOVE_DANGLING_SYMLINK
 endif
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-MONKEY_CONF_OPT += --debug
+MONKEY_CONF_OPTS += --debug
 endif
 
 define MONKEY_CONFIGURE_CMDS
