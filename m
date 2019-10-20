From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 20 Oct 2019 18:11:26 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-secretstorage: drop Python 2
 support
In-Reply-To: <20191020151126.2468-1-asafka7@gmail.com>
References: <20191020151126.2468-1-asafka7@gmail.com>
Message-ID: <20191020151126.2468-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 3.0.0, secretstorage doesn't support Python 2 anymore.
Update its reverese dependency (python-keyring) as well.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-keyring/Config.in       | 1 +
 package/python-secretstorage/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index 23d86a4822..3961ee8b81 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_KEYRING
 	bool "python-keyring"
+	depends BR2_PACKAGE_PYTHON3 # python-secretstorage
 	depends on BR2_INSTALL_LIBSTDCPP # python-secretstorage
 	select BR2_PACKAGE_PYTHON_SECRETSTORAGE # runtime
 	help
diff --git a/package/python-secretstorage/Config.in b/package/python-secretstorage/Config.in
index 87aaf6a728..78a0a2ae15 100644
--- a/package/python-secretstorage/Config.in
+++ b/package/python-secretstorage/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SECRETSTORAGE
 	bool "python-secretstorage"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	help
-- 
2.20.1
