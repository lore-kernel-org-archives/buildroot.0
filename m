From: julien.viarddegalbert at openwide.fr <julien.viarddegalbert@openwide.fr>
Date: Sun, 17 May 2015 13:38:31 +0200
Subject: [Buildroot] [PATCH] Document the 72 char limit on package
	description.
Message-ID: <1431862711-1100-1-git-send-email-julien.viarddegalbert@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Viard de Galbert <julien@vdg.name>

While describing a package I though that the tab and 2 spaces was
already doing the margin for wrapping the help test (ie 70 char when
wrapping to 80) but apparently the full text need to fit 72 columns.

So this patch propose to document that fact in the two places where
the Config.in format is described.

Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
---
 docs/manual/adding-packages-directory.txt | 5 +++--
 docs/manual/writing-rules.txt             | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 3d0982f..8f585d4 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -35,8 +35,9 @@ config BR2_PACKAGE_LIBFOO
 
 The +bool+ line, +help+ line and other metadata information about the
 configuration option must be indented with one tab. The help text
-itself should be indented with one tab and two spaces, and it must
-mention the upstream URL of the project.
+itself should be indented with one tab and two spaces, lines should
+not be longer than 72 columns, and it must mention the upstream URL
+of the project.
 
 You can add other sub-options into a +if
 BR2_PACKAGE_LIBFOO...endif+ statement to configure particular things
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index e6401a4..ec1ddb1 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -40,6 +40,8 @@ config BR2_PACKAGE_LIBFOO
 * The help text itself should be indented with one tab and two
   spaces.
 
+* The help text should be wrapped to fit 72 columns.
+
 The +Config.in+ files are the input for the configuration tool
 used in Buildroot, which is the regular _Kconfig_. For further
 details about the _Kconfig_ language, refer to
-- 
2.1.4
