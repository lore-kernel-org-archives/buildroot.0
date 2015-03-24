From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Mar 2015 14:46:11 +0200
Subject: [Buildroot] [PATCH] dhcpcd: fix wrong macro name
Message-ID: <68989afc433713e1841d679f3d47ed235bebfe93.1427201171.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/788/788e7103c7c7c0199f221f42be6c22cc9eac3e0b/
http://autobuild.buildroot.net/results/673/673d4a0a334c4694cc4dd05ef99069f681f98f0a/
http://autobuild.buildroot.net/results/4bb/4bbf9e785eb9cb0f916f0a2bdaf7a6a5f639f7ea/

and many more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dhcpcd/0001-fix-linux-macro-name.patch | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/dhcpcd/0001-fix-linux-macro-name.patch

diff --git a/package/dhcpcd/0001-fix-linux-macro-name.patch b/package/dhcpcd/0001-fix-linux-macro-name.patch
new file mode 100644
index 000000000000..18dbb10dfda2
--- /dev/null
+++ b/package/dhcpcd/0001-fix-linux-macro-name.patch
@@ -0,0 +1,25 @@
+Fix Linux define
+
+Fetched from upstream:
+http://roy.marples.name/projects/dhcpcd/ci/2cabc3efee4c18ca?sbs=0
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+Index: dhcpcd.h
+==================================================================
+--- /dhcpcd.h
++++ /dhcpcd.h
+@@ -58,11 +58,11 @@
+ 
+ struct interface {
+ 	struct dhcpcd_ctx *ctx;
+ 	TAILQ_ENTRY(interface) next;
+ 	char name[IF_NAMESIZE];
+-#ifdef __linux
++#ifdef __linux__
+ 	char alias[IF_NAMESIZE];
+ #endif
+ 	unsigned int index;
+ 	unsigned int flags;
+ 	sa_family_t family;
+
-- 
2.1.4
