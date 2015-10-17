From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 15:09:08 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain: like glibc,
	musl always provides SSP support
In-Reply-To: <1445087350-4947-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445087350-4947-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1445087350-4947-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure BR2_TOOLCHAIN_USES_MUSL selects BR2_TOOLCHAIN_HAS_SSP since
musl always provides SSP support (like glibc).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.6.2
