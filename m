From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jan 2014 23:19:26 +0100
Subject: [Buildroot] [git commit] libfcgi: needs mmu
Message-ID: <20140115222249.E30EE9C4D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=613c30c85e05de06f97fa860c1bba1d49a00653f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/93a/93a7f816b5c70a247491063ca733b537ee7aec65/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfcgi/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libfcgi/Config.in b/package/libfcgi/Config.in
index a622ec3..47ff8a2 100644
--- a/package/libfcgi/Config.in
+++ b/package/libfcgi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBFCGI
 	bool "libfcgi"
+	depends on BR2_USE_MMU # fork()
 	help
 	  FCGI, a fastcgi developer library for C/C++
 
