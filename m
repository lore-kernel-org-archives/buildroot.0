From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:30:50 +0200
Subject: [Buildroot] [PATCH 02/29] package/qt5base: default to approved
	license
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <4113908a2a9404f2e2f3c4aba1ca7977e9dd116c.1492979449.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/qt5/qt5base/Config.in | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 337dcf2454..044aa5d545 100644
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
-- 
2.11.0
