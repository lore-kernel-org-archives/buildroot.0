From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 23:27:01 +0200
Subject: [Buildroot] [git commit] autofs: depend on host-nfs-utils
Message-ID: <20180527213342.91691812F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dec494f9f58111ee1cd69048114b56f10a159272
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-nfs-utils provides the host rpcgen utility. This fixes the build on
recent Fedora systems that removed rpcgen from the glibc package.

Fixes:
http://autobuild.buildroot.net/results/383/383bc8462f32a226645c9b792b8d65a25d74529d/
http://autobuild.buildroot.net/results/0c0/0c00f72512754b721813e13f0828d3a942f7b955/
http://autobuild.buildroot.net/results/50b/50b66d2a3c8264f618d7aa813b10050ed147209f/

Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autofs/autofs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 87a218441e..e7c65ef4b0 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -9,7 +9,7 @@ AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
-AUTOFS_DEPENDENCIES = host-flex host-bison host-pkgconf
+AUTOFS_DEPENDENCIES = host-flex host-bison host-pkgconf host-nfs-utils
 
 # autofs looks on the build machine for the path of modprobe, so tell
 # it explicitly where it will be located on the target.
