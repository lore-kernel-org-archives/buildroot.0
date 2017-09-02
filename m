From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:44 -0000
Subject: [Buildroot] [git commit] package/luvi: bump version to 2.7.6
Message-ID: <20170902130616.4AA1080424@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee895bdc1066ec0147880caf4f4bfa41e2da54ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched to github helper because upstream does not provide the tarball
anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luvi/luvi.hash | 2 +-
 package/luvi/luvi.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 99fd69e..7f7abdb 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b36a3b96ec5852398338bc38567c5bb589783487c65130e1d702ff98fac3a6b7  luvi-src-v2.7.5.tar.gz
+sha256 65d3ded5007d5bb58fc3b76013913596fd42ed7326310d67c668ddf9a017a179  luvi-v2.7.6.tar.gz
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 956c37f..7dd5e5a 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.7.5
-LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
-LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
+LUVI_VERSION = v2.7.6
+LUVI_SITE = $(call github,luvit,luvi,$(LUVI_VERSION))
 LUVI_LICENSE = Apache-2.0
 LUVI_LICENSE_FILES = LICENSE.txt
 LUVI_DEPENDENCIES = libuv luajit luv host-luajit
