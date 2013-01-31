From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 Jan 2013 13:46:16 +0100
Subject: [Buildroot] [git commit] ebtables: needs MMU
Message-ID: <20130131131401.E74FF9A8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22f4d99273d6f173b996eaeb80426442efe31b1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/201f8d3d58cdff0c3501a673003558103237fb22/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ebtables/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 40bc45c..ce67285 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_EBTABLES
 	bool "ebtables"
 	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	help
 	  Ethernet bridge frame table administration
 
