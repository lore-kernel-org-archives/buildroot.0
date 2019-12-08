From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  8 Dec 2019 13:38:48 -0800
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix
 0003-remove-cpp-requirement.patch
Message-ID: <20191208213848.946171-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This patch was missing the following section:

@@ -1,4 +1,4 @@
-project('glib', 'c', 'cpp',
+project('glib', 'c',
   version : '2.62.3',
   # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
   meson_version : '>= 0.49.2',

As such, the package still depended on g++.

Update the patch to add the above section.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libglib2/0003-remove-cpp-requirement.patch | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index a96a94043c..80c6c80236 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -12,9 +12,9 @@ Upstream status: Denied (Buildroot specific)
 https://gitlab.gnome.org/GNOME/glib/issues/1748
 ---
  glib/glibconfig.h.in |  1 -
- meson.build          | 16 ----------------
+ meson.build          | 18 +-----------------
  tests/meson.build    |  5 -----
- 3 files changed, 22 deletions(-)
+ 3 files changed, 1 insertion(+), 23 deletions(-)
 
 diff --git a/glib/glibconfig.h.in b/glib/glibconfig.h.in
 index 7ef8c48..128e65d 100644
@@ -29,9 +29,15 @@ index 7ef8c48..128e65d 100644
  /* gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
   * is passed ISO vararg support is turned off, and there is no work
 diff --git a/meson.build b/meson.build
-index 83774d0..99806d0 100644
+index 4bbf4c2..ac59f4e 100644
 --- a/meson.build
 +++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('glib', 'c', 'cpp',
++project('glib', 'c',
+   version : '2.62.3',
+   # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
+   meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
  )
  
-- 
2.23.0
