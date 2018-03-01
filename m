From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Mar 2018 23:15:34 +0100
Subject: [Buildroot] [git commit branch/next] package/libvpx: bump version
 to 1.7.0
Message-ID: <20180301222104.168C4814D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2682d77d1a7eee678a974e33d14eb4559225cf33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switched _SITE to github, current _SITE is broken.

The URL
https://chromium.googlesource.com/webm/libvpx/+archive/v1.7.0.tar.gz

proposed by upstream
https://storage.googleapis.com/downloads.webmproject.org/releases/webm/index.html

provides archives with different hashes for each download so we use
Github instead.

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvpx/libvpx.hash | 4 +++-
 package/libvpx/libvpx.mk   | 5 ++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index 95ff3a8082..1397b62f7b 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,2 +1,4 @@
 # Locally computed:
-sha256 1c2c0c2a97fba9474943be34ee39337dee756780fc12870ba1dc68372586a819  libvpx-1.6.1.tar.bz2
+sha256 1fec931eb5c94279ad219a5b6e0202358e94a93a90cfb1603578c326abfc1238  libvpx-v1.7.0.tar.gz
+sha256 8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
+sha256 cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 24c39032e4..0f867eb2a9 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.6.1
-LIBVPX_SOURCE = libvpx-$(LIBVPX_VERSION).tar.bz2
-LIBVPX_SITE = http://storage.googleapis.com/downloads.webmproject.org/releases/webm
+LIBVPX_VERSION = v1.7.0
+LIBVPX_SITE = $(call github,webmproject,libvpx,$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
 LIBVPX_INSTALL_STAGING = YES
