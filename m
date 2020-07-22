From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 22:45:46 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libglib2:
 security bump to 2.62.5
Message-ID: <20200722211134.2677488276@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14e589aadb42f07f2a6e5d08bb9db325ee1d0ca2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

* Fix SOCKS proxy resolver sometimes not being used when resolving addresses
  via Happy Eyeballs (CVE-2020-6750) (#1989)

* Fix potential relative read when calling g_printerr(), which could lead to a
  denial of service from a setuid-root process being used to block access to the
  TTY for another user (#1919)

* Several race condition/crash fixes (!1353, !1357)

For more details, see the NEWS file:
https://download.gnome.org/sources/glib/2.62/glib-2.62.5.news

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Peter: describe security issues]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/0003-remove-cpp-requirement.patch | 2 +-
 package/libglib2/libglib2.hash                     | 4 ++--
 package/libglib2/libglib2.mk                       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index d28f8ab81c..77589e6909 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.62.4',
+   version : '2.62.5',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index e3478f06bb..0a60b75f82 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.62/glib-2.62.4.sha256sum
-sha256  4c84030d77fa9712135dfa8036ad663925655ae95b1d19399b6200e869925bbc  glib-2.62.4.tar.xz
+# https://download.gnome.org/sources/glib/2.62/glib-2.62.5.sha256sum
+sha256  b8d1cdafa46658b63d7512efbe2cd21bd36cd7be83140e44930c47b79f82452e  glib-2.62.5.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index a206639f74..42b608fd72 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.62
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
