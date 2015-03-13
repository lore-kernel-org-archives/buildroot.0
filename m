From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 22:04:29 +0100
Subject: [Buildroot] [git commit] linux: add note about why it's safe to
	include other .mk files
Message-ID: <20150313210434.D95B27FA26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68443c52dd871ec157aff6b3f77bed1294c2eb57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5afcd4e..b1aca41 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -323,6 +323,14 @@ define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_HOST_TOOLS)
 endef
 
+# Note: our package infrastructure uses the full-path of the last-scanned
+# Makefile to determine what package we're currently defining, using the
+# last directory component in the path. As such, including other Makefile,
+# like below, before we call one of the *-package macro is usally not
+# working.
+# However, since the files we include here are in the same directory as
+# the current Makefile, we are OK. But this is a hard requirement: files
+# included here *must* be in the same directory!
 include $(sort $(wildcard linux/linux-ext-*.mk))
 
 $(eval $(kconfig-package))
