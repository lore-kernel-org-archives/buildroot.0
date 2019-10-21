From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 20:32:59 +0200
Subject: [Buildroot] [git commit] package/python-asgiref: drop Python 2
 support
Message-ID: <20191021182728.1B81C8378E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b746f81e77bdcbba7db8c9313a9f8a452eaf4c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Asgiref doesn't support Python 2 since version 2.0.0.
All the recursive reverse dependencies already support Python 3 only.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asgiref/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-asgiref/Config.in b/package/python-asgiref/Config.in
index d0b816c369..71069bf48b 100644
--- a/package/python-asgiref/Config.in
+++ b/package/python-asgiref/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_PYTHON_ASGIREF
+	depends on BR2_PACKAGE_PYTHON3
 	bool "python-asgiref"
 	help
 	  ASGI is a standard for Python asynchronous web apps and
