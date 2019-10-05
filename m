From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat,  5 Oct 2019 17:42:22 +0200
Subject: [Buildroot] [PATCH] package/python-tornado: only available for
 Python 3
Message-ID: <20191005154222.27923-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 6.0.1, python-tornado has dropped support for Python 2
and now needs Python >= 3.5 (cfr. setup.cfg).

Apparently this is not checked by setuptools, and apparently
byte-compile is not done in the autobuilders, so there's not autobuild
failure.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-tornado/Config.in | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
index 1afbdc5729..e1bf8343f0 100644
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_PYTHON_TORNADO
 	bool "python-tornado"
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_SINGLEDISPATCH if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_BACKPORTS_ABC	if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_CERTIFI if BR2_PACKAGE_PYTHON # runtime
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON3_SSL
 	help
 	  Tornado is a Python web framework and asynchronous networking
 	  library, originally developed at FriendFeed.
-- 
2.21.0
