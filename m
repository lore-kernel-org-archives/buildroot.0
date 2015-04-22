From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:27 +0200
Subject: [Buildroot] [PATCH 16/30] package/matchbox-fakekey: add missing
	dependency
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <77c2f1a456664204e74551ed55c4a6578d94874d.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox-fakekey build-depends on xlib_libXtst, but does not select it.

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox-fakekey/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/matchbox/matchbox-fakekey/Config.in b/package/matchbox/matchbox-fakekey/Config.in
index 334f3a2..4708292 100644
--- a/package/matchbox/matchbox-fakekey/Config.in
+++ b/package/matchbox/matchbox-fakekey/Config.in
@@ -1,2 +1,3 @@
 config BR2_PACKAGE_MATCHBOX_FAKEKEY
 	bool
+	select BR2_PACKAGE_XLIB_LIBXTST
-- 
1.9.1
