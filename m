From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:53:15 +0200
Subject: [Buildroot] [git commit] package/qt: default to approved license
Message-ID: <20170429135922.E527882629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0153e8a197e5b2cf0623b06504d533645cba086
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The only license we can act upon in Buildroot is the publicly
available license.

Qt can come under non-free licenses, but we have no access to
such licenses. The conditions to access the code under those
non-free, non-public licenses is unknown.

Besides, Qt (with Qt5) is the only package that has this choice;
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
 package/qt/Config.in | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index a761759..5f07bd2 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -100,15 +100,8 @@ config BR2_PACKAGE_QT_STATIC
 endchoice
 
 config BR2_PACKAGE_QT_LICENSE_APPROVED
-	bool "Approve free license"
-	help
-	  Select this if you approve one of the available free licenses for the
-	  Qt4 library.
-	  By doing this you will not be asked while the library is compiled.
-	  Please read and understand the license terms before approving this.
-
-	  LGPL v2.1: http://doc.trolltech.com/4.5/lgpl.html
-	  GPL  v3.0: http://doc.trolltech.com/4.5/gpl.html
+	bool
+	default y
 
 config BR2_PACKAGE_QT_CONFIG_FILE
 	string "Config file"
