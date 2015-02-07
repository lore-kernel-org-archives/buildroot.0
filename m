From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 19:03:56 +0100
Subject: [Buildroot] [git commit] util-linux: target command more needs
	ncurses
Message-ID: <20150207180626.13EC78046A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=636bf6bd687095007485b3c1abe5303e8150b3aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

configure: error: more selected, but required ncurses, tinfo or termcap
libraries not available

[1] http://autobuild.buildroot.net/results/f3b/f3b318c904b6325fd143a55f2f9fd1c55bb9cfd5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 78648c1..55c10f2 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -160,6 +160,7 @@ comment "nsenter needs a toolchain w/ headers >= 3.0"
 
 config BR2_PACKAGE_UTIL_LINUX_MORE
 	bool "more"
+	select BR2_PACKAGE_NCURSES
 	help
 	  File perusal filter for crt viewing
 
