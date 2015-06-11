From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jun 2015 22:10:07 +0200
Subject: [Buildroot] [git commit] support: gen-manual-lists.py base
	directory simplification
Message-ID: <20150611201229.A7F78817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aba6fa137a1b0df876c235e63804ef81f76c5d5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot doesn't use $srctree from what I could tell.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/gen-manual-lists.py |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index ec59030..2acac2c 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -193,11 +193,9 @@ class Buildroot:
         self.base_dir = os.environ.get("TOPDIR")
         self.output_dir = os.environ.get("O")
         self.package_dir = os.path.join(self.base_dir, self.package_dirname)
-        # The kconfiglib requires an environment variable named "srctree" to
-        # load the configuration, so set it.
-        os.environ.update({'srctree': self.base_dir})
         self.config = kconfiglib.Config(os.path.join(self.base_dir,
-                                                     self.root_config))
+                                                     self.root_config),
+                                        self.base_dir)
         self._deprecated = self.config.get_symbol(self.deprecated_symbol)
 
         self.gen_date = datetime.datetime.utcnow()
