From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Tue, 13 Sep 2016 21:06:24 +0200
Subject: [Buildroot] [PATCH] openal: Use upstream patch to fix aarch64 build
Message-ID: <1473793584-24300-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/openal/openal.hash | 1 +
 package/openal/openal.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index 88556ba..45f1421 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -3,3 +3,4 @@ sha256	a341f8542f1f0b8c65241a17da13d073f18ec06658e1a1606a8ecc8bbc2b3314	openal-s
 sha256	9c9040269376aba77b1277bbae0f055aee535e14ad4a3ab4e66e39830504e83f	27916ce3db023454a0295ee63ea196fbc246674c.patch
 sha256	4621f6b79d4bbac5ce423f227c92ad1e4f833d7e1f2ff1cc3b5f03721f75b933	a52cfc804813aef8e4b304e20cf843fa6907af6c.patch
 sha256	f442da31b4001a5133f2762a5bc1e780b11d5e2d9f21b257f54695ee6d87d997	c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1.patch
+sha256	3691c1a327b87d5fb487841459fd00d3baaa79808ecb5e3b33b349363663640f	46b3e1d08ca10e809eb2e20b6371812958b97e1f.patch
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 71117fa..356f2c1 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -10,7 +10,8 @@ OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
 OPENAL_PATCH = \
 	https://github.com/kcat/openal-soft/commit/27916ce3db023454a0295ee63ea196fbc246674c.patch \
 	https://github.com/kcat/openal-soft/commit/a52cfc804813aef8e4b304e20cf843fa6907af6c.patch \
-	https://github.com/kcat/openal-soft/commit/c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1.patch
+	https://github.com/kcat/openal-soft/commit/c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1.patch \
+	https://github.com/kcat/openal-soft/commit/46b3e1d08ca10e809eb2e20b6371812958b97e1f.patch
 OPENAL_LICENSE = LGPLv2+
 OPENAL_LICENSE_FILES = COPYING
 OPENAL_INSTALL_STAGING = YES
-- 
2.7.4
