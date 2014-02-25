From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 25 Feb 2014 22:17:56 +0100
Subject: [Buildroot] [PATCH] vlc: add warning that it has known issues
Message-ID: <1393363076-22276-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We've seen autobuilder failures for vlc on many platforms and we don't
know how to solve them. It is also currently orphaned, i.e. there is
nobody who is actively using the package and maintaining it in
buildroot.

We could mark the package as BROKEN, but that would make it completely
invisible for the users and the autobuilders, which would not help its
orphan-ness. Therefore, instead, add a big fat warning in the config
menus that it has known issues.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/vlc/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

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
-- 
1.9.0
