From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sat, 28 Jul 2012 09:21:22 +0200
Subject: [Buildroot] [PATCH 3/3] doc: Update the documentation to mention
	the new PKG_INSTALL_INIT_ variables
In-Reply-To: <cover.1343460025.git.maxime.ripard@free-electrons.com>
References: <cover.1343460025.git.maxime.ripard@free-electrons.com>
Message-ID: <6784a19dec70861969e093a123abe92f4ace3e56.1343460025.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index d264f40..d3a4abb 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -311,6 +311,13 @@ different steps of the build process.
 * +LIBFOO_UNINSTALL_STAGING_CMDS+, used to list the actions to
   uninstall the package from the staging directory +$(STAGING_DIR)+.
 
+* +LIBFOO_INSTALL_INIT_SYSV+ and +LIBFOO_INSTALL_INIT_SYSTEMD+, used
+  to install init scripts either for the systemV-like init systems
+  (busybox, sysvinit, etc.) or for the systemd units. These commands
+  will be run only when the relevant init system is installed (i.e. if
+  systemd is selected as the init system in the configuration, only
+  +LIBFOO_INSTALL_INIT_SYSTEMD+ will be run).
+
 The preferred way to define these variables is:
 
 ----------------------
-- 
1.7.9.5
