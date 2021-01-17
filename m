From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 10:12:48 +0100
Subject: [Buildroot] [git commit] package/python-bleak: depend on python3
Message-ID: <20210117085352.E1AFC88087@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6103a8e1a4cc2d3d0b65a3030ba582fee5738876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-bleak doesn't support python2.

Fixes:
 - http://autobuild.buildroot.net/results/22e6139a221e64ce96e23d68a58b60074fc95473/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-bleak/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-bleak/Config.in b/package/python-bleak/Config.in
index 3266932883..6015361899 100644
--- a/package/python-bleak/Config.in
+++ b/package/python-bleak/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BLEAK
 	bool "python-bleak"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_TXDBUS # runtime
 	help
 	  Bluetooth Low Energy platform Agnostic Klient.
