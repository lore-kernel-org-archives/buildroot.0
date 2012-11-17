From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:31:09 +0100
Subject: [Buildroot] [git commit] python: uses fork(),
	only available on MMU platforms
Message-ID: <20121117083205.A0E9F9A06E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bf219a900d3070e8e954617131f54210825419f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/1738a8b09b04d2b2fc1de6d1ff5eb0363fed6348/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index 11aa267..4089cce 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON
 	bool "python"
 	depends on BR2_USE_WCHAR
+	# uses fork()
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
