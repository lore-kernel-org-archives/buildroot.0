From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Jul 2015 18:26:35 +0200
Subject: [Buildroot] [PATCH 6/6] package/pkg-generic.mk: add
	POST_HOST_INSTALL_FIX_RPATH to the POST_INSTALL_HOOKS
In-Reply-To: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
References: <1436718395-10536-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436718395-10536-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This hook is only set for host-package.

From now, all host programs' RPATH will be correctly set, allowing to
relocate the toolchain.

This is a first step for the relocatable SDK.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9fe01b8..9d9ac5a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -492,6 +492,8 @@ endif
 $(1)-install-host:      	$$($(2)_TARGET_INSTALL_HOST)
 $$($(2)_TARGET_INSTALL_HOST):	$$($(2)_TARGET_BUILD)
 
+$(2)_POST_INSTALL_HOOKS += POST_HOST_INSTALL_FIX_RPATH
+
 $(1)-build:		$$($(2)_TARGET_BUILD)
 $$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE)
 
-- 
2.4.5
