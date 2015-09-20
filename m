From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:26:03 +0200
Subject: [Buildroot] [git commit] micropython: Add upstream patch to fix
	64-bit builds
Message-ID: <20150920122609.7EEA580770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bccecbe1e65fa8d63251175feea405d6c665ae57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following error when building for a 64-bit target

  ../py/objint_mpz.c:54:5: error: right shift count >= width of type [-Werror]
       (MP_SSIZE_MAX >> MPZ_DIG_SIZE * 4) & DIG_MASK,
       ^
  ../py/objint_mpz.c:54:5: error: initializer element is not constant
  ../py/objint_mpz.c:54:5: error: (near initialization for 'maxsize_dig[4]')

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/micropython/micropython.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 6266882..f2ad5bf 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -9,6 +9,7 @@ MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
+MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/8b4fb4fe140e9cf57fcfa258d0d2d6fe19090fc5.patch
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
