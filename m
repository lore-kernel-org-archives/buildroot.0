From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 21:25:09 +0100
Subject: [Buildroot] [git commit] python3: uses fork(),
	only available on MMU platforms
Message-ID: <20130112202459.74B43997F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=229824f475229e1aa0677113a40fd5c4e2a0fd18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python3/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 2e1e98b..5959d31 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON3
 	bool "python3"
 	depends on BR2_USE_WCHAR
+	# uses fork()
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
