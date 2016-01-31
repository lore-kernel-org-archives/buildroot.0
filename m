From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 10:28:49 +0100
Subject: [Buildroot] [git commit] package/net-tools: bump version to fix
	musl build
Message-ID: <20160201224705.B80167F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9301e192019849f7f2fb91ab0baf2a89a533aa38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

git head includes this commit
http://sourceforge.net/p/net-tools/code/ci/c35607eae8243851dd80a0181554f3a0e9e50aa8/

Due to the gettext problems the package-specific build errors were not
yet found by the autobuilders:

slattach.c:85:11: error: ???B50??? undeclared here (not in a function)
   { "50", B50 }, { "75", B75   },
(and many more)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/net-tools/net-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index ab0dd7c..184c50e 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NET_TOOLS_VERSION = 3eb367aedf1280f35105ede465c350a39b55fa91
+NET_TOOLS_VERSION = 3f170bff115303e92319791cbd56371e33dcbf6d
 NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
 NET_TOOLS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 NET_TOOLS_LDFLAGS = $(TARGET_LDFLAGS) \
