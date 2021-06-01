From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:39:26 +0200
Subject: [Buildroot] [git commit branch/next] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
Message-ID: <20210601201200.AA1B7838F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a8c50fe05afacc3cbe8e7347e238da9f242fab0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The 'assert' statement in glibc honors the 'NDEBUG' preprocessor macro: if
it is set, then the assert statement is compiled away.

Define this 'NDEBUG' macro when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
default case).

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Makefile.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 86db62ba5b..955e6a8e8c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -148,6 +148,9 @@ endif
 ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING = -g3
 endif
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
+TARGET_DEBUGGING += -DNDEBUG
+endif
 
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
