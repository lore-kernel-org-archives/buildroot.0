From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Apr 2012 09:26:13 +0200
Subject: [Buildroot] [git commit] uClibc: 0.9.33.1: fix version (soname)
	number
Message-ID: <20120423081143.CB12296B9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f00424cff00bdabd54350eb82deb908676e86a1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, the version number in the 0.9.33.1 tarball is wrong.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-0.9.33.1-version.patch |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.33.1-version.patch b/toolchain/uClibc/uClibc-0.9.33.1-version.patch
new file mode 100644
index 0000000..37f8565
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.33.1-version.patch
@@ -0,0 +1,23 @@
+[PATCH] fix version number
+
+Somehow the 0.9.33.1 tarball thinks it is 0.9.33.2-git, as pointed out
+by Mike Frysinger.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ Rules.mak |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: uClibc-0.9.33.1/Rules.mak
+===================================================================
+--- uClibc-0.9.33.1.orig/Rules.mak
++++ uClibc-0.9.33.1/Rules.mak
+@@ -105,7 +105,7 @@
+ MAJOR_VERSION := 0
+ MINOR_VERSION := 9
+ SUBLEVEL      := 33
+-EXTRAVERSION  :=.2-git
++EXTRAVERSION  :=.1
+ VERSION       := $(MAJOR_VERSION).$(MINOR_VERSION).$(SUBLEVEL)
+ ABI_VERSION   := $(MAJOR_VERSION)
+ ifneq ($(EXTRAVERSION),)
