From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Apr 2021 14:26:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-mbstrdecoder: add
 python-chardet dependency
Message-ID: <20210410122618.79085-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

chardet is a mandatory runtime dependency since version 0.8.2 and
https://github.com/thombashi/mbstrdecoder/commit/e9344a0916f65d143c51e0680c30db4ae7690ccf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-mbstrdecoder/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-mbstrdecoder/Config.in b/package/python-mbstrdecoder/Config.in
index 8982814cea..5ba3a19cc4 100644
--- a/package/python-mbstrdecoder/Config.in
+++ b/package/python-mbstrdecoder/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_MBSTRDECODER
 	bool "python-mbstrdecoder"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_CHARDET # runtime
 	help
 	  multi-byte character string decoder.
 
-- 
2.30.2
