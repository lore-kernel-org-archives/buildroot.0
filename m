From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:34 +0200
Subject: [Buildroot] [PATCH 17/32 v2] package/matchbox-fakekey: add missing
	dependency
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <aa1fda68b9700494f20b4bb6e4ecb998416aaab1.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox-fakekey build-depends on xlib_libXtst, but does not select it.

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox-fakekey/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/matchbox-fakekey/Config.in b/package/matchbox-fakekey/Config.in
index c0cde42..97413ab 100644
--- a/package/matchbox-fakekey/Config.in
+++ b/package/matchbox-fakekey/Config.in
@@ -1,3 +1,4 @@
 config BR2_PACKAGE_MATCHBOX_FAKEKEY
 	bool
 	select BR2_PACKAGE_MATCHBOX_LIB
+	select BR2_PACKAGE_XLIB_LIBXTST
-- 
1.9.1
