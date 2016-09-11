From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 12 Sep 2016 09:19:03 +1200
Subject: [Buildroot] [PATCH] micropython: add upstream patch to fix build
	failures
Message-ID: <20160911211903.21933-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows micropython to build with a host python version of 2.6.

Fixes:
  http://autobuild.buildroot.net/results/212cee82cc9db81cf1524925d106e01fc1e62ce5
  http://autobuild.buildroot.net/results/4f72a602702f4eac1fe8c4a385ebfeb6e1c50df2

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
I wasn't sure whether to use MICROPYTHON_PATCH += or the line continuation that
I ended up using. I couldn't find an example of either case. Murphy's law
dictates that I've probably chosen wrong so I'd be happy to resubmit with the
other style.

 package/micropython/micropython.hash | 1 +
 package/micropython/micropython.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index a8ad2ba..28c008d 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,4 @@
 #locally computed
 sha256 871378fcf1f1042c399896d5673da67d12e1fb36c2e706af289fc959bc8f7a57  micropython-v1.8.3.tar.gz
 sha256 ff3194ebecda99023d7c1bb94d32b31b9491e95a79958a25ffd05213c5553acc  8c6856d2e76c5865d9f30cad2c51615d4a1a1418.patch
+sha256 ac19af8587211d7229074fefa1a3a3c0fe807babc7cf9ce53606f05958699448  a50b26e4b00ed094aa1ac74eac2fc2d8eb9ea1ed.patch
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 590956e..2f47ad8 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -9,7 +9,8 @@ MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
-MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/8c6856d2e76c5865d9f30cad2c51615d4a1a1418.patch
+MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/8c6856d2e76c5865d9f30cad2c51615d4a1a1418.patch \
+	https://github.com/micropython/micropython/commit/a50b26e4b00ed094aa1ac74eac2fc2d8eb9ea1ed.patch
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
-- 
2.9.2.518.ged577c6.dirty
