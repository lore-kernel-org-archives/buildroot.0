From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 16:03:12 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/python-mbstrdecoder: add python-chardet dependency
Message-ID: <20210426141045.E301481327@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0007797471f6c47ecd9ea908696f37e9e6321419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

chardet is a mandatory runtime dependency since version 0.8.2 and
https://github.com/thombashi/mbstrdecoder/commit/e9344a0916f65d143c51e0680c30db4ae7690ccf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8a74eaaaa992b65fd4c03042a859c500123a57a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
