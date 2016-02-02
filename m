From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 10:20:46 +0100
Subject: [Buildroot] [git commit] package/ola: fix musl build
Message-ID: <20160202092359.333458166B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8424a6ad6ad4d3828312a4a1b357ba08f911d8f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/17f/17fe88868acdbba074561da14c4417e31d506823/
http://autobuild.buildroot.net/results/d99/d99ca60cc4bf86c338fd61f9fd2de0bb9598d670/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: switch to using the upstreamed Github patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ola/ola.hash | 1 +
 package/ola/ola.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ola/ola.hash b/package/ola/ola.hash
index f8e0b5f..628b525 100644
--- a/package/ola/ola.hash
+++ b/package/ola/ola.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 74baba18c5b62aba15e27e6b7882c6eac22043c8e7b297e4d2f6eb05dd1a33b0 ola-0.10.0.tar.gz
+sha256 32a8a7a00c7db7647710c84ed02611f2eba99669f2de4da7aceae9d4444f53a3 34999c70dcbe2d38bf13d57c9cfbdc63f0899b9a.patch
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index fa897fe..a983459 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -6,7 +6,7 @@
 
 OLA_VERSION = 0.10.0
 OLA_SITE = $(call github,OpenLightingProject,ola,$(OLA_VERSION))
-
+OLA_PATCH = https://github.com/OpenLightingProject/ola/commit/34999c70dcbe2d38bf13d57c9cfbdc63f0899b9a.patch
 OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = LICENCE GPL LGPL
 OLA_INSTALL_STAGING = YES
