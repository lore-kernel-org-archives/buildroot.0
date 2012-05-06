From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 20:08:49 +0200
Subject: [Buildroot] [git commit] openntpd: needs MMU
Message-ID: <20120506180941.83ADD8F738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddc3aade64bd5f9fc8cf0a02c5f429b805b40954
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openntpd/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 32d0d8b..4dd9a29 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_OPENNTPD
 	bool "openntpd"
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  OpenNTPD is an easy to use implementation of the Network Time
 	  Protocol. It provides the ability to sync the local clock
