From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 23:39:58 +0200
Subject: [Buildroot] [PATCH 2/3] python-service-identity: add missing
	BR2_INSTALL_LIBSTDCPP dependency
In-Reply-To: <1463521199-13662-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463521199-13662-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463521199-13662-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-service-identity selects python-pyopenssl and python-pyasn, both
of which depend on C++ support, but this dependency was not propagated
to python-service-identity causing the following kconfig warning:

warning: (BR2_PACKAGE_PYTHON_SERVICE_IDENTITY) selects BR2_PACKAGE_PYTHON_PYOPENSSL which has unmet direct dependencies ((BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3) && BR2_INSTALL_LIBSTDCPP)
warning: (BR2_PACKAGE_PYTHON_SERVICE_IDENTITY) selects BR2_PACKAGE_PYTHON_PYASN which has unmet direct dependencies ((BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3) && BR2_INSTALL_LIBSTDCPP)
warning: (BR2_PACKAGE_PYTHON_SERVICE_IDENTITY) selects BR2_PACKAGE_PYTHON_PYASN_MODULES which has unmet direct dependencies ((BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3) && BR2_INSTALL_LIBSTDCPP)

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-service-identity/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index e2200f6..ee6ca4a 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	select BR2_PACKAGE_PYTHON_PYASN # runtime
 	select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
 	help
 	  Service identity verification for pyOpenSSL.
 
-- 
2.7.4
