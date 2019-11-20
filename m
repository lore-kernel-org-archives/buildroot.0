From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:34 +0000
Subject: [Buildroot] [RFC PATCH v3 20/30] package/x11r7/xcb-util: Add host
 package.
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-21-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/x11r7/xcb-util/xcb-util.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index bb73530f94..9a4f927364 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -11,5 +11,7 @@ XCB_UTIL_LICENSE = MIT
 XCB_UTIL_LICENSE_FILES = COPYING
 XCB_UTIL_INSTALL_STAGING = YES
 XCB_UTIL_DEPENDENCIES = libxcb
+HOST_XCB_UTIL_DEPENDENCIES = host-libxcb
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
