From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 12:04:02 +0200
Subject: [Buildroot] [git commit] qt: don't install translation files by
	default
Message-ID: <20140815100618.A6F339D1C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=533b17a65f7ecd80e1349cdee1a080cfe252ad07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 93917b6980f7f2b51302e1a3fa451b07cf7d674e (2013.11) introduced
the installation of the binary .qm translation files, unconditionally.

However, the installed size is very large for some embedded systems
(about 8 MB), and they are not needed in many cases.

In order to avoid such a waste of storage space, commit
2ff329412f490dc916bab3377073ef5950a46298 (2014.08) made this
installation an option that could be disabled. For backward
compatibility, the option default was set to yes.

Given the size of these files, and that they had never been installed
by Buildroot versions before 2013.11, change the default to not
installing them.

Interested users can still activate it as needed.

Also update and improve the help text.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Danomi Manchego <danomimanchego123@gmail.com>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 93751cd..da159b4 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -30,10 +30,10 @@ config BR2_PACKAGE_QT_DEMOS
 
 config BR2_PACKAGE_QT_TRANSLATION_FILES
 	bool "Install translation files"
-	default y
 	help
 	  Install binary .qm translation files.
-	  If unsure, say y.
+	  Say y if you need these files. They will take about 8 MB
+	  on the target root filesystem.
 
 config BR2_PACKAGE_QT_EXAMPLES
 	bool "Compile and install Qt examples (with code)"
