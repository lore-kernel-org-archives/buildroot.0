From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 18:58:06 +0200
Subject: [Buildroot] [git commit] apr: add missing comment about needed
	dynamic library support
Message-ID: <20140419165840.9DA8B9C8E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57a283acba3664858b303902ae325ebbd7706a86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Davide Viti <d.viti@infosolution.it>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/apr/Config.in b/package/apr/Config.in
index e06d254..fcfffec 100644
--- a/package/apr/Config.in
+++ b/package/apr/Config.in
@@ -9,3 +9,7 @@ config BR2_PACKAGE_APR
 	  consistent interface to underlying platform-specific implementations
 
 	  http://apr.apache.org/
+
+comment "apr needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PREFER_STATIC_LIB
