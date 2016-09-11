From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:34:53 +0200
Subject: [Buildroot] [git commit] openal: add upstream patch to fix FPU
	related build failures
Message-ID: <20160911204644.B959081F75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb0a68c4fa4c2a6cd911f71543769991c2ca80a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/b57/b5777a0ed33f6bb7a5fc0486ea21ecef58615dac/build-end.log

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
[Thomas:
 - download patch directly from Github.
 - add reference to autobuilder failure.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openal/openal.hash | 1 +
 package/openal/openal.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index 260f1b7..a0ebbf0 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	a341f8542f1f0b8c65241a17da13d073f18ec06658e1a1606a8ecc8bbc2b3314	openal-soft-1.17.2.tar.bz2
+sha256	9c9040269376aba77b1277bbae0f055aee535e14ad4a3ab4e66e39830504e83f	27916ce3db023454a0295ee63ea196fbc246674c.patch
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 2916aa6..c9ca934 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -7,6 +7,8 @@
 OPENAL_VERSION = 1.17.2
 OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
 OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
+OPENAL_PATCH = \
+	https://github.com/kcat/openal-soft/commit/27916ce3db023454a0295ee63ea196fbc246674c.patch
 OPENAL_LICENSE = LGPLv2+
 OPENAL_LICENSE_FILES = COPYING
 OPENAL_INSTALL_STAGING = YES
