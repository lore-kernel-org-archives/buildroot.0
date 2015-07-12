From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Jul 2015 18:26:34 +0200
Subject: [Buildroot] [PATCH 5/6] support/dependencies: add host-patchelf to
	DEPENDENCIES_HOST_PREREQ
In-Reply-To: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
References: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436718395-10536-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is necessary to unconditionally make sure patchelf is built and
installed in the host tree.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 support/dependencies/dependencies.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 8232721..b290e0b 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -16,6 +16,8 @@ $(shell support/dependencies/check-host-$(1).sh $(2))
 endef
 -include $(sort $(wildcard support/dependencies/check-host-*.mk))
 
+DEPENDENCIES_HOST_PREREQ += host-patchelf
+
 ifeq ($(BR2_STRIP_sstrip),y)
 DEPENDENCIES_HOST_PREREQ += host-sstrip
 endif
-- 
2.4.5
