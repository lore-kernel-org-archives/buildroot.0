From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:15:50 +0100
Subject: [Buildroot] [git commit] qt5tools: qtdiag needs
	BR2_PACKAGE_QT5BASE_GUI
Message-ID: <20160308201554.A2DFF81908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eddc0bc5a6e8de77173c1d1d1009982acd99c031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  /usr/bin/make -j4 -C /home/buildroot/autobuild/run/instance-3/output/build/qt5tools-5.5.1/src/qtdiag
  make[2]: *** No targets specified and no makefile found.  Stop.

[1] http://autobuild.buildroot.net/results/4ee/4eee2a7cee8fce63b0419668da8bd55b3cfd00af

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
index 9e939f2..453913b 100644
--- a/package/qt5/qt5tools/Config.in
+++ b/package/qt5/qt5tools/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_QT5TOOLS_PIXELTOOL
 
 config BR2_PACKAGE_QT5TOOLS_QTDIAG
 	bool "qtdiag"
+	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Compile and install the qtdiag program.
 
