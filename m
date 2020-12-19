From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2020 12:17:12 +0100
Subject: [Buildroot] [git commit] package/go: enable ARMv7 optimizations for
 32-bit ARMv8
Message-ID: <20201219110110.CE5E281E14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c59409afd93b2a9bda9d5c3d6b765eaa4c1720dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building for an ARMv8 in 32-bit, Go does not yet support ARMv8
optimizations (see issue: https://github.com/golang/go/issues/29373)
but can still benefit from ARMv7 optimizations.

Signed-off-by: Michael Baudino <michael@baudi.no>
[yann.morin.1998 at free.fr:
  - move the comment to its own line, expand and reword it a bit
  - reword the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
