From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 17 Nov 2014 21:33:50 +0100
Subject: [Buildroot] [PATCH next] python-itsdangerous: needs python zlib
	support
Message-ID: <1416256430-6492-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-itsdangerous/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-itsdangerous/Config.in b/package/python-itsdangerous/Config.in
index 6670af5..39ec0b7 100644
--- a/package/python-itsdangerous/Config.in
+++ b/package/python-itsdangerous/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_ITSDANGEROUS
 	bool "python-itsdangerous"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  Itsdangerous contains various helpers to pass data to
 	  untrusted environments and to get it back safe and sound.
-- 
1.8.3.2
