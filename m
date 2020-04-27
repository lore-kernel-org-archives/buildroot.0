From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:41:43 +0200
Subject: [Buildroot] [git commit] package/python-pycairo: depend on python3
Message-ID: <20200427192701.51EC5908F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3be1f6c326637374e9baf8d4ab2de206f09c9259
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 1.19.0 pycairo doesn't support Python 2 anymore.

Fixes:
 - http://autobuild.buildroot.net/results/4d47c71f75a61810c5f58a720245bef38b3f3db0

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycairo/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pycairo/Config.in b/package/python-pycairo/Config.in
index 0d8de977e1..a44a0421e6 100644
--- a/package/python-pycairo/Config.in
+++ b/package/python-pycairo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYCAIRO
 	bool "python-pycairo"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_CAIRO
 	help
 	  Python interface for cairo.
