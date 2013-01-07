From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2013 22:52:03 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: export BR2_CONFIG_FILE,
	pointing to our .config
In-Reply-To: <cover.1357595083.git.yann.morin.1998@free.fr>
References: <cover.1357595083.git.yann.morin.1998@free.fr>
Message-ID: <fd01d05b62a384b43722e790e3e491f87c818797.1357595083.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support scripts (in support/) may need to parse the .config file,
so give them an easy access to it, by exporting CONFIG_FILE with
the fully-qualified path to .config.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 4b09437..7a2902d 100644
--- a/Makefile
+++ b/Makefile
@@ -91,6 +91,10 @@ EXTRAMAKEARGS = O=$(O)
 NEED_WRAPPER=y
 endif
 
+# Scripts in support/ may need to parse out .config, so give
+# them easy access
+export BR2_CONFIG_FILE=$(CONFIG_DIR)/.config
+
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(CONFIG_DIR)/.config
-- 
1.7.2.5
