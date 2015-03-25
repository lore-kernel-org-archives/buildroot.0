From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 19:29:49 +0100
Subject: [Buildroot] [git commit] dhcpcd: fix wrong macro name
Message-ID: <20150325182959.1BD28818A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5c4cb6db4dec7b31e9d180b5740a03f901914ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/788/788e7103c7c7c0199f221f42be6c22cc9eac3e0b/
http://autobuild.buildroot.net/results/673/673d4a0a334c4694cc4dd05ef99069f681f98f0a/
http://autobuild.buildroot.net/results/4bb/4bbf9e785eb9cb0f916f0a2bdaf7a6a5f639f7ea/

and many more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcpcd/0001-fix-linux-macro-name.patch |   25 ++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/dhcpcd/0001-fix-linux-macro-name.patch b/package/dhcpcd/0001-fix-linux-macro-name.patch
new file mode 100644
index 0000000..18dbb10
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
