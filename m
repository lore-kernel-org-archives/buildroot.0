From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Feb 2021 14:54:45 +0100
Subject: [Buildroot] [PATCHv2 2/7] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <20210212135451.22786-1-patrickdepinguin@gmail.com>
References: <20210212135451.22786-1-patrickdepinguin@gmail.com>
Message-ID: <20210212135451.22786-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

A common way to disable runtime assertions is by honoring the 'NDEBUG'
preprocessor flag. Set it when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
default case).

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/Makefile.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 51f5cbce4f..9a18c05c6f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -145,6 +145,9 @@ endif
 ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING = -g3
 endif
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
+TARGET_DEBUGGING += -DNDEBUG
+endif
 
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
-- 
2.26.2
