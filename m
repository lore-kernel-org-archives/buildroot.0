From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2014 22:45:50 +0100
Subject: [Buildroot] [git commit] vlc: add warning that it has known issues
Message-ID: <20140225220240.219859BA86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e33019aaa0409e35b725dddffe09e3e2a42959d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We've seen autobuilder failures for vlc on many platforms and we don't
know how to solve them. It is also currently orphaned, i.e. there is
nobody who is actively using the package and maintaining it in
buildroot.

We could mark the package as BROKEN, but that would make it completely
invisible for the users and the autobuilders, which would not help its
orphan-ness. Therefore, instead, add a big fat warning in the config
menus that it has known issues.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 2335894..9c9d028 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -1,3 +1,8 @@
+if BR2_PACKAGE_VLC
+comment "vlc is known not to work in all configurations"
+comment "If you can fix it, please inform buildroot at buildroot.net"
+endif
+
 config BR2_PACKAGE_VLC
 	bool "vlc"
 	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) # spawn.h
