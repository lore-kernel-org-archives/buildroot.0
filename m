From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  5 Dec 2019 14:15:14 -0800
Subject: [Buildroot] [PATCH 3/4] package/python-twisted: add config for
 HTTP2 support
In-Reply-To: <20191205221515.3121562-1-aduskett@gmail.com>
References: <20191205221515.3121562-1-aduskett@gmail.com>
Message-ID: <20191205221515.3121562-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Add an option that selects all of the necessary python packages to ensure that
twisted has HTTP2 support.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-twisted/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index f3d94c544e..767e690e5f 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -15,6 +15,11 @@ config BR2_PACKAGE_PYTHON_TWISTED
 
 if BR2_PACKAGE_PYTHON_TWISTED
 
+config BR2_PACKAGE_PYTHON_TWISTED_HTTP2
+	bool "HTTP2 support"
+	select BR2_PACKAGE_PYTHON_PRIORITY # runtime
+	select BR2_PACKAGE_PYTHON_H2 # runtime
+
 config BR2_PACKAGE_PYTHON_TWISTED_TLS
 	bool "TLS support"
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-cryptography
-- 
2.23.0
