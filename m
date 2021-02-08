From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 22:10:41 +0100
Subject: [Buildroot] [git commit] package/python: clarify that this refers
 to the deprecated 2.7 series
Message-ID: <20210208205603.5BAFB8183D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c699ad14744423011793a62d9401da4a48ce7c0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python 2.7 is EOL, so people should use the python3 package instead if
possible.  Make it a bit more obvious that 'python' is not the right package
to use by explicitly mentioning that this is about python 2.7 and that it is
deprecated.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index bded00c9e8..ab6950cae8 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -3,7 +3,7 @@ comment "python needs a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_PYTHON
-	bool "python"
+	bool "python2.7 (deprecated)"
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
