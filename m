From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  5 Apr 2020 00:06:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/bubblewrap: security bump to
 version 0.4.1
Message-ID: <20200404220648.1543017-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2020-5291: Bubblewrap (bwrap) before version 0.4.1, if installed
in setuid mode and the kernel supports unprivileged user namespaces,
then the `bwrap --userns2` option can be used to make the setuid process
keep running as root while being traceable. This can in turn be used to
gain root permissions. Note that this only affects the combination of
bubblewrap in setuid mode (which is typically used when unprivileged
user namespaces are not supported) and the support of unprivileged user
namespaces.

Also update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bubblewrap/bubblewrap.hash | 4 ++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index 6914a1ccd7..d3ccb4cb1f 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 e5fe7d2f74bd7029b5306b0b70587cec31f74357739295e5276b4a3718712023 bubblewrap-0.4.0.tar.xz
+sha256  b9c69b9b1c61a608f34325c8e1a495229bacf6e4a07cbb0c80cf7a814d7ccc03  bubblewrap-0.4.1.tar.xz
 
 # Hash for license files:
-sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c COPYING
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 3da00a700d..388f64880e 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.4.0
+BUBBLEWRAP_VERSION = 0.4.1
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
-- 
2.25.1
