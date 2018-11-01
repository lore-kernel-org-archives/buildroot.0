From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:18:56 +0100
Subject: [Buildroot] [git commit] package/python-pip: needs python-setuptools
Message-ID: <20181101211656.9D35B83737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24fa13bda09977ce51948a5dab77233dbe64d38f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pip needs pkg_resources, which is installed with setuptools.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pip/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
index 4fcd55e5ab..ac741da872 100644
--- a/package/python-pip/Config.in
+++ b/package/python-pip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PIP
 	bool "python-pip"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  The PyPA recommended tool for installing Python packages.
 
