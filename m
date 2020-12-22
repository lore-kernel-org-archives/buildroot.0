From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:42:14 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/go: enable ARMv7
 optimizations for 32-bit ARMv8
Message-ID: <20201222102559.6F89888179@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=132d89cb95fd7b07c4faa9f5eac977f217df2eba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

When building for an ARMv8 in 32-bit, Go does not yet support ARMv8
optimizations (see issue: https://github.com/golang/go/issues/29373)
but can still benefit from ARMv7 optimizations.

Signed-off-by: Michael Baudino <michael@baudi.no>
[yann.morin.1998 at free.fr:
  - move the comment to its own line, expand and reword it a bit
  - reword the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c59409afd93b2a9bda9d5c3d6b765eaa4c1720dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index cabbdc84b7..f2d10f5dad 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -39,6 +39,10 @@ else ifeq ($(BR2_ARM_CPU_ARMV6),y)
 GO_GOARM = 6
 else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 GO_GOARM = 7
+else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+# Go doesn't support 32-bit GOARM=8 (https://github.com/golang/go/issues/29373)
+# but can still benefit from amrv7 optimisations
+GO_GOARM = 7
 endif
 else ifeq ($(BR2_aarch64),y)
 GO_GOARCH = arm64
