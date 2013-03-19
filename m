From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 17:06:53 +0100
Subject: [Buildroot] [git commit] iproute2: needs mmu
Message-ID: <20130319160723.2DE419B030@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aff304d535b9fd622f7c71679087553562594e8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/08beca1cae9dc55b2f770a01ad95bcbe56594300/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/Config.in |    1 +
 package/openswan/Config.in |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index b6ee86e..4da0d2b 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Kernel routing and traffic control utilities.  Provides things
 	  like ip and tc.
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 3336156..932a75f 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
+	depends on BR2_USE_MMU # iproute2
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
 	help
