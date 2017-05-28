From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:45:20 +0200
Subject: [Buildroot] [git commit] package/kodi: security bump to version 17.3
Message-ID: <20170528134532.15F94827D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f9190f14e821a90cae690b1741eee4efd9b661b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://kodi.tv/article/kodi-v173-minor-bug-fix-and-security-release

"Fix possible security flaw which could abused .zip files which try to
 traverse to a parent directory"

For details about the security bug refer to
http://blog.checkpoint.com/2017/05/23/hacked-in-translation/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
 package/kodi/kodi.hash                                   | 2 +-
 package/kodi/kodi.mk                                     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 5f1a55d..217b395 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 17.1-Krypton
+KODI_JSONSCHEMABUILDER_VERSION = 17.3-Krypton
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_LICENSE = GPL-2.0
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index c6d3b05..7c3e82a 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 17.1-Krypton
+KODI_TEXTUREPACKER_VERSION = 17.3-Krypton
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_LICENSE = GPL-2.0
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 5e76fc5..167b179 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 303f3903cbb57ccc2961f09cf3746505542bcb129a464f0687d7ca8601cebbee  kodi-17.1-Krypton.tar.gz
+sha256 1de8653a3729cefd1baaf09ecde5ace01a1e3a58fbf29d48c1363f2503d331a1  kodi-17.3-Krypton.tar.gz
 # Locally computed - libdvdcss
 sha256 b6eb2d929ff56cb051152c32010afc5e7cf5fe8c5ae32dca412a2b46b6b57e34  2f12236.tar.gz
 # Locally computed - libdvdnav
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 0b89bdd..2636a0b 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION = 17.1-Krypton
+KODI_VERSION = 17.3-Krypton
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
 KODI_LICENSE_FILES = LICENSE.GPL
