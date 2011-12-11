From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 23:35:07 +0100
Subject: [Buildroot] [git commit] libffi: enable host target
Message-ID: <20111211224225.20C1F8F8FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9c35d5ceaaf32b939e90277edc8f14153e9524c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libffi is a new requirement for libglib, and as libglib has to be built
for the host as well, libffi has to follow.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libffi/libffi.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 5ada36d..e9e87ef 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -32,4 +32,5 @@ endef
 LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_MOVE_TARGET_HEADERS
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
