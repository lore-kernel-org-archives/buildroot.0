From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 30 Mar 2013 20:47:34 +0100
Subject: [Buildroot] [git commit] socat: needs threads
Message-ID: <20130330194755.D5D459B3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=294ac7ef0af50fb38492eaf1800772ac8411fee8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/d2231d0db9cebfa77739a229513035ed6814f34c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/socat/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/socat/Config.in b/package/socat/Config.in
index ae88be9..c478282 100644
--- a/package/socat/Config.in
+++ b/package/socat/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_SOCAT
 	bool "socat"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Multipurpose socket relay program.
 
 	  http://www.dest-unreach.org/socat/
+
+comment "socat requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
