From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Sep 2014 23:39:00 +0200
Subject: [Buildroot] [PATCH 5/6] python-pyasn: requires the zlib Python
	module
In-Reply-To: <1412113141-17650-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412113141-17650-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1412113141-17650-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python-pyasn module requires the zlib Python module (part of the
Python standard installation, but optional in Buildroot), otherwise it
fails to load at runtime.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyasn/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
index eca53db..efdbbc5 100644
--- a/package/python-pyasn/Config.in
+++ b/package/python-pyasn/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_PYTHON_PYASN
 	bool "python-pyasn"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
 	help
 	  PyASN is a Python extension module that enables you to
 	  perform very fast IP address to Autonomous System Number
-- 
2.0.0
