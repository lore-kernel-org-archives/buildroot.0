From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 08:05:05 +0200
Subject: [Buildroot] [git commit] barebox: fix ARCH value for arm64
Message-ID: <20160816062550.097D9801E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbe71a699abc65492a677682af21aa43286af397
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

barebox 2016.08 added arm64 support using ARCH=arm.

[Peter: extend commit message to clarify]
Signed-off-by: Raphael Poggi <poggi.raph@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 832297e..7a110d2 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -61,6 +61,8 @@ else ifeq ($$(KERNEL_ARCH),x86_64)
 $(1)_ARCH = x86
 else ifeq ($$(KERNEL_ARCH),powerpc)
 $(1)_ARCH = ppc
+else ifeq ($$(KERNEL_ARCH),arm64)
+$(1)_ARCH = arm
 else
 $(1)_ARCH = $$(KERNEL_ARCH)
 endif
