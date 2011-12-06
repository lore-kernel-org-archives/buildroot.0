From: Daniel Mack <zonque@gmail.com>
Date: Tue,  6 Dec 2011 12:45:58 +0100
Subject: [Buildroot] [PATCH 2/3] libffi: enable host target
In-Reply-To: <1323171959-24873-1-git-send-email-zonque@gmail.com>
References: <1323171959-24873-1-git-send-email-zonque@gmail.com>
Message-ID: <1323171959-24873-3-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libffi is a new requirement for libglib, and as libglib has to be built
for the host as well, libffi has to follow.

Signed-off-by: Daniel Mack <zonque@gmail.com>
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
 
-- 
1.7.7.3
