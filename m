From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 10:01:50 +0200
Subject: [Buildroot] [git commit] luvi: fetch uploaded release tarball
Message-ID: <20171021080214.5FF1F80286@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ee8ebe25b2fb8371b55c6fcc187d8f374ada97c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream has finally released an uploaded tarball, which is prefered
over cloning the repository from github.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luvi/luvi.hash | 2 +-
 package/luvi/luvi.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index ce3785e..e2239b6 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6d2297751b4d4023c1fa8b723b6f04e09584c67694958edbfa0d284f384759d5  luvi-v2.7.6.tar.gz
+sha256  ce9a1fb762e61267618ddea9ea129170fd543bb918c382b71cb35985d0024c42  luvi-src-v2.7.6.tar.gz
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index fc89d4d..a2bc218 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LUVI_VERSION = v2.7.6
-LUVI_SITE = git://github.com/luvit/luvi.git
-LUVI_GIT_SUBMODULES = YES
+LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
+LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
 LUVI_LICENSE_FILES = LICENSE.txt
 LUVI_DEPENDENCIES = libuv luajit luv host-luajit
