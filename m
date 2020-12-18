From: Michael Baudino <michael@baudi.no>
Date: Fri, 18 Dec 2020 10:00:23 +0000
Subject: [Buildroot] [PATCH] package/go: enable ARMv7 optimizations for
 ARMv8 target
Message-ID: <X3HdjcFKH15Mqu_8q7IQiKQqLChMVl-uUSRXfHc1VvjSCI24ZVvsEOGrvR913T_RgeGoFMNBUla3_y_4H6syUMNdPpubATsMeeRqP4fHSkY=@baudi.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Go doesn't support ARMv8 optimizations yet (see this GitHub
issue: https://github.com/golang/go/issues/29373) but can still
benefit from ARMv7 optimizations.

A comment is left in `go.mk` to mention this and avoid any
confusion when reading "ifeq ARMv8 ? GOARM = 7".

Signed-off-by: Michael Baudino <michael@baudi.no>
---
 package/go/go.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git package/go/go.mk package/go/go.mk
index d9f4905..55964cb 100644
--- package/go/go.mk
+++ package/go/go.mk
@@ -39,6 +39,8 @@ else ifeq ($(BR2_ARM_CPU_ARMV6),y)
 GO_GOARM = 6
 else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 GO_GOARM = 7
+else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+GO_GOARM = 7 # Go doesn't support GOARM=8 yet (see https://github.com/golang/go/issues/29373)
 endif
 else ifeq ($(BR2_aarch64),y)
 GO_GOARCH = arm64
--
2.7.4
