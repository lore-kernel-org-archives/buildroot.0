From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 17:23:19 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/linux-tools: some
 selftests needs tput
Message-ID: <20190424152605.5ECE681000@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6f30d355cc9dfab4d8794d05ce9a87dc9ce8d6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Some kernel-selftests are using tput program, so make sure that
BR2_PACKAGE_NCURSES_TARGET_PROGS is selected.

[linux-4.19 selftests]$ git grep tput
[...]
futex/run.sh:tput setf 7 || tput setaf 7
futex/run.sh:    tput sgr0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 633e5121f851b3a89121138ec8aafdb7338ce9de)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 6aa09d14a3..22204ed090 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -83,6 +83,8 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	depends on BR2_USE_MMU  # bash
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_BASH # runtime
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PROGS # runtime (tput)
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_UTIL_LINUX
