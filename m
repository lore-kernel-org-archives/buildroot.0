From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 16 Oct 2018 20:44:57 -0300
Subject: [Buildroot] [PATCH 1/1] python-crossbar: drop Python 2 support
Message-ID: <20181016234457.6786-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream is now Python 3 only.

Quoting the maintainer [1]: "the last version of crossbar with python 2
support: pip install crossbar==18.4.1".

[1] https://github.com/crossbario/crossbar/issues/1332

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Mauro Condarelli <mc5686@mclink.it>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
NOTES:

This is only for master branch. Other branches are not affected.

There are newer releases available via pip2 but they are broken in
runtime. Some people complained about this on [1].

Based on "f4972e2e8c python-django: bump to version 2.1.2" I assume we
don't need any legacy handling for this case.

I followed the convention from the manual:
4. Any dependencies on the toolchain in depends on form
5. Any dependencies on other packages in depends on form
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
-- 
2.17.1
