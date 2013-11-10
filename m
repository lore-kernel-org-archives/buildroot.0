From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 12:34:52 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: select BR2_LEGACY for
	module-init-tools legacy option
Message-ID: <20131110113512.522719BB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f401f914669b2d697f6efcfc0d2888a4c118f4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 94c72087f3 ("module-init-tools: remove package") removed the
module-init-tools package and therefore added the corresponding config
option in Config.in.legacy. However, the commit forgot to add the
"select BR2_LEGACY" that ensures the build cannot proceed until the
user has acknowledged the change (i.e kmod replacing
module-init-tools).

This commit adds this missing "select BR2_LEGACY".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d02f0a6..587afe1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -123,6 +123,7 @@ config BR2_PACKAGE_MODULE_INIT_TOOLS
 	bool "module-init-tools replaced by kmod"
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_KMOD_TOOLS
+	select BR2_LEGACY
 	help
 	  The 'module-init-tools' package has been removed, since it
 	  has been depracated upstream and replaced by 'kmod'.
