From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:35:05 +0200
Subject: [Buildroot] [git commit] lighttpd: needs mmu
Message-ID: <20131009203637.F41B49A45E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88a3f722b1ae17434c283144ad67caeb6e46af72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index cb759ff..b84e6ea 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIGHTTPD
 	bool "lighttpd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  lighttpd a secure, fast, compliant and very flexible web-server
 	  which has been optimized for high-performance environments. It
