From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Oct 2018 21:48:08 +0200
Subject: [Buildroot] [git commit] python-crossbar: drop Python 2 support
Message-ID: <20181017194642.5BEE0839F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1eb32c2d0811c7517017ca2f8506cf77562e02eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream is now Python 3 only.

Quoting the maintainer [1]: "the last version of crossbar with python 2
support: pip install crossbar==18.4.1".

[1] https://github.com/crossbario/crossbar/issues/1332

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Mauro Condarelli <mc5686@mclink.it>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crossbar/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 2f9de6e0b5..526d9871be 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
 	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
+	depends on BR2_PACKAGE_PYTHON3
 	# All the following dependencies are runtime dependencies
 	select BR2_PACKAGE_PYTHON_ATTRS
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
@@ -48,3 +49,4 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 
 comment "python-crossbar needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_PYTHON3
