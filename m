From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 23:39:59 +0200
Subject: [Buildroot] [PATCH 3/3] python-treq: add missing
	BR2_INSTALL_LIBSTDCPP dependency
In-Reply-To: <1463521199-13662-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463521199-13662-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463521199-13662-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-treq selects python-pyopenssl, which depends on C++ support, but
this dependency was not propagated to python-treq, causing the following
kconfig warning:

warning: (BR2_PACKAGE_PYTHON_TREQ) selects BR2_PACKAGE_PYTHON_PYOPENSSL which has unmet direct dependencies ((BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3) && BR2_INSTALL_LIBSTDCPP)

This commit fixes that by adding the appropriate dependency.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-treq/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index a8590a9..d560ba3 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_TREQ
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
 	help
 	  treq is an HTTP library inspired by requests but written on
 	  top of Twisted's Agents.  It provides a simple, higher level
-- 
2.7.4
