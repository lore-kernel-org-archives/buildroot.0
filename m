From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 18:34:54 +0200
Subject: [Buildroot] [git commit] package/systemd: disable audit for host
 package
Message-ID: <20200829164016.835C986F37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6466ec41415ae37754d6adbf5ddc8b97a2bf3fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable audit for host package to avoid getting the following error if
it is found on host:

[84/662] Generating audit_type-list.txt with a meson_exe.py custom command
In file included from <command-line>:32:
./../src/basic/missing_audit.h:7:10: fatal error: libaudit.h: No such file or directory
    7 | #include <libaudit.h>
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/67782c225c08387c1bbcbea9eee3ca12bc6577cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 115ccbda06..81fa2bd0f0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -700,7 +700,8 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dxdg-autostart=false \
 	-Dkernel-install=false \
 	-Dsystemd-analyze=false \
-	-Dlibcryptsetup=false
+	-Dlibcryptsetup=false \
+	-Daudit=false
 
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
