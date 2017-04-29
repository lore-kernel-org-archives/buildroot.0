From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:53:16 +0200
Subject: [Buildroot] [git commit] package/qt5base: default to approved
	license
Message-ID: <20170429135922.F16198047C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce79e0b2306302f50663d587cd423ea427f6f8cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The only license we can act upon in Buildroot is the publicly
available license.

Qt can come under non-free licenses, but we have no access to
such licenses. The conditions to access the code under those
non-free, non-public licenses is unknown.

Besides, Qt5 (with Qt) is the only package that has this choice;
for other packages in a similar situation, we only use the free,
publicly-known licenses.

Finally, the name of the tarballs we download clearly hint that
they can only be used under the free license.

Drop the prompt to the accepted license, and make it mandatory;
packages will be adapted in follow-up patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/Config.in | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 337dcf2..044aa5d 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -28,16 +28,8 @@ config BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS
 	  -no-feature-style_windowsvista.
 
 config BR2_PACKAGE_QT5BASE_LICENSE_APPROVED
-	bool "Approve free license"
-	help
-	  Select this if you approve one of the available free licenses for the
-	  Qt5 library.
-	  By doing this you will not be asked while the library is compiled.
-	  Please read and understand the license terms before approving this.
-
-	  LGPL: http://doc.qt.io/qt-5/lgpl.html
-
-	  See also http://doc.qt.io/qt-5/licensing.html
+	bool
+	default y
 
 config BR2_PACKAGE_QT5BASE_CONFIG_FILE
 	string "Config file"
