From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 10 Jun 2015 15:05:10 +0200
Subject: [Buildroot] [PATCH 2/3] support: gen-manual-lists.py base directory
	simplification
In-Reply-To: <1433941511-15596-1-git-send-email-ulfalizer@gmail.com>
References: <1433941511-15596-1-git-send-email-ulfalizer@gmail.com>
Message-ID: <1433941511-15596-2-git-send-email-ulfalizer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot doesn't use $srctree from what I could tell.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 support/scripts/gen-manual-lists.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

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
-- 
2.1.4
