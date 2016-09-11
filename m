From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:36:24 +0200
Subject: [Buildroot] [git commit] openal: use upstream patch to detect
	run-time NEON support
Message-ID: <20160911204644.C36E07FA50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=349ae0df0656dd103583126d682f89629a7351cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
[Thomas: download patches directly from Github.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openal/openal.hash | 2 ++
 package/openal/openal.mk   | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index a0ebbf0..88556ba 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,3 +1,5 @@
 # Locally calculated
 sha256	a341f8542f1f0b8c65241a17da13d073f18ec06658e1a1606a8ecc8bbc2b3314	openal-soft-1.17.2.tar.bz2
 sha256	9c9040269376aba77b1277bbae0f055aee535e14ad4a3ab4e66e39830504e83f	27916ce3db023454a0295ee63ea196fbc246674c.patch
+sha256	4621f6b79d4bbac5ce423f227c92ad1e4f833d7e1f2ff1cc3b5f03721f75b933	a52cfc804813aef8e4b304e20cf843fa6907af6c.patch
+sha256	f442da31b4001a5133f2762a5bc1e780b11d5e2d9f21b257f54695ee6d87d997	c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1.patch
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index c9ca934..71117fa 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -8,7 +8,9 @@ OPENAL_VERSION = 1.17.2
 OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
 OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
 OPENAL_PATCH = \
-	https://github.com/kcat/openal-soft/commit/27916ce3db023454a0295ee63ea196fbc246674c.patch
+	https://github.com/kcat/openal-soft/commit/27916ce3db023454a0295ee63ea196fbc246674c.patch \
+	https://github.com/kcat/openal-soft/commit/a52cfc804813aef8e4b304e20cf843fa6907af6c.patch \
+	https://github.com/kcat/openal-soft/commit/c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1.patch
 OPENAL_LICENSE = LGPLv2+
 OPENAL_LICENSE_FILES = COPYING
 OPENAL_INSTALL_STAGING = YES
