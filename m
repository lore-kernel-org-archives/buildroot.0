From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Oct 2017 13:48:45 +0200
Subject: [Buildroot] [git commit] sdl2: security bump to version 2.0.7
Message-ID: <20171027114555.D12B07F8A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07a9f0200cfd1c34f33e8054f62b990d05ccb934
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-2888 - An exploitable integer overflow vulnerability exists
when creating a new RGB Surface in SDL 2.0.5.  A specially crafted file can
cause an integer overflow resulting in too little memory being allocated
which can lead to a buffer overflow and potential code execution.  An
attacker can provide a specially crafted image file to trigger this
vulnerability.

Also add a hash for the license file while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.hash | 6 ++++--
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
index c0a8bfc..588f8f4 100644
--- a/package/sdl2/sdl2.hash
+++ b/package/sdl2/sdl2.hash
@@ -1,2 +1,4 @@
-# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.6.tar.gz.sig
-sha256 03658b5660d16d7b31263a691e058ed37acdab155d68dabbad79998fb552c5df  SDL2-2.0.6.tar.gz
+# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.7.tar.gz.sig
+sha256 ee35c74c4313e2eda104b14b1b86f7db84a04eeab9430d56e001cea268bf4d5e  SDL2-2.0.7.tar.gz
+# Locally calculated
+sha256 bbd2edb1789c33de29bb9f8d1dbe2774584a9ce8c4e3162944b7a3a447f5e85d  COPYING.txt
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index fa3b57e..3e3ba54 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_VERSION = 2.0.6
+SDL2_VERSION = 2.0.7
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
