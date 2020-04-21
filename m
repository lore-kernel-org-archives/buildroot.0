From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 23:06:14 +0200
Subject: [Buildroot] [git commit] package/python-markdown: fix Python
 version dependency
Message-ID: <20200421205302.401F38FB73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e5723ee589e8d205883c15ca863c01f94b8854f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit
https://github.com/Python-Markdown/markdown/commit/dab931f597cdc5b57d4e2458840fb991606506bc,
merged since version 3.2 of python-markdown, the Python 2.x support
has been dropped.

So our commit 6e538bf642d3584032d63bb54d24b88ab57e4283
("package/python-markdown: bump to version 3.2.1") should have made
python-markdown available only for Python 3.x.

Fixes:
http://autobuild.buildroot.net/results/6d1e796f6658accb3eafef265935db5e464638fe

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-markdown/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-markdown/Config.in b/package/python-markdown/Config.in
index 6706684142..454c2729bd 100644
--- a/package/python-markdown/Config.in
+++ b/package/python-markdown/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_MARKDOWN
 	bool "python-markdown"
+	depends on BR2_PACKAGE_PYTHON3
 	# runtime dependency on Python's xml module
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
 	help
 	  This is a Python implementation of John Gruber's Markdown
 
