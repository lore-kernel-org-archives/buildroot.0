From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:35:42 +0200
Subject: [Buildroot] [git commit] toolchain: like glibc,
	musl always provides SSP support
Message-ID: <20151018133601.B77DE80DF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e811f5154944147e4fceb8d199321aba91070587
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure BR2_TOOLCHAIN_USES_MUSL selects BR2_TOOLCHAIN_HAS_SSP since
musl always provides SSP support (like glibc).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index a851ce4..fc30c6e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -27,6 +27,7 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_HAS_SSP
 
 choice
 	prompt "Toolchain type"
