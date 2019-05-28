From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 22:34:12 +0200
Subject: [Buildroot] [PATCH v2 2/6] support/gnuconfig: update
 README.buildroot with reality
In-Reply-To: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
References: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190528203416.32261-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

4 out of 5 packages who are not using autotools but needed their
gnuconfig files updated were not complying with the recommandation in
support/gnuconfig/README.buildroot. The fifth package was converted to
be like the others: use UPDATE_CONFIG_HOOK as a <pkg>_POST_PATCH_HOOKS
rather than calling the CONFIG_UPDATE macro directly.

Now that all packages are consistent, update the README.buildroot file
to match the reality.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/gnuconfig/README.buildroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/gnuconfig/README.buildroot b/support/gnuconfig/README.buildroot
index a71ed93010..7ba2a332a4 100644
--- a/support/gnuconfig/README.buildroot
+++ b/support/gnuconfig/README.buildroot
@@ -10,7 +10,7 @@ If for some reason your package does not use the autotools-package
 infrastructure, you can request the config.guess and/or config.sub
 files of your package to be updated by using:
 
-      $(call CONFIG_UPDATE,directory-of-your-package-sources)
+<pkg>_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 --- UPDATE ---
 GNU config is now managed in git, so to update:
-- 
2.21.0
