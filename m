From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  3 Feb 2018 18:05:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/wf111: fix armv5 URL
In-Reply-To: <cover.1517677545.git.yann.morin.1998@free.fr>
References: <cover.1517677545.git.yann.morin.1998@free.fr>
Message-ID: <a39a7268f72dfab7e861038b75feb065f0d160c5.1517677545.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit b857c7481 (package/wf111: bump to version 5.2.2-r3) forgot to
completely update the archive name for the armv5te variant.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien CORJON <corjon.j@ecagroup.com>
Cc: Antoine T?nart <antoine.tenart@free-electrons.com>
---
 package/wf111/wf111.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
index ed55672136..5178944fa3 100644
--- a/package/wf111/wf111.mk
+++ b/package/wf111/wf111.mk
@@ -16,7 +16,7 @@ endif
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 WF111_SOURCE = wf111-linux-driver-$(WF111_VERSION)-armv7-a.tar.gz
 else ifeq ($(BR2_ARM_CPU_ARMV5),y)
-WF111_SOURCE = wf111-linux-driver-$(WF111_VERSION)-armv5t.tar.gz
+WF111_SOURCE = wf111-linux-driver-$(WF111_VERSION)-armv5te.tar.gz
 else ifeq ($(BR2_i386),y)
 WF111_SOURCE = wf111-linux-driver-$(WF111_VERSION)-x86.tar.gz
 endif
-- 
2.14.1
