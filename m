From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 07:18:45 +0100
Subject: [Buildroot] [git commit] python-itsdangerous: needs python zlib
	support
Message-ID: <20141201104835.C7EA97FFFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=026954ca44593f717c97fe832b39d2bd867496ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-itsdangerous/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
