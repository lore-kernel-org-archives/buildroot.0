From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 11:16:23 +0100
Subject: [Buildroot] [git commit] package: fixup after pthred-stubs rename
Message-ID: <20130106101746.509719A5E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=698cd0a0f401b55553766b6effe5dcc2895d4e3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5bd41d165 (pthread-stubs: rename to xlib_libpthread-stubs) renamed
the pthread-stubs package but forgot to update the select statements.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libdrm/Config.in       |    2 +-
 package/x11r7/libxcb/Config.in |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index f3dab9a..f1c3358 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XPROTO_DRI2PROTO
-	select BR2_PACKAGE_PTHREAD_STUBS
+	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
 	# libatomic_ops is only available on a subset of the supported
 	# architectures, and we make the assumption that the intel
 	# driver can only be used on x86 and x86_64 machines.
diff --git a/package/x11r7/libxcb/Config.in b/package/x11r7/libxcb/Config.in
index 9554529..1e1afb4 100644
--- a/package/x11r7/libxcb/Config.in
+++ b/package/x11r7/libxcb/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBXCB
 	bool "libxcb"
-	select BR2_PACKAGE_PTHREAD_STUBS
+	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
 	select BR2_PACKAGE_XCB_PROTO
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXAU
