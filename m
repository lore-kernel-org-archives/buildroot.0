From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:12:05 +0100
Subject: [Buildroot] [git commit] manual: add some info on the POST_RSYNC
	hook
Message-ID: <20131110231541.AD7669BB0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fcdbeba035796c019348a7ac4ffdd32825ad4669
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-hooks.txt |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
index 8ab3f56..d96c991 100644
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -39,3 +39,23 @@ endef
 
 LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
 ----------------------
+
+Using the +POST_RSYNC+ hook
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+The +POST_RSYNC+ hook is run only for packages that use a local source,
+either through the +local+ site method or the +OVERRIDE_SRCDIR+
+mechanism. In this case, package sources are copied using +rsync+ from
+the local location into the buildroot build directory. The +rsync+
+command does not copy all files from the source directory, though.
+Files belonging to a version control system, like the directories
++.git+, +.hg+, etc. are not copied. For most packages this is
+sufficient, but a given package can perform additional actions using
+the +POST_RSYNC+ hook.
+
+In principle, the hook can contain any command you want. One specific
+use case, though, is the intentional copying of the version control
+directory using +rsync+. The +rsync+ command you use in the hook can, among
+others, use the following variables:
+
+* +$(SRCDIR)+: the path to the overridden source directory
+* +$(@D)+: the path to the build directory
