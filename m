From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:19:44 +0200
Subject: [Buildroot] [git commit] package/selinux-python: use ordinary
 config instead of menuconfig
Message-ID: <20191010201354.C242C8C700@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0dc558ff0b0facf16e98920efcdbfe83433889c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

selinux-python only has two sub-options, so menuconfig is overkill.
Convert it to a normal config with indented sub-option.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/selinux-python/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 00ca6b9c38..5b6cbc80e3 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -1,4 +1,4 @@
-menuconfig BR2_PACKAGE_SELINUX_PYTHON
+config BR2_PACKAGE_SELINUX_PYTHON
 	bool "selinux-python"
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
