From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Dec 2014 23:22:09 +0100
Subject: [Buildroot] [PATCH 3/4] toolchain: add dependency to fake libssp if
	needed
In-Reply-To: <cover.1419977553.git.yann.morin.1998@free.fr>
References: <cover.1419977553.git.yann.morin.1998@free.fr>
Message-ID: <632b7633b9a7247c9f56a452354a96b398088107.1419977553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some brain-damaged pakages (mostly proprietary) may insist on linking
to it, either at build time, or at runtime (e.g. pre-built binaries).

Add a conditional dependency to the newly-introduced libssp-fake.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain/toolchain.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index c22713b..12fa352 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -10,6 +10,10 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_DEPENDENCIES += toolchain-external
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSSP_FAKE),y)
+TOOLCHAIN_DEPENDENCIES += libssp-fake
+endif
+
 TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 $(eval $(virtual-package))
-- 
1.9.1
