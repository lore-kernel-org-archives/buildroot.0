From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 23:12:17 +0200
Subject: [Buildroot] [git commit branch/next] doc: Update the documentation
	to mention the new PKG_INSTALL_INIT_ variables
Message-ID: <20120802195303.542D1827F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e61153cf972e1f060bc0905df61381a9548cb16e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
