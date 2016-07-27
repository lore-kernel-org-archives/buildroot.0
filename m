From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jul 2016 09:34:14 +0200
Subject: [Buildroot] [git commit] ipkg: mark as deprecated
Message-ID: <20160727080044.67839802A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=389c2cf06de82c45f44cc9a9df05a324d78fdd4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ipkg dates back to the early 2000s when Compaq started the handhelds.org
project, it hasn't seen development since 2006, got forked as opkg a decade
ago and is starting to cause autobuilder issues, so mark it as deprecated.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipkg/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipkg/Config.in b/package/ipkg/Config.in
index 4b2078d..a987bd6 100644
--- a/package/ipkg/Config.in
+++ b/package/ipkg/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IPKG
 	bool "ipkg"
+	depends on BR2_DEPRECATED_SINCE_2016_08
 	help
 	  The Itsy Package Installer from handhelds.org
 
