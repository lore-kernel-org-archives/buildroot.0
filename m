From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Jun 2021 18:38:10 +0200
Subject: [Buildroot] [git commit] package/harfbuzz: bump to version 2.8.1
Message-ID: <20210613161235.06FDA7F893@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9ba1c80e8ebf5f5ad9d889d2dd37f27af87e811
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove unknown option fontconfig

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/harfbuzz/0001-meson.build-check-for-pthread.h.patch | 9 +--------
 package/harfbuzz/harfbuzz.hash                              | 2 +-
 package/harfbuzz/harfbuzz.mk                                | 4 +---
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch b/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
index 6d7225cbb0..9fa09863c6 100644
--- a/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
+++ b/package/harfbuzz/0001-meson.build-check-for-pthread.h.patch
@@ -26,7 +26,7 @@ diff --git a/meson.build b/meson.build
 index bf3925db..6d263d48 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -281,13 +281,15 @@ endif
+@@ -281,7 +281,9 @@ endif
  # threads
  thread_dep = null_dep
  if host_machine.system() != 'windows'
@@ -37,13 +37,6 @@ index bf3925db..6d263d48 100644
  
    if thread_dep.found()
      conf.set('HAVE_PTHREAD', 1)
-   else
-     check_headers += ['sched.h']
--    check_funcs += ['sched_yield', {'link_with': 'rt'}]
-+    check_funcs += [['sched_yield', {'link_with': 'rt'}]]
-   endif
- endif
- 
 -- 
 2.29.2
 
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 98b137c8bd..ad81b34fd6 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6ad11d653347bd25d8317589df4e431a2de372c0cf9be3543368e07ec23bb8e7  harfbuzz-2.7.4.tar.xz
+sha256  4124f663ec4bf4e294d9cf230668370b4249a48ff34deaf0f06e8fc82d891300  harfbuzz-2.8.1.tar.xz
 sha256  beb3f017ceb41387667f78237a7cecf84defa0ed257c505894663d6a9f13211b  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index f1ef7ee953..60cc8b7247 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.7.4
+HARFBUZZ_VERSION = 2.8.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
@@ -12,7 +12,6 @@ HARFBUZZ_LICENSE_FILES = COPYING
 HARFBUZZ_CPE_ID_VENDOR = harfbuzz_project
 HARFBUZZ_INSTALL_STAGING = YES
 HARFBUZZ_CONF_OPTS = \
-	-Dfontconfig=disabled \
 	-Dgdi=disabled \
 	-Ddirectwrite=disabled \
 	-Dcoretext=disabled \
@@ -31,7 +30,6 @@ HOST_HARFBUZZ_CONF_OPTS = \
 	-Dglib=enabled \
 	-Dgobject=disabled \
 	-Dcairo=disabled \
-	-Dfontconfig=disabled \
 	-Dicu=disabled \
 	-Dgraphite=disabled \
 	-Dfreetype=enabled \
