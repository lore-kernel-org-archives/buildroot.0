From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 21:38:45 +0100
Subject: [Buildroot] [git commit] barebox: fix compilation on x86-64
	architecture
Message-ID: <20150304211116.10B0080756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f31f411883eca64eccff802a85f5c9c5a219ac6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Barebox uses KERNEL_ARCH to derive BAREBOX_ARCH, but doesn't
currently handle the case of the x86-64 architecture. In this
case KERNEL_ARCH is x86_64, but BAREBOX_ARCH should be x86
nonetheless.

Signed-off-by: Fabien Lahoudere <fabienlahoudere.pro@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index b829ae7..5809fb0 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -41,6 +41,8 @@ endif
 
 ifeq ($(KERNEL_ARCH),i386)
 BAREBOX_ARCH = x86
+else ifeq ($(KERNEL_ARCH),x86_64)
+BAREBOX_ARCH = x86
 else ifeq ($(KERNEL_ARCH),powerpc)
 BAREBOX_ARCH = ppc
 else
