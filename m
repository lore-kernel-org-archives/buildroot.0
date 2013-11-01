From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 01 Nov 2013 17:06:49 +0100
Subject: [Buildroot] [PATCH 4 of 4] manual: add some info on the POST_RSYNC
	hook
In-Reply-To: <patchbomb.1383322005@argentina>
References: <patchbomb.1383322005@argentina>
Message-ID: <a8fed19fc23c14b57125.1383322009@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-hooks.txt |  19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -39,3 +39,22 @@ endef
 
 LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
 ----------------------
+
+Using the +POST_RSYNC+ hook
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+The +POST_RSYNC+ hook is run only for packages that have a local source
+override, using the +OVERRIDE_SRCDIR+ mechanism. In that case, the
+package sources are copied using +rsync+ from a local location into the
+buildroot build directory. The +rsync+ command does not copy all files
+from the source directory, though. Files belonging to a version control
+system, like the directories +.git+, +.hg+, etc. are not copied. For
+most packages this is sufficient, but a given package can perform
+additional actions using the +POST_RSYNC+ hook.
+
+In principle, the hook can contain any command you want. One specific
+use case, though, is the intentional copying of the version control
+directory using +rsync+. The +rsync+ command you use in the hook can, among
+others, use the following variables:
+
+* +$(SRCDIR)+: the path to the overridden source directory
+* +$(@D)+: the path to the build directory
